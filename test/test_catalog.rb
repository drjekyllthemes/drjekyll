# encoding: utf-8

###
# to run use
#   ruby -I ./lib -I ./test test/test_catalog.rb


require 'helper'


class TestCatalog < MiniTest::Test

  def test_catalog

    cat = DrJekyll::Catalog.from_file( "#{DrJekyll.root}/test/data/themes.yml" )
    cat.list

    assert true  ## if we get here; everything is ok
  end

end # class TestCatalog
