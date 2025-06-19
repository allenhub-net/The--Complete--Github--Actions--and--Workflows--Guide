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
    if (f.name.startsWith('.') && f.name !== '.github') return;
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
  lines.push('graph LR;');
  lines.push('    %% Double vertical spacing');
  lines.push('    classDef doubledSpacing height:60px;');
  lines.push('    ROOT["/ (root)"]:::doubledSpacing');
  getDirTreeWithSpacing(repoRootRelative, 'ROOT', lines);
  return lines.join('\n');
}

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

// Accept target file as command-line argument
function updateTargetFile(targetFile) {
  const targetPath = path.join(repoRootRelative, targetFile);
  console.log('Target file path:', targetPath);
  const fileContent = fs.readFileSync(targetPath, 'utf8');
  const mermaidGraph = generateMermaid();

  const newMermaidBlock = `${mermaidStart}\n\n${mermaidGraph}\n${mermaidEnd}`;
  const updated = fileContent.replace(
    /```mermaid[\s\S]*?```/m,
    newMermaidBlock
  );
  fs.writeFileSync(targetPath, updated);
}

// Main
const targetFile = process.argv[2];
if (!targetFile) {
  console.error('Usage: node update-mermaid-graph.js <target-file-relative-to-repo-root>');
  process.exit(1);
}
updateTargetFile(targetFile);