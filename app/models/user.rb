class User < ApplicationRecord
	mount_uploader :profile_pic, ProfilePicUploader
  	mount_uploader :page_cover, PageCoverUploader

  	has_and_belongs_to_many :education_details 
	has_and_belongs_to_many :experience_details

  	accepts_nested_attributes_for :education_details
  	accepts_nested_attributes_for :experience_details
end
