class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user

  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  default_scope order: 'microposts.created_at DESC'

  # lambda: Returns microposts from users being followed (by given user).
  scope :from_users_followed_by, lambda { |user| followed_by(user) }

  private

    # Returns an SQL condition for users followed.
    # We include the (following) user's own id as well.
    def self.followed_by(user)
      followed_user_ids = %(SELECT followed_id FROM relationships
                            WHERE follower_id = :user_id)
      where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
            { user_id: user })
    end

    # note: equiv to SELECT * FROM microposts
		#  WHERE user_id IN (SELECT followed_id FROM relationships
    #              WHERE follower_id = 1) OR user_id = 1
		
		# all set logic in Db

		# to scale - generate async feed w background job 
		# ex: (http://railslab.newrelic.com/scaling-rails)

  
end
