class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
		#raise params.inspect
		#@article = Article.new
		#@article.title  = params[:article][:title]
		#@article.body = params[:article][:body]
		#@article.save
		@article = Article.new(params[:article])
		@article.save

		flash[:message] = "#{@article.title} was created successfully"
		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash[:message] = "Article #{@article.title} was deleted"

		redirect_to articles_path

	end

	def edit
		@article = Article.find(params[:id])
		
	end

	def update
		@article = Article.find(params[:id])
		@article.update_attributes(params[:article])
		flash[:message] = "Article #{@article.title} updated"
		redirect_to article_path(@article)
	end
end
