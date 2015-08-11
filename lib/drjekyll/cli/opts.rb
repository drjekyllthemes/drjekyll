# encoding: utf-8

module DrJekyll

class Opts

  def merge_gli_options!( options = {} )
    @local   = true     if options[:local] == true
    @verbose = true     if options[:verbose] == true
  end


  def verbose=(boolean)   # add: alias for debug ??
    @verbose = boolean
  end

  def verbose?
    return false if @verbose.nil?   # default verbose/debug flag is false
    @verbose == true
  end

  def local=(boolean)
    @local = boolean
  end

  def local?
    return false if @local.nil?   # default verbose/debug flag is false
    @local == true
  end

end # class Opts

end # module DrJekyll
