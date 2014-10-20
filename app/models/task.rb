class Task < ActiveRecord::Base

  # validates :incontext, uniqueness: { scope: :user_id }, :if => Proc.new{ |task| task.incontext? }

  # belongs_to :user

  # scope :recent, ->count do
  #   tasks = limit(count).order('created_at DESC')
  #   add_length = count - tasks.size
  #   tasks += Array.new(add_length){ Task.new }
  # end
  # scope :incomplete, ->{ where completed: false }
  # scope :context, ->{ where incontext: true }
  # scope :free, ->{ where incontext: false }

  # def be_incontext!
  #   update_attributes incontext: true
  # end

end