class RecordController < ApplicationController
  class RecordsController < ApplicationController
    def show
      @record = Record.find(params[:id])
    end
  end
end
