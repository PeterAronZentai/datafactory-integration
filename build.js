var yaml = require('js-yaml');
var yamlinc = require('yaml-include');
var fs = require('fs');
var p = require('path');

// set the base file for relative includes
const baseFileName = process.argv.pop()
const baseFilePath = p.join(__dirname, baseFileName)
yamlinc.setBaseFile(baseFilePath)

var src = fs.readFileSync(yamlinc.basefile, 'utf8');

var obj = yaml.load(src, { schema: yamlinc.YAML_INCLUDE_SCHEMA, filename: yamlinc.basefile });

console.log(JSON.stringify(obj, undefined, 2));