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
		@item=Item.new(title: params[:title], description: params[:description], price: params[:price], picture: params[:picture], admin: current_user)
		if @item.save
			redirect_to item_path(@item.id)
			flash[:success] = "This kitty has been successfully added to the kitty database"
		else
			flash[:error] = "Something went wrong, please try again"
			render :new
		end
	end

	def edit
		@item=Item.find(params[:id])
	end 

	def update
		@item=Item.find(params[:id])
		if @item.update(item_params)
		redirect_to item_path(@item.id)
		flash[:success] = "This page has been successfully modified !"
		else
		flash[:error] = "Something went wrong, please try again"
		render :edit
		end 
	end

	def destroy
		@item=Item.find(params[:id])
		@item.destroy
		redirect_to request.referrer
		flash[:success]= "You have successfully deleted this cat"
	end 
	 
	private

	def item_params
		item_params=params.require(:item).permit(:title, :description, :price, :picture)
	end

end
