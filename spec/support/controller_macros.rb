module ControllerMacros
  def login_admin
    before(:each) do
      @admin = Admin.new(email: "example@mail.com", password: "teste#01")
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      @request.env['warden'].stub :authenticate! => @admin
      sign_in :admin, @admin
    end
  end

end