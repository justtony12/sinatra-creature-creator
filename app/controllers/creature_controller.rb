class CreatureController < ApplicationController
    get '/creations' do
        if logged_in?
            @creations = Creations.all
            erb :'creations/creatures'
        else
            redirect to '/login'
        end
    end

    get '/creations/new' do #will have route to this in my creatures.erb to make new
        if logged_in?
            erb :'creations/create_creature'
        else
            redirect to '/login'
        end
    end
end