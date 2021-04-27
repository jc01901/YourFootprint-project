class NewsArticle
    include ActiveModel::Model

    # attr_accessor :id, :name, :author, :title, :description, :content,
    #             :url, :urlToImage, :publishedAt

    attr_accessor :name, :age

    def initialize(article)
        @name = 'ash'
        @age = article.name
    end

    def persisted?
        false
    end
    
end