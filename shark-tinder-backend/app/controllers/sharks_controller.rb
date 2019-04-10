class SharksController < ApplicationController
	def index
		sharks = Shark.all
		render json: sharks
	end

	def create
		shark = Shark.create(shark_params)
		if shark.valid?
			render json: shark
		else
			render json: shark.errors, status: :unprocessable_entity
		end
	end

  def destroy
    shark = Shark.find(params[:id])
    # shark.destroy

    if shark
      shark.destroy
      render json: shark, status: success
    else
      render json: shark.errors, status: :unprocessable_entity
    end
  end

  private

	# Handle strong parameters, so we are secure
	def shark_params
		params.require(:shark).permit(:name, :age, :enjoys)
	end
  
end
