class JobPost < ApplicationRecord
	belongs_to :company
	has_many :users

	enum job_type: { full_time: 0, contract: 1, part_time: 2, freelance: 4 }
	enum salary_type: { Annually: 0, Monthly: 1, Weekly: 2, Hourly: 4 }   

end
