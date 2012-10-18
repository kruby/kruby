# -*- encoding : utf-8 -*-
require 'active_record/fixtures'
class LoadPageData < ActiveRecord::Migration
  def self.up
    down
    directory = File.join(File.dirname(__FILE__), "data")
    Fixtures.create_fixtures(directory, "contents")
    Fixtures.create_fixtures(directory, "menus")
    Fixtures.create_fixtures(directory, "newsarchives")
    Fixtures.create_fixtures(directory, "pages")
    Fixtures.create_fixtures(directory, "posts")
    Fixtures.create_fixtures(directory, "products")
    Fixtures.create_fixtures(directory, "recipes")
    Fixtures.create_fixtures(directory, "relations")
    Fixtures.create_fixtures(directory, "users")
  end
  def self.down
    Content.delete_all
    Menu.delete_all
    Newsarchive.delete_all
    Page.delete_all
    Post.delete_all
    Product.delete_all
    Recipe.delete_all
    Relation.delete_all
    User.delete_all
  end
end

# For at dumpe filerne til denne rake task, skriver du:
# Prompt$ rake db:fixtures:dump
# Filen fixtures.rake skal være tilstede mappen /lib/tasks
# Filerne lægger sig i /test/fixtures
