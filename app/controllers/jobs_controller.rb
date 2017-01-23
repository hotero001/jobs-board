require 'capybara'

class JobsController < ApplicationController
  before_action :require_admin, only: [:new, :create, :destroy]

  def index
    url = "http://bumeran.com.mx/nuevo-leon/empleos-categoria-call-center.html"
    page = HTTParty.get('http://www.bumeran.com.mx/nuevo-leon/empleos-categoria-call-center.html')
    parsed_page = Nokogiri::HTML(page)
    @parser = parsed_page.css('.aviso_box')
    @parsed = parsed_page.css('.aviso_cuando')
    @parsed_count = parsed_page.css('.aviso_cuando').count
    @parser_count = parsed_page.css('.aviso_box').count
  	@jobs = Job.all  
  end

  #might not need this method after all
  def driver_method
    bumeran = "http://bumeran.com.mx/"
    page = HTTParty.get(bumeran)
    parsed_page = Nokogiri::HTML(page)
    #add some variables here that can access the data from bumeran
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
