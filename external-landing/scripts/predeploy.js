const fs = require('fs');

var currentPath = process.cwd();
if (currentPath.endsWith('external-landing')) {
  const filesToCopy = [
    'favicon.ico',
    'index.html',
    'tailwind.css'
  ];

  fs.mkdirSync(currentPath + '/dist/');
  filesToCopy.forEach(file => fs.copyFileSync(currentPath + '/src/' + file, currentPath + '/dist/' + file));
} else {
  console.error('Predeploy: current path contains unexpected value. Skipping.');
}
