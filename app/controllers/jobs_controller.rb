class JobsController < ApplicationController
  def index
  	@jobs = Job.all
  end

  def create
  	@job = Job.new(job_params)
  	if @job.save
  	  redirect_to '/'
  	else
      render :new
  	end
  end

  def new
  	@job = Job.new
  end

  def destroy
  	@job = Job.find(params[:id])
  	@job.destroy
  	redirect_to '/'
  end

  def update
  end

  def show
  	@job = Job.find(params[:id])
  end

  def edit
  end

  private

    def job_params
      params.require(:job).permit(:title, :company, :pay, :description)
    end
end
