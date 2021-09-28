class Cookbook::RecipesController < CookbookController
  before_action :set_cookbook_recipe, only: [:show, :edit, :update, :destroy]

  # GET /cookbook/recipes
  def index
    @recipes = Cookbook::Recipe.all
    render layout: false
  end

  # GET /cookbook/recipes/1
  def show
  end

  # GET /cookbook/recipes/new
  def new
    @recipe = Cookbook::Recipe.new
  end

  # GET /cookbook/recipes/1/edit
  def edit
  end

  # POST /cookbook/recipes
  def create
    @recipe = Cookbook::Recipe.new(cookbook_recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /cookbook/recipes/1
  def update
    if @recipe.update(cookbook_recipe_params)
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /cookbook/recipes/1
  def destroy
    @recipe.destroy
    redirect_to cookbook_recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cookbook_recipe
      @recipe = Cookbook::Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cookbook_recipe_params
      params.require(:recipe).permit(:name, :description, :preparion)
    end
end
