const https = require('https');
const core = require('@actions/core');

https.get('https://factorio.com/api/latest-releases', (res) => {
  const data = [];
  res.on('data', (chunk) => {
    data.push(chunk);
  });
  res.on('end', () => {
    const raw = Buffer.concat(data).toString();
    const versions = JSON.parse(raw);
    console.log(`Response from Factorio: ${raw}`);

    const type = core.getInput('version_type');
    core.setOutput('experimental', versions.experimental[type]);
    core.setOutput('stable', versions.stable[type]);
  });
}).on('error', (err) => {
  core.setFailed(err.message);
});
