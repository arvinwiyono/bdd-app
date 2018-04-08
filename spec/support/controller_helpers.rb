module ControllerHelpers
  def log_in(user)
    warden = request.env['warden']
    allow(warden).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(:current_user).and_return(user)
  end
end
