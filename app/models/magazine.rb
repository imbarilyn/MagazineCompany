require 'pry'
require_relative 'article'
class Magazine
  attr_accessor :name, :category

  @@all = []


  def initialize(name, category)
    @name = name
    @category = category
    @@all << self
  end

  def self.all
    @@all
  end

  
  def contributors
    Article.all.select do |magazine|
      magazine.magazine == self
    end.map do |mag|
      mag.author
    end
  end

  def self.find_by_name(name)
    self.all.find do |magazine|
      magazine.name == name
    end
  end

  def article_titles
    Article.all.select do |magazine|
      magazine.magazine == self
    end.map do |article|
      article.title
    end
  end

  def contributing_authors
    Article.all.select do |magazine|
      magazine.magazine == self
    end.map do |author|
      author.author
    end.uniq.map do |article|
      article.articles.count > 2
    end
  end


end

# # binding.pry

