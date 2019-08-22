class StaticPagesController < ApplicationController
	before_action :authenticate_user!, only: [:secret]
  def index
  	@user = current_user
  end

  def secret
  end
end
