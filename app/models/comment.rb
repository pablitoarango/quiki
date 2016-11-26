class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment
  include PublicActivity::Model

  belongs_to :commentable, :polymorphic => true
  belongs_to :user

  default_scope -> { order('created_at ASC') }

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  acts_as_votable
  tracked only: [:create], owner: proc { |_controller, model| User.find(model.user_id) }

  after_create :create_all_activity
  validates_presence_of :comment
  validates_presence_of :commentable
  validates_presence_of :user


  private

  def create_all_activity
    ActivityCreator.notifications_for_comments(self)
  end
end
