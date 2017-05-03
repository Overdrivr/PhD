'use strict';

var glob = require('glob');
var shell = require('shelljs');
var async = require('async');

glob('**/*.svg', function (err, files) {
  console.log('Found ' + files.length + ' SVG figures to process');
    
  async.eachOfLimit(files, 5, function(filename, key, cb) {
	let f = filename.replace('.svg','');
    let cmd = 'inkscape --file='       + '"' + f + '.svg' + '"'
                    + ' --export-pdf=' + '"' + f + '.pdf' + '"';
    shell.exec(cmd, function(code, stdout, stderr) {
	  if (code != 0) return cb(Error(stderr));
      console.log('Fig name (' + code + '): ' + f);
	  cb();
    });
  }, function(err) {
	if (err) return console.log(err);
	console.log('All figures converted to PDF.');
  });
});
