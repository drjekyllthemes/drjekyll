# encoding: utf-8


module DrJekyll

class UnzipCommand   ## find a better name - why, why not ??

  def initialize( catalog, opts )
    @catalog = catalog
    @opts    = opts
  end

  def run( args )
    ## note: required template name (defaults to starter for now)
    key = args[0] || 'starter'

    theme = @catalog.find( key )

    if theme
      unzip( key, theme )
    else
      ## todo: issue warning - why, why not??
      puts "*** theme '#{key}' not found; sorry"
    end
  end

  def unzip( key, theme )
    pak = Package.new( key, theme )
    pak.unzip( "./#{key}" )
  end

end ## class UnzipCommand

end # module DrJekyll
