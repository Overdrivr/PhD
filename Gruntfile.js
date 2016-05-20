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
          jobname: 'phd'
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
      livereload: {
        options: {
          livereload: true
        },
        files: ['dist/phd.pdf'],
      },
    }
  });

  // These plugins provide necessary tasks
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-connect');
  grunt.loadNpmTasks('grunt-latex');
  grunt.loadNpmTasks('grunt-shell');

  // Default task
  grunt.registerTask('default', ['connect', 'watch']);
};
