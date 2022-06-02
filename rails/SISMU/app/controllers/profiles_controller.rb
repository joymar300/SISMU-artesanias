class ProfilesController < ApplicationController
before_action :authenticate_user!
before_action :set_profile
def show
  @profile= Profile.find(params[:id])
end

def edit
    
end

def update
    @profile= Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
        render :edit
    end
end

private
def set_profile
@profile = (current_user.profile ||= Profile.create)
end
def profile_params
params.require(:profile).permit(:foto, :nombre, :apellido , :ciudad , :estado, :direccion)
end
end
