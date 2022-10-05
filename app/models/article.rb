class Article < ApplicationRecord
    belongs_to :user
    has_many :article_categories 
    has_many :categories, through: :article_categories
    validates :title, presence: true, length: { minimum: 6, maximum: 100}
    validates :description, presence: true, length: { minimum: 10, maximum: 10000}


     def self.index_content
            # information = ["name", "last_name", "first_name"]
            content_hash = {}
            self.all.each do |article|
                unless article.description == nil || note.comment == ""
                    article.description.split(/[\s,'-\.!]/).each do |word|
                            content_hash[word.downcase] = [] if content_hash[word.downcase].nil? 
                            content_hash[word.downcase].push(article))
                    end 
                end 
            end 
        content_hash
    end

end
