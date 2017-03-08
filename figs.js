'use strict';

var glob = require('glob');
           require('shelljs/global');

glob("**/*.svg", function (err, files) {
  let amount = files.length;
  console.log('Found ' + amount + ' SVG figures to process');

  files.forEach(function(filename) {
    let f = filename.replace('.svg','');
    let command = 'inkscape --file='       + '"' + f + '.svg' + '"'
                        + ' --export-pdf=' + '"' + f + '.pdf' + '"';

    exec(command, function(code, stdout, stderr) {
      console.log('Fig name (' + code + '): ' + f);
    });
  });
})
