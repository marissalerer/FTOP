class ApplicationController < ActionController::Base
  protect_from_forgery
  autocomplete :members, :coop_id
end