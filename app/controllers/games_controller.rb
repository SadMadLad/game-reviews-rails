class GamesController < ApplicationController
    def index
        @games = Game.all
    end

    def show
        @game = Game.find(params[:id])
    end

    def search
        query_string = search_params
        @query_string = query_string["search_query"]
        @query_string = @query_string.downcase.titleize
        
        if @query_string.empty?
            redirect_to root_path
        else
            @games = Game.where("title LIKE '#{@query_string}%'")
        end
    end

    def new
        @game = Game.new
    end

    def create
        @game = Game.new(game_params)

        if @game.save
            redirect_to @game
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @game = Game.find(params[:id])
    end

    def like
        @game = Game.find(params[:id])
        @game.update(likes: @game.likes+1)

        redirect_to @game
    end

    def dislike
        @game = Game.find(params[:id])
        @game.update(dislikes: @game.dislikes+1)

        redirect_to @game
    end

    def update
        @game = Game.find(params[:id])
        
        if @game.update(game_params)
            redirect_to @game
        else
            render :edit, status: :unprocessable_entity
        end
    end


    def destroy
        @game = Game.find(params[:id])
        @game.destroy

        redirect_to root_path, status: :see_other
    end

    private
    def game_params
        params.require(:game).permit(:title, :about, :img_path)
    end
    
    def search_params
        params.require(:search).permit(:search_query)
    end
end
