/*
 * Remi Beges PhD final report
 */
module.exports = function (grunt) {
  'use strict';
  // Project configuration
  grunt.initConfig({
    latex: {
      pdf: {
        src: 'main.tex',
        options: {
          outputDirectory: 'dist/',
          jobname: 'phd',
          shellEscape: true
        }
      },
      bib: {
        src: 'dist/phd.aux',
        options: {
          engine: 'bibtex',
          interaction: false
        }
      }
    },
    shell: {
      glossary: {
        command: 'makeglossaries -d ./dist phd'
      },
      figs: {
        command: function() {
          return 'inkscape --file="' + grunt.config('shell.figs.src') + '" --export-pdf="' + grunt.config('shell.figs.src').replace('.svg', '.pdf') + '"';
        },
        src: '**/*.svg'
      }
    },
    execute: {
  		figs: {
  			src: ['figs.js']
  		}
  	},
    connect: {
      server: {
        options: {
          hostname: 'localhost',
          base: 'dist',
          open: 'http://localhost:8000/phd.pdf'
        }
      }
    },
    watch: {
      latex: {
        files: '**/*.tex',
        tasks: ['latex', 'shell:glossary', 'latex:pdf']
      },
      bibtex: {
        files: '**/*.bib',
        tasks: ['latex:bib', 'latex:pdf']
      },
      svgs: {
        files: '**/**.svg',
        tasks: ['shell:figs'],
        options: {
          spawn: false
        }
      },
      livereload: {
        options: {
          livereload: true
        },
        files: ['dist/phd.pdf'],
      },
    }
  });

  grunt.event.on('watch', function(action, filepath) {
    grunt.config('shell.figs.src', filepath);
  });

  // These plugins provide necessary tasks
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-connect');
  grunt.loadNpmTasks('grunt-latex');
  grunt.loadNpmTasks('grunt-shell');
  grunt.loadNpmTasks('grunt-execute');

  // Default task
  grunt.registerTask('default', ['execute:figs', 'watch']);
};
