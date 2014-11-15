class Todo < ActiveRecord::Base
  
  belongs_to :user

  validates :description, length: { minimum: 3 }, presence: true
  
  def time_left
    Time.diff(created_at + 7.days + 23.hours, Time.now, '%d')[:diff]
  end 
end
