class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :is_admin

  protected

    def create(record)
      if record.save
        after_create_path(record)
      else
        flash.now[:danger] = ['something went wrong']
        record.errors.full_messages.each do |error|
          flash.now[:danger] << error
        end
        render :new
      end
    end

    def update(record, whitelisted)
      if record.update(whitelisted)
        after_update_path(record)
      else
        flash.now[:danger] = ['something went wrong']
        record.errors.full_messages.each do |error|
          flash.now[:danger] << error
        end
        failed_update
      end
    end

    def after_create_path(record)
      redirect_to record
    end

    def after_update_path(record)
      redirect_to record
    end

    def failed_update
      render :edit
    end

  private
    def is_admin
      redirect_to new_user_session_path unless user_signed_in?
    end
end
