const fs = require('fs');
const table = require('json-to-markdown');

function round(num) {
  return Math.floor(num * 100) / 100;
}

function formatBytes(bytes) {
  if (bytes > 1000 * 1000) return `${round(bytes / 1000 / 1000)} MB`;
  if (bytes > 1000) return `${round(bytes / 1000)} KB`;
  return `${bytes} B`;
}

const data = fs.readFileSync('data.txt', 'utf-8').split('\n').filter(Boolean).map(line => {
  const [bytes, url, ...nameParts] = line.split(' ');
  return { size: formatBytes(Number(bytes)), url, name: nameParts.join(' ') };
});

const columns = [
  'name',
  'url',
  'size',
];
console.log(table(data, columns));
