class CharactersController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @characters = Character.all
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

  private

  def character_params
    params.require(:character).permit(:race, :gender, :age, :charclass, :level, :name, :alignment, :description, :equipment, :spell, :wealth, :strstat, :dexstat, :constat, :intstat, :wisstat, :chastat)
  end

end
