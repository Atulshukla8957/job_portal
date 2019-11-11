class User < ApplicationRecord
   has_secure_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

	mount_uploader :profile_pic, ProfilePicUploader
  mount_uploader :page_cover, PageCoverUploader
    
  enum job_type: { full_time: 0, contract: 1, part_time: 2, freelance: 4 }   

  has_many :auth_tokens, dependent: :destroy
  has_and_belongs_to_many :education_details 
	has_and_belongs_to_many :experience_details

	accepts_nested_attributes_for :education_details
	accepts_nested_attributes_for :experience_details

  attr_accessor :auth_token 


  def auth_token
    self.auth_tokens.last.token
  end
end
