require 'capybara'

class JobsController < ApplicationController
  before_action :require_admin, only: [:new, :create, :destroy]

  def set_url(url)
    page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(page)
    @parser = parsed_page.css('.aviso_box')
    @parsed = parsed_page.css('.aviso_cuando')
  end

  def index
    url = "http://bumeran.com.mx/nuevo-leon/empleos-categoria-call-center.html"
    page = HTTParty.get('http://www.bumeran.com.mx/nuevo-leon/empleos-categoria-call-center.html')
    parsed_page = Nokogiri::HTML(page)
    @parser = parsed_page.css('.aviso_box')
    @parsed = parsed_page.css('.aviso_cuando')
  	@jobs = Job.all
    #this specialty hash below should have the 22 areas of employment displayed
    @specialty_hash = {"Call Center"=>'/callcenter', "Engineering"=>'/engineering', "Education"=>'/education', "Abastecimiento y Logistica"=>'/abastecimiento', 
      "Administracion, Contibilidad, Y Finanzas"=> '/administracion', "Aduana y Comercio Exterior"=>'/aduana', "Comercial, Ventas, y Negocio"=>'comercial', 
      "Comunicacion, Relaciones Institucionales, Y Publica"=>'/comunicacion', "Diseno"=> '/diseno', "Gastronomia y Turismo"=> '/gastronomia', "Gerencia y Direccion General"=> '/gerencia',
      "Legales"=> '/legales', "Marketing y Publicidad"=> '/marketing', "Mineria, Petroleo, y Gas"=> '/mineria', "Oficios y Otros"=> '/oficios',
      "Produccion y Manufactura"=> '/produccion', "Recursos Humanos y Capacitacion"=> '/rh', "Salud, Medicina, y Farmacia"=> '/salud', "Secretarias y Recepcion"=> '/secretarias',
      "Seguros"=> '/seguros', "Tecnologia, Sistemas, y Telecomunicaciones"=> '/tech'}
  end

  def abastecimiento
    url = "http://www.bumeran.com.mx/nuevo-leon/empleos-area-abastecimiento-y-logistica.html"
    set_url(url)
  end

  def administracion
    url = "http://www.bumeran.com.mx/nuevo-leon/empleos-area-administracion-contabilidad-y-finanzas.html"
    set_url(url)
  end

  def aduana
    url = "http://www.bumeran.com.mx/nuevo-leon/empleos-area-aduana-y-comercio-exterior.html"
    set_url(url)
  end

  def comercial
    url = "http://www.bumeran.com.mx/nuevo-leon/empleos-area-comercial-ventas-y-negocios.html"
    set_url(url)
  end

  def comunicacion
    url = "http://www.bumeran.com.mx/nuevo-leon/empleos-area-comunicacion-relaciones-institucionales-y-publicas.html"
    set_url(url)
  end

  def diseno
    url = "http://www.bumeran.com.mx/nuevo-leon/empleos-area-diseno.html"
    set_url(url)
  end

  def gastronomia
    url = "http://www.bumeran.com.mx/nuevo-leon/empleos-area-gastronomia-y-turismo.html"
    set_url(url)
  end

  def gerencia
    url = "http://www.bumeran.com.mx/nuevo-leon/empleos-area-gerencia-y-direccion-general.html"
    set_url(url)
  end

  def legales
    url = "http://www.bumeran.com.mx/nuevo-leon/empleos-area-legales.html"
    set_url(url)
  end

  def marketing
    url = "http://www.bumeran.com.mx/nuevo-leon/empleos-area-marketing-y-publicidad.html"
    set_url(url)
  end

  def mineria
    url = "http://www.bumeran.com.mx/nuevo-leon/empleos-area-mineria-petroleo-y-gas.html"
    set_url(url)
  end

  def oficios
    url = "http://www.bumeran.com.mx/nuevo-leon/empleos-area-oficios-y-otros.html"
    set_url(url)
  end

  def produccion
    url = "http://www.bumeran.com.mx/nuevo-leon/empleos-area-produccion-y-manufactura.html"
    set_url(url)
  end

  def rh
    url = "http://www.bumeran.com.mx/nuevo-leon/empleos-area-recursos-humanos-y-capacitacion.html"
    set_url(url)
  end

  def salud
    url = "http://www.bumeran.com.mx/nuevo-leon/empleos-area-salud-medicina-y-farmacia.html"
    set_url(url)
  end

  def secretarias
    url = "http://www.bumeran.com.mx/nuevo-leon/empleos-area-secretarias-y-recepcion.html"
    set_url(url)
  end

  def seguros
    url = "http://www.bumeran.com.mx/nuevo-leon/empleos-area-seguros.html"
    set_url(url)
  end

  def tech
    url = "http://www.bumeran.com.mx/nuevo-leon/empleos-area-tecnologia-sistemas-y-telecomunicaciones.html"
    set_url(url)
  end

  #might not need this method after all
  def driver_method
    flash[:alert] = "Your resume has been sent to the company. You will be contacted if you are a good fit for this job."
    bumeran = "http://bumeran.com.mx/"
    page = HTTParty.get(bumeran)
    parsed_page = Nokogiri::HTML(page)
    #add some variables here that can access the data from bumeran
  end

  def engineering_jobs
    url = "http://bumeran.com.mx/nuevo-leon/empleos-categoria-ingenieria.html"
    page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(page)
    @parser = parsed_page.css('.aviso_box')
    @parsed = parsed_page.css('.aviso_cuando')
  end

  def call_center_jobs
    url = "http://bumeran.com.mx/nuevo-leon/empleos-categoria-call-center.html"
    page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(page)
    @parser = parsed_page.css('.aviso_box')
    @parsed = parsed_page.css('.aviso_cuando')
  end

  def education_jobs
    url = "http://bumeran.com.mx/nuevo-leon/empleos-categoria-educacion.html"
    page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(page)
    @parser = parsed_page.css('.aviso_box')
    @parsed = parsed_page.css('.aviso_cuando')
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
