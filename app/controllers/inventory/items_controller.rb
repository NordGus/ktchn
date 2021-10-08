class Inventory::ItemsController < InventoryController
  layout false

  def search
    @items = Inventory::Item.search(search_params[:search], fields: [:name], match: :word_start)&.results

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def search_params
    params.require(:item).permit(:search)
  end
end
