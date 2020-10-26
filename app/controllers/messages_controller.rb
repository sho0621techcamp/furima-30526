class MessagesController < ApplicationController
  def new
    @messages = Messages.all
  end
end
