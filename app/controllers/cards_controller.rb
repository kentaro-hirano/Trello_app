class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]
  
  def new
    @card = Card.new
    @list = List.find_by(id: params[:list_id])
    # binding.pry
  end
  
  def create
    @card = Card.new(card_params)
    if @card.save
      flash[:success] = "カードを作成しました"
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
  end
  
  def edit
    @lists = List.where(user: current_user)
    # binding.pry
  end
  
  def update
    # binding.pry
    if @card.update(card_params)
      flash[:success] = "カードを更新しました"
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def destroy
    @card.destroy
    flash[:success] = "カードを削除しました"
    redirect_to root_path
  end 
  
  private
  def card_params
    params.require(:card).permit(:title, :memo, :list_id)
  end
  
  def set_card
    @card = Card.find(params[:id])
  end
end
