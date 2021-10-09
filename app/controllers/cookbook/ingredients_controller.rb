class Cookbook::IngredientsController < CookbookController
  layout false

  before_action :set_recipe
  before_action :set_ingredient, only: [:edit, :show, :update, :destroy]

  # GET /cookbook/recipes
  def index
    @ingredients = @recipe.ingredients.cookbook_collection
  end

  def show
    render @ingredient, status: :ok
  end

  # GET /cookbook/recipes/new
  def new
    @ingredient = Cookbook::Ingredient.new(recipe: @recipe, item: Inventory::Item.new)
  end

  # GET /cookbook/recipes/1/edit
  def edit
  end

  # POST /cookbook/recipes
  def create
    @ingredient = @recipe.ingredients.build(cookbook_ingredient_params)

    unless @ingredient.save
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cookbook/recipes/1
  def update
    unless @ingredient.update(cookbook_ingredient_params)
      render :edit
    end
  end

  # DELETE /cookbook/recipes/1
  def destroy
    @ingredient.destroy
  end

  private

  def set_recipe
    @recipe = Cookbook::Recipe.find(params[:recipe_id])
  end

  def set_ingredient
    @ingredient = @recipe.ingredients.find(params[:id])
  end

  def cookbook_ingredient_params
    params.require(:ingredient).tap do |p|
      p[:inventory_unit_id] ||= p[:unit]
      p.delete(:unit)

      p.delete(:item_attributes) if p[:inventory_item_id].present?
      p.delete(:inventory_item_id) if p[:item_attributes].present?
    end.permit(:amount, :inventory_unit_id, :inventory_item_id, item_attributes: [:name])
  end
end
