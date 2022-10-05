class PagesController < ApplicationController
    
    def home 
        redirect_to articles_path if logged_in?
    end 

    def about 
    end 

    def search
    
        @search_word = params[:search_word].downcase

        @articles = Article.index_content[@search_word]
        @articles.uniq! 
      
    end 


end 