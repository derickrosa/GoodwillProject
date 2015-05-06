class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @records = Record.all
    respond_with(@records)
  end

  def show
    respond_with(@record)
  end

  def new
    @record = Record.new
    respond_with(@record)
  end

  def edit
  end

  def create
    @record = Record.new(record_params)
    respond_to do |format|
      if @record.save
        format.json { render json: @record, status: :ok }
      else
        format.json { render json: @record, status: :unprocessable_entity }
      end
    end 
  end

  def update
    @record.update(record_params)
    respond_with(@record)
  end

  def destroy
    @record.destroy
    respond_with(@record)
  end

  private
    def set_record
      @record = Record.find(params[:id])
    end

    def record_params
      params.require(:record).permit(:resquest_id, :applicant_id, :volunteer_id, :status)
    end
end
