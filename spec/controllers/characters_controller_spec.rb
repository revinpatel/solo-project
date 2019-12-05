require 'rails_helper'

RSpec.describe CharactersController, type: :controller do

  describe "characters#destroy action" do
    
    it "shouldn't let users who did not create the character destroy the character" do
      character = FactoryBot.create(:character)
      user = FactoryBot.create(:user)
      sign_in user
      delete :destroy, params: { id: character.id }
      expect(response).to have_http_status(:forbidden)
    end
    
    it "shouldn't let unauthenticated users destroy a character" do
      character = FactoryBot.create(:character)
      delete :destroy, params: { id: character.id }
      expect(response).to redirect_to new_user_session_path
    end
    
    it "should allow users to successfully destroy characters" do
      character = FactoryBot.create(:character)
      sign_in character.user
      delete :destroy, params: { id: character.id }
      expect(response).to redirect_to root_path
      character = Character.find_by_id(character.id)
      expect(character).to eq nil
    end
    
  end
  
  describe "characters#update action" do
    
    it "shouldn't let users who didn't create the character update the character" do
      character = FactoryBot.create(:character)
      user = FactoryBot.create(:user)
      sign_in user
      patch :update, params: { id: character.id, character: { equipment: 'I did not create' } }
      expect(response).to have_http_status(:forbidden)
    end
    
    it "shouldn't let unauthenticated users update a character" do
      character = FactoryBot.create(:character)
      patch :update, params: { id: character.id, character: { message: 'I am not signed in' } }
      expect(response).to redirect_to new_user_session_path
    end
    
    it "should allow users to successfully update characters" do
      character = FactoryBot.create(:character, name: "Alpha")
      sign_in character.user
      patch :update, params: { id: character.id, character: { name: 'Omega' } }
      expect(response).to redirect_to root_path
      character.reload
      expect(character.name).to eq 'Omega'
    end
    
    it "should render the edit form again with an http status of unprocessable after invalid input" do
      character = FactoryBot.create(:character, name: "Alpha")
      sign_in character.user
      patch :update, params: {id: character.id, character: { name: ' ' } }
      expect(response).to have_http_status(:unprocessable_entity)
      character.reload
      expect(character.name).to eq "Alpha"
    end
  end
  
  describe "characters#edit action" do
    
    it "shouldn't let a user who didn't create the character edit the character" do
      character = FactoryBot.create(:character)
      user = FactoryBot.create(:user)
      sign_in user
      get :edit, params: { id: character.id }
      expect(response).to have_http_status(:forbidden)
    end
    
    it "shouldn't let unauthenticated users edit a character" do
      character = FactoryBot.create(:character)
      get :edit, params: { id: character.id }
      expect(response).to redirect_to new_user_session_path
    end
    
    it "should successfully show the edit form if the character is found" do
      character = FactoryBot.create(:character)
      sign_in character.user
      get :edit, params: { id: character.id }
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "characters#index action" do
   
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
    
  describe "characters#new action" do
    
    it "should require users to be logged in" do
      get :new
      expect(response).to redirect_to new_user_session_path
    end
    
    it "should successfully show the new form" do
      user = FactoryBot.create(:user)
      sign_in user
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "characters#create action" do
    
    it "should require users to be logged in" do
      post :create, params: { character: { name: "King" } }
      expect(response).to redirect_to new_user_session_path
    end
    
    it "should successfully create a character in our database" do
      user = FactoryBot.create(:user)
      sign_in user   
      post :create, params: {
        character: {
            race: 'Human',
            gender: 'Male',
            age: '30',
            charclass: 'Fighter',
            level: '9999',
            name: 'King',
            alignment: 'Neutral',
            description: 'Description',
            equipment: 'Equipment',
            spell: 'Spell',
            wealth: '9999999999',
            strstat: '9999',
            dexstat: '9999',
            constat: '9999',
            intstat: '9999',
            wisstat: '9999',
            chastat: '9999'
        }
      }
      expect(response).to redirect_to root_path
      character = Character.last
      expect(character.name).to eq("King")
      expect(character.user).to eq(user)
    end
    
    it "should properly deal with validation errors" do
      user = FactoryBot.create(:user)
      sign_in user
      post :create, params: {character: {name: ''} }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(Character.count).to eq 0
    end
  end

end
