const fs = require('fs');
const path = require('path');

const mermaidStart = '```mermaid';
const mermaidEnd = '```';

const { execSync } = require('child_process');

const repoRootRelative = (() => {
  try {
    const output = execSync('git rev-parse --show-cdup', { encoding: 'utf8' });
    return output.trim() || '.';
  } catch (error) {
    console.error('Not a git repository or error occurred.');
    return '.';
  }
})();
console.log('Repository root (relative):', repoRootRelative);


function getDirTree(dir, parent, lines) {
  const files = fs.readdirSync(dir, { withFileTypes: true });
  files.forEach(f => {
    if (f.name.startsWith('.')) return; // skip dotfiles/folders except .github/.vscode
    if (['node_modules', '.git'].includes(f.name)) return;
    const fullPath = path.join(dir, f.name);
    const label = f.name.endsWith('/') ? f.name : f.name;
    const node = (dir === '.' ? '' : dir.replace('./', '').replace(/\//g, '').toUpperCase() + '_') + f.name.replace(/\W/g, '').toUpperCase();
    lines.push(`    ${parent} --> ${node}["${f.name}${f.isDirectory() ? '/' : ''}"]`);
    if (f.isDirectory()) {
      getDirTree(fullPath, node, lines);
    }
  });
}

function generateMermaid() {
  const lines = [];
  lines.push('%% Repository Structure');
  // Add Mermaid directive to double vertical spacing between rows
  lines.push('graph LR;');
  lines.push('    %% Double vertical spacing');
  lines.push('    classDef doubledSpacing height:60px;'); // Mermaid class for spacing

  lines.push('    ROOT["/ (root)"]:::doubledSpacing');
  getDirTreeWithSpacing(repoRootRelative, 'ROOT', lines);
  return lines.join('\n');
}

// Helper to add doubledSpacing class to each node
function getDirTreeWithSpacing(dir, parent, lines) {
  const files = fs.readdirSync(dir, { withFileTypes: true });
  files.forEach(f => {
    if (f.name.startsWith('.')) return;
    if (['node_modules', '.git'].includes(f.name)) return;
    const fullPath = path.join(dir, f.name);
    const node = (dir === '.' ? '' : dir.replace('./', '').replace(/\//g, '').toUpperCase() + '_') + f.name.replace(/\W/g, '').toUpperCase();
    lines.push(`    ${parent} --> ${node}["${f.name}${f.isDirectory() ? '/' : ''}"]:::doubledSpacing`);
    if (f.isDirectory()) {
      getDirTreeWithSpacing(fullPath, node, lines);
    }
  });
}

function updateReadme() {
  const readmePath = path.join(repoRootRelative, 'README.md');
  const readme = fs.readFileSync(readmePath, 'utf8');
  const mermaidGraph = generateMermaid();

  const newMermaidBlock = `${mermaidStart}\n\n${mermaidGraph}\n${mermaidEnd}`;
  const updated = readme.replace(
    /```mermaid[\s\S]*?```/m,
    newMermaidBlock
  );
  fs.writeFileSync(readmePath, updated);
}

updateReadme();