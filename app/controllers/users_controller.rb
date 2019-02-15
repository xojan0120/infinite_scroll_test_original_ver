class UsersController < ApplicationController
  def index
    @page = params[:page].to_i
    per_page = 10
    of = (@page - 1) * per_page
    @users = User.offset(of).last(per_page) # 191～200 p1

    #@users = User.offset(0).last(10)  # 191～200 p1
    #@users = User.offset(10).last(10) # 181～190 p2
    #@users = User.offset(20).last(10) # 171～180 p3

    if @users.empty?
      head :no_content # ステータスコード204にあたる
    end
  end

  def other
  end
end
