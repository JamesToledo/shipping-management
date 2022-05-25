# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: { admin: 1, company_user: 0 }
  validate :set_user_role_by_email

  private

  def set_user_role_by_email
    if email.present? && email.end_with?('@sistemadefrete.com')
      self.role = :admin
    else
      Company.all.each do |company|
        if email.include?(company.email_domain)
          self.role = :company_user
          self.company_id = company.id
        end
      end
    end
  end
end
