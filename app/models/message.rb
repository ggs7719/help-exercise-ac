class Message < ActiveRecord::Base

  belongs_to :user

  has_many :comments, :dependent => :destroy

  scope :pending, -> { where( @messages = @messages.pending ) }
  # <%= link_to "列出進行中訊息", messages_path( messages.pending ) %>


  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

end
