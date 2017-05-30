class ReceiptsController < ApplicationController
  before_action :find_receipt, except: [:index, :new, :create, :add_item]
  def index
    @receipts = Receipt.all
  end

  def show
  end

  def new
    @receipt = Receipt.new
    10.times do
      @receipt.items.build
    end
  end

  def create
    @receipt = Receipt.new(whitelisted_receipt_params)
    super(@receipt)
  end

  def update
    super(@receipt, whitelisted_receipt_params)
  end

  def destroy
  end

  def add_item
    @receipt = Receipt.find_by(id: params[:receipt_id])
    @receipt.items.build
  end

  private
    def whitelisted_receipt_params
      params.require(:receipt).permit(:vendor, :description, :tax, :hardcopy,  items_attributes: [:id, :receipt_id, :category_id, :sale_id, :name, :description, :cost, :quantity, :measurement])
    end

    def find_receipt
      @receipt = Receipt.find_by(id: params[:id])
    end
end
