class SiteController < ApplicationController

  before_action :is_authenticated?

  def index
    @user = current_user
  end

end