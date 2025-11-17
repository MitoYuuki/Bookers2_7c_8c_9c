class GroupMembershipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @membership = GroupMembership.new(user: current_user, group_id: params[:group_id])
    if @membership.save
      redirect_to group_path(params[:group_id]), notice: 'グループに参加しました。'
    else
      redirect_to group_path(params[:group_id]), alert: '参加に失敗しました。'
    end
  end

  def destroy
    @membership = GroupMembership.find_by(user: current_user, group_id: params[:group_id])
    @membership.destroy if @membership
    redirect_to group_path(params[:group_id]), notice: 'グループから退出しました。'
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end
  
end
