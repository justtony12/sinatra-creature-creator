class UserController < ApplicationController

    get '/user/:slug' do
        @user = User.find_by_slug(params[:slug])
        erb :'users/show'
    end
    
    get '/signup' do
        if !logged_in?
            erb :'/users/signup', locals: {message: "Please sign u before you sign in"}
        else
            redirect to '/creations'
        end
    end

    post '/signup' do
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
            redirect to '/signup'
        else
            @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
            @user.save
            session[:user_id] = @user.id
            redirect to '/creations'
        end
    end

    get '/login' do
        if !logged_in?
            erb :'/users/login'
        else
            redirect to '/creations'
        end
    end

    post '/login' do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to '/creations'
        else
            redirect to '/signup'
        end
    end

    get '/logout' do
        if logged_in?
            session.destroy
            redirect to '/login'
        else
            redirect to '/'
        end
    end

end