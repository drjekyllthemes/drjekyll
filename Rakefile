require 'hoe'
require './lib/drjekyll/version.rb'

Hoe.spec 'drjekyll' do

  self.version = DrJekyll::VERSION

  self.summary = "drjekyll - the missing static site theme package manager"
  self.description = summary

  self.urls    = ['https://github.com/drjekyllthemes/drjekyll']

  self.author  = 'Gerald Bauer'
  self.email   = 'wwwmake@googlegroups.com'

  # switch extension to .markdown for gihub formatting
  self.readme_file  = 'README.md'
  self.history_file = 'HISTORY.md'

  self.extra_deps = [
    ## 3rd party
    ['fetcher', '>= 0.4.5'],
  ]

  self.licenses = ['Public Domain']

  self.spec_extras = {
    required_ruby_version: '>= 1.9.2'
  }

end
