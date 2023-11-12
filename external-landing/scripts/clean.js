const fs = require('fs');

var currentPath = process.cwd();
if (currentPath.endsWith('external-landing')) {
  fs.rmSync(currentPath + '/dist', { recursive: true, force: true });
} else {
  console.error('Clean: current path contains unexpected value. Skipping.');
}
