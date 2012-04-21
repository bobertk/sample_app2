class RelationshipsController < ApplicationController
  before_filter :signed_in_user

  # Ajax methods below 
  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)

    # only one line gets executed (based upon request)
    respond_to do |format|
      format.html { redirect_to @user } # straight non Ajax: redirect_to @user
      format.js  # Rails calls create.js.erb file
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end

