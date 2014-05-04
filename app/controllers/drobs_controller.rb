class DrobsController < ApplicationController
	 skip_before_filter :verify_authenticity_token  
	def index
		@drobs = Highscore.limit(8).order(score: :desc)
		@drob = Highscore.new
	end
	def create
		name = params[:name]
		level = params[:level]
		score = params[:score]
		ip = request.remote_ip
		@drob = Highscore.create(name: name, level: level, score: score, ip: ip)
		@drobs = Highscore.limit(8).order(score: :desc)
	end
end
