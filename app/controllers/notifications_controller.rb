# frozen_string_literal: true

class NotificationsController < ApplicationController
  before_action :set_notification, only: %i[show destroy]
  load_and_authorize_resource

  # GET /notifications or /notifications.json
  def index
    @notifications = current_user.profile.notifications.order(created_at: :desc)
    Notification.where(profile_id: current_user.profile.id).update_all(readed: true)
  end

  # GET /notifications/1 or /notifications/1.json
  def show; end

  # GET /notifications/new
  def new
    @notification = Notification.new
  end

  # DELETE /notifications/1 or /notifications/1.json
  def destroy
    @notification.destroy

    respond_to do |format|
      format.html { redirect_to notifications_url, notice: t('controllers.notifications.deleted') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_notification
    @notification = Notification.find(params[:id])
  end
end
