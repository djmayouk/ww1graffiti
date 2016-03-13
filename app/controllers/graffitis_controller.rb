class GraffitisController < ApplicationController
  before_action :admin_user, only: [:new,:edit,:create,:update]

  def index
    @graffitis = Graffiti.all
  end

  def show
    @graffiti = Graffiti.find(params[:id])
  end

  def new
    @graffiti = Graffiti.new
  end

  def edit
    @graffiti = Graffiti.find(params[:id])
  end

  def create
#    render plain: params[:graffiti].inspect

    @graffiti = Graffiti.new(graffiti_params)
    if @graffiti.save
      redirect_to graffiti_show_path(@graffiti)
    else
      render 'new'
    end
  end

  def update
    @graffiti = Graffiti.find(params[:id])
    if @graffiti.update(graffiti_params)
      redirect_to graffiti_show_path(@graffiti)
    else
      render 'edit'
    end
  end

  private
    def graffiti_params
      params.require(:graffiti).permit(:surname,
                                       :forenames,
                                       :rank,
                                       :soldier_number,
                                       :location,
                                       :graffiti_year,
                                       :graffiti_month,
                                       :graffiti_dayinmonth,
                                       :dob,
                                       :survived_war,
                                       :notes)
    end
end
