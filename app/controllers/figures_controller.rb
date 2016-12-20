class FiguresController < ApplicationController

	get '/figures/new' do
		@landmarks = Landmark.all
		@titles = Title.all
		erb :'/figures/new'
	end

	post '/figures' do
		@figure = Figure.new
	    @figure.name = params['figure']['name']
	   
	   	if params['title']['name'] != ""
	    	@title=Title.create(name: params['title']['name'])
	    	@figure.title_ids = @title.id
	    else
	    	@figure.title_ids = params["figure"]["title_ids"]
	    end

	    if params['landmark']['name'] != ""
	    	@landmark=Landmark.create(name: params['landmark']['name'], year_completed: params['landmark']['year_completed'])
	    	@figure.landmark_ids = @landmark.id
	    else
	    	@figure.landmark_ids = params["figure"]["landmark_ids"]
		end	
		@figure.save
	
		#redirect '/figures'
	    redirect "/figures/#{@figure.id}"
	end

	patch '/figures/:id' do

		@figure = Figure.find(params[:id])
    	@figure.name = params['figure']['name']
    	
    	if params['title']['name'] != ""
	    	@title=Title.create(name: params['title']['name'])
	    	@figure.title_ids = @title.id
	    else
	    	@figure.title_ids = params["figure"]["title_ids"]
	    end
	    

	    if params['landmark']['name'] != ""
	    	@landmark=Landmark.create(name: params['landmark']['name'], year_completed: params['landmark']['year_completed'])
	    	@figure.landmark_ids = @landmark.id
	    else
	    	@figure.landmark_ids = params["figure"]["landmark_ids"]
		end	

    	@figure.save
		redirect "/figures/#{@figure.id}"

	end


	get '/figures' do
		@figures = Figure.all
		erb :'/figures/index'
	end

	get '/figures/:id' do
		@figure = Figure.find(params[:id])
		
		erb :'/figures/show'
	end


  	get '/figures/:id/edit' do

	    @figure = Figure.find(params[:id])
	    @titles = Title.all
	    @landmarks = Landmark.all

	    erb :'figures/edit'
  	end



end
