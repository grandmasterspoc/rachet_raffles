require 'open-uri'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:instagram]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid, token: auth.credentials.token).first_or_create do |user|
      user.email = "#{auth.info.nickname}@instagram.com"
      user.password = Devise.friendly_token[0,20]
    end
  end

  def raffle_posts
    i = open("https://api.instagram.com/v1/users/#{uid}/media/recent/?access_token=#{token}&count=40")
    client_attributes = OpenStruct.new(JSON.parse(i.read))
    data = JSON.parse(client_attributes.data.to_json)
    posts_tagged_rachet_raffles(data)
  end

  def posts_tagged_rachet_raffles(data)
    data.select{|d| d['caption']['text'].downcase.include?('raffle with @rachet_raffles') }
  end

end
