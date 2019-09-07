class User < ApplicationRecord
	mount_uploader :profile_pic, ProfilePicUploader
  	mount_uploader :page_cover, PageCoverUploader
end
