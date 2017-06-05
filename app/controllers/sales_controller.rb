class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def show
    @sale = Sale.find_by(id: params[:id])
  end

  def new
    @sale = Sale.new
    build_items
  end

  def create
    @sale = Sale.new(whitelisted_sale_params)
    super(@sale, -> { build_items })
  end

  private
    def whitelisted_sale_params
      params.require(:sale).permit(:id, :name, :description, :total, item_sales_attributes: [:id, :sale_id, :item_id, :used])
    end

    def build_items
      Item.count.times do
        @sale.item_sales.build
      end
    end
end
