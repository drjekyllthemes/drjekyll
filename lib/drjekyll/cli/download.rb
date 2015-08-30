# encoding: utf-8


module DrJekyll

class DownloadCommand   ## find a better name - why, why not ??

  def initialize( catalog, opts )
    @catalog = catalog
    @opts    = opts
  end

  def run( args )
    ## note: required template name (defaults to starter for now)
    key = args[0] || 'starter'

    theme = @catalog.find( key )

    if theme
      download( key, theme )
    else
      ## todo: issue warning - why, why not??
      puts "*** theme '#{key}' not found; sorry"
    end
  end

  def download( key, theme )
    pak = Package.new( key, theme )
    
    ## todo/fix:
    ##   add puts "GET URL" w/ color (bright/bold green)
    
    pak.download
  end

end ## class DownloadCommand

end # module DrJekyll
