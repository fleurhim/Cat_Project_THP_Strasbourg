class ItemsController < ApplicationController
	
	def index
		@items = Item.all
	end

	def show
		@item = Item.find(params[:id])
	end

	def new
		@item=Item.new
	end 

	def create
		@item=Item.new(title: params[:title], description: params[:description], price: params[:price], image_url: params[:image_url], admin: current_user)
		if @item.save
			redirect_to item_path(@item.id)
			flash[:success] = "This kitty has been successfully added to the kitty database"
		else
			flash[:error] = "Something went wrong, please try again"
			render :new
		end
	end

end
