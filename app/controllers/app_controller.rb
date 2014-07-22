class AppController < RestrictedController
  skip_before_filter :login_required
  def settings
    if request.post?
    end
  end
end
