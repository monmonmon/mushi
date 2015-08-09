module LikeAndUnlikeConcern
  extend ActiveSupport::Concern

  def like
    require_login!
    target = resource
    Like.like(current_or_guest_user, target)
    target.reload
    render json: {
      id: target.id,
      likes_count: target.likes_count,
      dislikes_count: target.try(:dislikes_count),
      success: true,
      value: true,
      message: ':)',
    }
  rescue => e
    render json: {
      success: false,
      message: e.message,
      redirect_to: @redirect_to,
    }
  end

  def unlike
    require_login!
    target = resource
    Like.unlike(current_or_guest_user, target)
    target.reload
    render json: {
      id: target.id,
      likes_count: target.likes_count,
      dislikes_count: target.try(:dislikes_count),
      success: true,
      value: false,
      message: ':)',
    }
  rescue => e
    render json: {
      success: false,
      message: e.message,
      redirect_to: @redirect_to,
    }
  end

  private

    def require_login!
      unless current_or_guest_user
        @redirect_to = new_user_session_path
        fail flash[:alert] = 'Please login.'
      end
    end

    def resource
      model_name = controller_name.classify
      target_class = Object.const_get(model_name)
      target_class.find(params[:id])
    end
end
