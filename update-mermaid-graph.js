const fs = require('fs');
const path = require('path');

const mermaidStart = '```mermaid';
const mermaidEnd = '```';

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
  lines.push('graph TD;');
  lines.push('    ROOT["/ (root)"]');
  getDirTree('.', 'ROOT', lines);
  return lines.join('\n');
}

function updateReadme() {
  const readmePath = 'README.md';
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