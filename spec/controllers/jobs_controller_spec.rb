require 'spec_helper'
require 'rails_helper'

describe JobsController do
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET engineering_jobs" do
    it "renders the engineering jobs template" do
      get :engineering_jobs
      expect(response).to render_template("engineering_jobs")
    end
  end

  describe "GET call_center_jobs" do
    it "renders the call_center_jobs template" do
      get :call_center_jobs
      expect(response).to render_template("call_center_jobs")
    end
  end

  describe "GET education_jobs" do
    it "renders the education_jobs template" do
      get :education_jobs
      expect(response).to render_template("education_jobs")
    end
  end

  describe "GET index" do
    it "creates a job" do
      job = Job.create(title: "job1", description: "the first job")
      get :index
      assigns(:jobs).should eq([job])
    end

    it "does not contain jobs" do
      get :index
      expect(@jobs).to eq(nil)
    end
  end

  describe 'DELETE destroy' do
    it "deletes the contact" do
      expect(Job.count).to eq(0)
      @job = Job.create(title: "engineer", description: "entry level chemE", id: 1)
      delete :destroy, id: @job
      response.should redirect_to '/'
    end
  end
end
