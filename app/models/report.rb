class Report < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :question, :answer, :status, :user_id, :user_name, :email
  validates_presence_of :question, :message => "Message can't be blank"
  
  scope :recent, where(:status => 0)
end
