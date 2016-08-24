class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :destroy, :show]
    
    
    def index
        @articles =Article.all
    end
    
    def new
        @article = Article.new
    end
    
    def create
       
       @article = Article.new(article_params)
        if 
            @article.save
            flash[:notice] = "Your Article has been saved"    
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end
    
    def edit
        
    end
    
    
    def show
        
    end
    
    def update
       
        if 
            @article.update(article_params)
            flash[:notice] = "Succesfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        
        end
    end
    
    def destroy
        
        @article.destroy
        redirect_to articles_path
        flash[:notice] = "Article was succesfully deleted"
    end
    
    private
        def set_article
            @article = Article.find(params[:id])
        end
    
        def article_params
            params.require(:article).permit(:title, :description)
        end
    
end