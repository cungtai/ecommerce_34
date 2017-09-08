class RecentlyViewedsController < ApplicationController
  layout "user/user_layout"
  before_action :correct_user, only: [:edit, :update]

end
