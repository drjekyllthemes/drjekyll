# encoding: utf-8

##
# use to test:
#  $ ruby -I ./lib ./lib/drjekyll.rb


## stdlibs
require 'pp'
require 'yaml'


## 3rd party gems
require 'props'        ## Use Env.home
require 'logutils'
require 'fetcher'


## more 3rd party gems
require 'zip'    # use $ gem install rubyzip
require 'gli'


# our own code

require 'drjekyll/version'    # note: version always goes first
require 'drjekyll/catalog'
require 'drjekyll/package'

require 'drjekyll/cli/opts'
require 'drjekyll/cli/main'
require 'drjekyll/cli/list'
require 'drjekyll/cli/download'
require 'drjekyll/cli/unzip'
require 'drjekyll/cli/new'


module DrJekyll

  def self.main
    exit Tool.new.run( ARGV )
  end

end  # module DrJekyll


## DrJekyll.banner  ## say hello

## for debugging
## pp Env.home
## pp DrJekyll.root

DrJekyll.main  if __FILE__ == $0
