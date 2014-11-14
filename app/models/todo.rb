class Todo < ActiveRecord::Base
  
  belongs_to :user

  def time_left
    Time.diff(created_at + 7.days, Time.now, '%d')[:diff]
  end 
end
