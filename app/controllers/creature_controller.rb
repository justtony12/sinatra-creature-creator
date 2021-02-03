class CreatureController < ApplicationController
    get '/creations' do
        if logged_in?
            @creations = Creations.all
            erb :'creations/creatures'
        else
            redirect to '/login'
        end
    end

    get '/creations/new' do
        if logged_in?
            @creations = Creations.new
            erb :'creations/create_creature'
        else
            redirect to '/login'
        end
    end

    post '/creations' do
        if logged_in?
            redirect to '/creations/#{@creations.id}'
        else
            redirect to '/login'
        end
    end

    get '/creations/:id' do
        @creation = Creations.find(params[:id])
        erb :'creations/show_creature'
    end
end