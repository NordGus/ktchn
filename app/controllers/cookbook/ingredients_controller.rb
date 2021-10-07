class Cookbook::IngredientsController < CookbookController
  layout false

  before_action :set_recipe

  # GET /cookbook/recipes
  def index
    @ingredients = @recipe.ingredients.cookbook_collection
  end

  # GET /cookbook/recipes/1
  def show
  end

  # GET /cookbook/recipes/new
  def new
    @ingredient = Cookbook::Ingredient.new(recipe: @recipe)
  end

  # GET /cookbook/recipes/1/edit
  def edit
  end

  # POST /cookbook/recipes
  def create
    @ingredient = Cookbook::Ingredient.new(cookbook_ingredient_params)
    @ingredient.recipe = @recipe

    if @ingredient.save
      render partial: 'new_button'
    else
      render :new
    end
  end

  # PATCH/PUT /cookbook/recipes/1
  def update
    if @recipe.update(cookbook_ingredient_params)
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /cookbook/recipes/1
  def destroy
    @recipe.destroy

    render :new
  end

  private

  def set_recipe
    @recipe = Cookbook::Recipe.find(params[:recipe_id])
  end

  def cookbook_ingredient_params
    params.require(:ingredient).tap do |p|
      p[:inventory_unit_id] ||= p[:unit]

      p.delete(:unit)
    end.permit(:amount, :inventory_unit_id)
  end
end
