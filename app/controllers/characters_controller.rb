class CharactersController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @democharacters = Character.where(user_id: 1)
  end

  def new
    @character = Character.new
    @races = []
  end

  def create
    @character = current_user.characters.create(character_params)
    if @character.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @character = Character.find_by_id(params[:id])
    if @character.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
  end

  def update
    @character = Character.find(params[:id])
    if @character.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
    @character.update_attributes(character_params)
    if @character.valid?
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @character = Character.find(params[:id])
    if @character.user != current_user
      return render plain: 'Not allowed', status: :forbidden
    end
    @character.destroy
    redirect_to root_path
  end

  private

  def character_params
    params.require(:character).permit(:race, :gender, :age, :charclass, :level, :name, :alignment, :description, :equipment, :spell, :wealth, :strstat, :dexstat, :constat, :intstat, :wisstat, :chastat)
  end

  def render_not_found
    render plain: 'Not Found', status: :not_found
  end
end
