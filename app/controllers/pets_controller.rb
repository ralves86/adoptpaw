class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
    @booking = Booking.new
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to pets_path
    else
      render :new
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    # no need for app/views/pet/destroy.html.erb
    redirect_to pets_path
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :description, :location, :fee, :breed, :medical, :photo)
  end

  def require_permission
    if current_user != Pet.find(params[:id]).user
      redirect_to pets_path
      # Or do something else here
    end
  end
end
