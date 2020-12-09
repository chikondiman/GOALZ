class Api::IntentionsController < ApplicationController
  def sample_action
    @message = "GOLAZO!"
    render "sample.json.jb"
  end
end
