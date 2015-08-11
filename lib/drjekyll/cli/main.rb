# encoding: utf-8

### NOTE: wrap gli config into a class
##  see github.com/davetron5000/gli/issues/153

module DrJekyll

class Tool
  def initialize
    LogUtils::Logger.root.level = :info   # set logging level to info 
   end

  def run( args )
    puts DrJekyll.banner
    Toolii.run( args )
  end
end

## NOTE: gli added function are class methods (thus, wrap class Toolii in Tool for now)

class Toolii
  extend GLI::App

  def self.logger=(value) @@logger=value; end
  def self.logger()       @@logger; end

  ## todo: find a better name e.g. change to settings? config? safe_opts? why? why not?
  def self.opts=(value)  @@opts = value; end
  def self.opts()        @@opts; end


logger = LogUtils::Logger.root
opts   = Opts.new 


program_desc 'drjekyll command line tool'
version VERSION


desc 'Use only local (offline) cached data; no (online) remote network access'
switch [:l, :local], negatable: false

desc '(Debug) Show debug messages'
switch [:verbose], negatable: false    ## todo: use -w for short form? check ruby interpreter if in use too?

desc 'Only show warnings, errors and fatal messages'
switch [:q, :quiet], negatable: false



desc "List themes"
arg_name 'QUERY'   # optional search query/filter
command [:list,:ls,:l] do |c|

  c.action do |g,o,args|
    ## read in themes diretory    
    themes_dir = "#{DrJekyll.root}/test/data"
    catalog    = Catalog.new( "#{themes_dir}/themes.yml" )

    cmd = ListCommand.new( catalog, opts )
    cmd.run( args )
    puts 'Done.'
  end # action
end  # command list


## use get or fetch - why, why not??
desc "Download theme; saved in ~/.drjekyll/cache"
arg_name 'NAME'   # required theme name
command [:download,:dl,:d,:get,:g] do |c|

  c.action do |g,o,args|
    ## read in themes diretory    
    themes_dir = "#{DrJekyll.root}/test/data"
    catalog    = Catalog.new( "#{themes_dir}/themes.yml" )

    cmd = DownloadCommand.new( catalog, opts )
    cmd.run( args )
    puts 'Done.'
  end # action
end  # command download


## use install or unzip/unpack - why, why not??
desc "Setup (unzip/unpack) theme; use archive in ~/.drjekyll/cache"
arg_name 'NAME'   # required theme name
command [:unpack,:pk,:p,:setup,:s] do |c|

  c.action do |g,o,args|
    ## read in themes diretory    
    themes_dir = "#{DrJekyll.root}/test/data"
    catalog    = Catalog.new( "#{themes_dir}/themes.yml" )

    cmd = UnzipCommand.new( catalog, opts )
    cmd.run( args )
   puts 'Done.'
  end # action
end  # command setup


desc "Download 'n' setup (unzip/unpack) theme"
arg_name 'NAME'   # required theme name
command [:new,:n] do |c|

  c.action do |g,o,args|

    ## todo: required template name (defaults to starter for now)
    name = args[0] || 'starter'

    puts "  download theme here"
    puts "  unzip/unpack (setup) here"
    puts 'Done.'
  end # action
end  # command setup




desc '(Debug) Test command suite'
command :test do |c|
  c.action do |g,o,args|

    puts "hello from test command"
    puts "args (#{args.class.name}):"
    pp args
    puts "o (#{o.class.name}):"
    pp o
    puts "g (#{g.class.name}):"
    pp g
    
    LogUtils::Logger.root.debug 'test debug msg'
    LogUtils::Logger.root.info 'test info msg'
    LogUtils::Logger.root.warn 'test warn msg'
    
    puts 'Done.'
  end
end



pre do |g,c,o,args|
  opts.merge_gli_options!( g )
  opts.merge_gli_options!( o )

  puts DrJekyll.banner

  if opts.verbose?
    LogUtils::Logger.root.level = :debug
  end

  logger.debug "Executing #{c.name}"   
  true
end

post do |global,c,o,args|
  logger.debug "Executed #{c.name}"
  true
end


on_error do |e|
  puts
  puts "*** error: #{e.message}"

  if opts.verbose?
    puts e.backtrace
  end

  false # skip default error handling
end


### exit run(ARGV)  ## note: use Toolii.run( ARGV ) outside of class

end  # class Toolii

end # module DrJekyll
