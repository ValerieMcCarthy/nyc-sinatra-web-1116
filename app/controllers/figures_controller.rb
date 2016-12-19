class FiguresController < ApplicationController

	get '/figures/new' do
		@all_landmarks = Landmark.all
		@all_titles = Title.all
		erb :'/figures/new'
	end

	post '/figures' do
		@figure = Figure.create(name: params[:figure][:name])
		@title = Title.find_or_create_by(name: params[:title][:name])
		@landmark = Landmark.find_or_create_by(name: params[:landmark][:name], figure_id: @figure.id, year_completed: params[:landmark][:year_completed])
		@figure_title = FigureTitle.new(title_id: @title.id, figure_id: @figure_id)
		erb :'figures/show'
	end

end
