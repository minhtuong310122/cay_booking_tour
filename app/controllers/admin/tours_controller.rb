module Admin
  class ToursController < Admin::AdminController
    before_action :set_tour, except: %i[index new create]

    def index
      @tours = Tour.all
    end

    def new
      @tour = Tour.new
    end

    def show; end

    def create
      @tour = Tour.new params_tour
      if @tour.save
        redirect_to admin_tours_path
      else
        render :new
      end
    end

    def edit; end

    def update
      @tour.update params_tour
      redirect_to admin_tours_path
    end

    def destroy
      @tour.destroy!
      redirect_to admin_tours_path
    end

    private

    def params_tour
      params.require(:tour).permit :title, :image, :price, :description, :tour_type,
                                   :start_date, :end_date, :time_in_day, :limit_member
    end

    def set_tour
      @tour = Tour.find_by id: params[:id]
    end
  end
end
