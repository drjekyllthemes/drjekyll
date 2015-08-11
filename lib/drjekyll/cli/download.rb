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

    theme = @catalog.get( key )
    
    if theme
      download( theme )
    else
      ## todo: issue warning - why, why not??
    end
  end
  
  def download( theme )
    ## to be done
    pp theme
  end
  
end ## class DownloadCommand

end # module DrJekyll
