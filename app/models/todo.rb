class Todo < ActiveRecord::Base
  
  belongs_to :user

  def time_left
    Time.diff(self.created_at + 7.days, self.created_at, '%d')[:diff]
  end 
end
