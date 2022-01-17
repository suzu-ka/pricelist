class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

    def top
    end

    def index
      @items= Item.all
      if params[:search] != nil && params[:search] != ''
        search = params[:search]
        @items = Item.joins(:user).where("name LIKE ? OR about LIKE ?", "%#{search}%", "%#{search}%")
      else
        @items = Item.all
      end
    end
  
    def new
      @item = Item.new
    end

    def create
      item = Item.new(item_params)
      item.user_id = current_user.id
      if item.save
        redirect_to :action => "index"
      else
        redirect_to :action => "new"
      end
    end

    def show
      @item = Item.find(params[:id])
      @comments = @item.comments
      @comment = Comment.new
    end

    def edit
      @item = Item.find(params[:id])
    end

    def update
      item = Item.find(params[:id])
      if item.update(item_params)
        redirect_to :action => "show", :id => item.id
      else
        redirect_to :action => "new"
      end
    end

    def destroy
      item = Item.find(params[:id])
      item.destroy
      redirect_to action: :index
    end

    def food
      @items = Item.all
    end

    def life
      @items = Item.all
    end

    def fashion
      @items = Item.all
    end

    def toy
      @items = Item.all
    end

    def character
      @items = Item.all
    end

    def others
      @items = Item.all
    end

    private
  def item_params
    params.require(:item).permit(:name, :about, :price, :image, :category)
  end

end