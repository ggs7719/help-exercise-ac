class Message < ActiveRecord::Base

  belongs_to :user

  has_many :subscriptions
  has_many :likes
  has_many :liked_users, :through => :likes, :source => :user
  has_many :subscript_users, :through => :subscriptions, :source => :user

  has_many :comments, :dependent => :destroy

  scope :pending, -> { where( @messages = @messages.pending ) }
  # <%= link_to "列出進行中訊息", messages_path( messages.pending ) %>


  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

end
