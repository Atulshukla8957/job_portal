class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	mount_uploader :profile_pic, ProfilePicUploader
  	mount_uploader :page_cover, PageCoverUploader

  	has_and_belongs_to_many :education_details 
	has_and_belongs_to_many :experience_details

  	accepts_nested_attributes_for :education_details
  	accepts_nested_attributes_for :experience_details
end
