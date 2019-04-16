# frozen_string_literal: true

class Admin < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
         # :authy_authenticatable

  def destroyable?
    has_role? :admin
  end
end
