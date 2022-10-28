# Please copy/paste all three classes into this file to submit your solution!
class Article
    attr_reader :author, :magazine, :title

    @@all = []

    def initialize(title, author, magazine)
        @title = title
        @author = author
        @magazine =magazine 
        @@all << self      
    end

    def self.all
        @all
    end
end

class Author
  attr_reader :name, :articles, :magazines


  def initialize(name)
    @name = name   
  end
 
  def articles
    Article.all.select do |article|
      article.author == self
    end
  end

  def magazines
    @mgz = articles.map do |article|
      article.magazine
    end
    @mgz.uniq
  end

  def add_article(magazine, title)
    Article.new(magazine, title)
  end

  def topic_areas
    magazines.map do |magaz|
      magaz.category
    end
  end

end

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