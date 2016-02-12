require 'spec_helper'

RSpec.describe RecipeMailer, type: :mailer do
  describe 'recipe_email' do
    let(:food_preference) { double FoodPreference, name: 'Feijão' }
    let(:food_type) { double FoodType, name: 'Feijão' }
    let(:kitchen) { double Kitchen, name: 'Feijão' }
    let(:user) do
      double User, email: 'victor.muramoto@gmail.com',
                   password: '12345678',
                   password_confirmation: '12345678',
                   first_name: 'Victor',
                   last_name: 'muramoto',
                   city: 'São Paulo',
                   facebook: 'www.facebook.com.br',
                   twitter: 'www.twitter.com.br'
    end
    let(:recipe) do
      double Recipe, name: 'Tutu de feijão',
                     number_people: 4,
                     time_prepare: 30,
                     difficult: 'Medio',
                     ingredients: 'Feijão e farinha',
                     description: 'misture tudo',
                     food_preference: food_preference,
                     food_type: food_type,
                     kitchen: kitchen,
                     user: user
    end
    let(:mail) do
      RecipeMailer
        .recipe_email(recipe, 'victor.muramoto@gmail.com')
    end

    it 'renders the subject' do
      expect(mail.subject).to eql("Cookbook - #{recipe.name}")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql(['victor.muramoto@gmail.com'])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['cookbook@mailer.com'])
    end
  end
end
