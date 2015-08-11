# encoding: utf-8


module DrJekyll

class ListCommand   ## find a better name ??

  def initialize( catalog, opts )
    @catalog = catalog
    @opts    = opts
  end

  def run( args )
    filter = args[0]   ## optional filter (search query)
    list( filter )
  end
  
  def list( filter=nil )
    @catalog.list( filter )
  end

end ## class ListCommand

end # module DrJekyll
