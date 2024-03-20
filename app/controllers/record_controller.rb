class RecordController < ApplicationController
  def show
    @record = Record.find(params[:id])
  end
end
