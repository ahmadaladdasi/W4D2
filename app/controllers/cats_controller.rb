class CatsController < ApplicationController

  def index
    @cats = Cat.all
    if @cats
      render :index
    else
      render plain: error, status: 404
    end
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    if @cat
      render :show
    else
      render plain: error, status: 404
    end
  end

  def new
    @cat = Cat.new
    render :new
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
    render :edit
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.save!
    redirect_to cats_url
  end

  def update
    @cat = Cat.find_by(id: params[:id])
    @cat.update(cat_params)
    redirect_to cat_url(@cat)
  end

  def cat_params
    params.require(:cat).permit(:name, :sex, :color, :birth_date, :description)
  end
end
