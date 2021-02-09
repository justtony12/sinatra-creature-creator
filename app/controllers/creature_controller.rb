class CreatureController < ApplicationController

    get '/creations' do
        if logged_in?
            @creations = Creation.all
            erb :'creations/creatures'
        else
            redirect to '/login'
        end
    end

    get '/creations/new' do
        if logged_in?
            erb :'creations/create_creature'
        else
            redirect to '/login'
        end
    end

    post '/creations' do
        if logged_in?
            if params[:content] == ""
                redirect to "/creations/new"
            else
                @creations = current_user.creations.build(params)
                if @creations.save
                    redirect to "/creations/#{@creations.id}"
                else
                    redirect to "/creations/new"
                end
            end
        else
            redirect to '/login'
        end
    end

    get '/creations/:id' do
        if logged_in?
          @creations = Creation.find_by_id(params[:id])
          erb :'creations/show_creature'
        else
          redirect to '/login'
        end
    end

    get '/creations/:id/edit' do
        if logged_in?
          @creations = Creation.find_by_id(params[:id])
          if @creations && @creations.user == current_user
            erb :'creations/edit_creature'
          else
            redirect to '/creations'
          end
        else
          redirect to '/login'
        end
    end

    patch '/creations/:id' do
        if logged_in?
            @creations = Creation.find_by_id(params[:id])
            if @creations && @creations.user == current_user
                if @creations.update(params["creation"])
                    redirect to "/creations/#{@creations.id}"
                else
                    redirect to "/creations/#{@creations.id}/edit"
                end
            else
                redirect to '/creations'
            end
        else
            redirect to '/login'
        end
    end

    delete '/creations/:id/delete' do
        if logged_in?
            @creations = Creation.find_by_id(params[:id])
            if @creations && @creations.user == current_user
                @creations.delete
            end
            redirect to '/creations'
        else
            redirect to '/login'
        end
    end

end