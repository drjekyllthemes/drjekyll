# encoding: utf-8

module DrJekyll

class Catalog

  def self.from_url( src )
    worker = Fetcher::Worker.new
    text = worker.read_utf8!( src )
    self.from_string( text )
  end

  def self.from_file( path )
    ## read in themes catalog
    text  = File.read( path )  ## fix: use File.read_utf8 ??
    self.from_string( text )
  end

  def self.from_string( text )
    self.new( text )
  end


  def initialize( text )
    ## convert to "internal" inverted format (resolve shortcuts etc.)
    @themes = convert( YAML.load( text ) )

    ## auto-add keys for now (for quick testing)
    @themes.each do |k,h|
      name   = k
      keys   = h['keys'] || []
      if keys.empty?
        ## auto-add key from title/name
        ##   downcase and remove all non alphanumeric (non-ascii)
        slug = name.downcase.gsub( /[^a-z0-9]/, '' )

        ## for quick testing add some shortcuts
        ##  -- add Henry's Hello, Minima! (henryshellominima) too - why? why not?
        if slug == 'henryshellojekyll'
          keys << 'hello'
          keys << 'hellojekyll'
        elsif slug == 'henrysstarterminimal' || slug == 'henrysstarter'
          keys << 'starter'
        elsif slug == 'henrysminimal'
          keys << 'minimial'
        elsif slug == 'henrysbootstrap'
          keys << 'bootstrap'
        elsif slug == 'henrysclassicsbook'
          keys << 'classics'
        elsif slug == 'pooleshyde'
          keys << 'hyde'
        elsif slug == 'pooleslanyon'
          keys << 'lanyon'
        else
        end
        keys << slug
        h['keys'] = keys
      end
    end
  end


  def convert( themes )
    ## see scripts in drjekyllthemes/build repo
    ##   todo/fix: use this class/code here in build script too - do NOT duplicate

    ## build hash with themes by title
    hash = {}

    themes.each do |theme|
      title = theme.delete( 'title' )  ## remove title from hash and use as new key

      ## unify
      ##  check for github shortcut
      github = theme.delete( 'github' )
      if github
        theme[ 'home_url' ] = "https://github.com/#{github}"
        branch = theme.delete( 'branch' )
        branch = 'master'  if branch.nil?   ## if no branch listed assume master
        theme[ 'download_url' ] = "https://github.com/#{github}/archive/#{branch}.zip"
      end
      hash[ title ] = theme
    end
    hash
  end  # method convert


  def list( filter=nil )
    ## pp filter

    @themes.each_with_index do |(k,h),i|
      name   = k
      author = h['author']
      tags   = h['tags'] || []     ## allow nil for tags array for now
      keys   = h['keys']

      line = ''
      line << "  %3d" % (i+1)
      line << "..#{name}"
      line << " (#{keys.join(' | ')})"
      line << " by #{author}"
      if tags.nil? == false && tags.empty? == false
        line << " - "
        tags.each do |tag|
          line << "##{tag} "
        end
      end

      if filter
        ## note: ignore case (upper/lower/downcase) for now
        ##  filter on name/title and
        ##            tags for now
        if name.downcase.index(filter.downcase)             != nil ||    ## note: 0 is match found on index 0; only nil is not found
           tags.join('|').downcase.index( filter.downcase ) != nil
          puts line
        end
      else
        puts line
      end
    end
  end  # method filter

  def find( key )   ## use fetch/get/? or different name - why? why not??
    ## find theme by key
    ##  fix/todo: use linear search for now; use hash lookup later

    theme = nil   ## note: return nil if nothing found

    @themes.each do |k,h|
      name   = k
      keys   = h['keys']

      if keys.include?( key )
        ## bingo found
        ##  todo: merge k (name/title) into (returned) hash - why? why not??
        puts " ** bingo; found theme >#{k}<:"
        pp h
        theme = h
        break
      end
    end

    theme
  end

end # class Catalog

end # module DrJekyll
