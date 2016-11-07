# encoding: utf-8

module DrJekyll

class Package

  def initialize( key, hash )  ## note: for now pass in key as its own arg (not part/included in hash)

    ##  fix/todo: change key to name - why? why not?
    ##     always downcase key - why? why not?
    ##     convert github e.g owner/repo to ownner--I--repo -- why? why not?
    ##   do NOT pass in hash - just pass in download_url
    ##
    ##  add self.from_github ???  builder/ctor - why? why not?
    ##  add self.from_hash  ??? builder/ctor - why? why not?

    @key  = key
    @hash = hash

    @download_url = @hash['download_url']  # as string
  end

  def remote_zip_url # remote zip url
    @download_url   # as string
  end

  def local_zip_name
    @key   # note: will NOT include/return .zip extension
  end

  def local_zip_dir
    "."    ## use ./tmp or ./dl  or ~/.drjekyll/cache ??
  end

  def local_zip_path # local zip path
    "#{local_zip_dir}/#{local_zip_name}.zip"
  end



  def download
    src      = remote_zip_url
    dest_zip = local_zip_path

    ## make sure dest folder exists
    FileUtils.mkdir_p( local_zip_dir ) unless Dir.exists?( local_zip_dir )
    fetch_theme( src, dest_zip )
  end

  def unzip( unzip_dir )
    src        = local_zip_path
    dest_unzip = unzip_dir ## local_unzip_dir

    ## check if folders exists? if not create folder in path
    FileUtils.mkdir_p( dest_unzip ) unless Dir.exists?( dest_unzip )
    unzip_theme( src, dest_unzip )
  end

private
  def fetch_theme( src, dest )
    ## step 1 - fetch archive
    worker = Fetcher::Worker.new
    worker.copy( src, dest )
    ### fix: add src.sha5
    ### inside folder
    ### lets us check if current HEAD version is in place across datafiles etc.
    ## - try HTTP HEAD ?? to check?
  end

  def unzip_theme( src, dest, opts={} )
    ### todo/fix: rename or remove root folder -- use opts { root: false or something??}
    # e.g
    # !/starter-gh-pages/_layouts/ becomes
    # !/_layouts/ etc.
    Zip::File.open( src ) do |zipfile|
      zipfile.each do |file|
        if file.directory?
          puts " skip directory zip entry - #{file.name}"
        else
          ### fix: only cut-off if master or gh-pages ???
          ##  check if others include root folder?
          name = file.name[ file.name.index('/')+1..-1] ## cut-off root/first path entry
          path = File.join( dest, name)
          puts " unzip file zip entry - #{file.name} to #{path}"
          FileUtils.mkdir_p( File.dirname( path) )
          zipfile.extract(file, path) unless File.exist?(path)
        end
      end
    end
  end # method unzip_theme


end # class Package

end # module DrJekyll
