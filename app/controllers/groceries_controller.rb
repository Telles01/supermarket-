class GroceriesController < ApplicationController
  before_action :set_grocery, only: %i[ show edit update destroy ]

  # GET /groceries
  def index
    @groceries = Grocery.all
  end

  # GET /groceries/1
  def show
  end

  # GET /groceries/new
  def new
    @grocery = Grocery.new
  end

  # GET /groceries/1/edit
  def edit
  end

  # POST /groceries
  def create
    @grocery = Grocery.new(grocery_params)

    if @grocery.save
      redirect_to @grocery, notice: "Grocery was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /groceries/1
  def update
    if @grocery.update(grocery_params)
      redirect_to @grocery, notice: "Grocery was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /groceries/1
  def destroy
    @grocery.destroy
    redirect_to groceries_url, notice: "Grocery was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grocery
      @grocery = Grocery.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grocery_params
      params.require(:grocery).permit(:name, :address, :rating)
    end
end
