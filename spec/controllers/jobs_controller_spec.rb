require 'spec_helper'
require 'rails_helper'

describe JobsController do
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end