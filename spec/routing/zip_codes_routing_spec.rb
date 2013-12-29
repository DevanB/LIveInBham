require "spec_helper"

describe ZipCodesController do
  describe "routing" do

    it "routes to #index" do
      get("/zip_codes").should route_to("zip_codes#index")
    end

    it "routes to #new" do
      get("/zip_codes/new").should route_to("zip_codes#new")
    end

    it "routes to #show" do
      get("/zip_codes/1").should route_to("zip_codes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/zip_codes/1/edit").should route_to("zip_codes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/zip_codes").should route_to("zip_codes#create")
    end

    it "routes to #update" do
      put("/zip_codes/1").should route_to("zip_codes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/zip_codes/1").should route_to("zip_codes#destroy", :id => "1")
    end

  end
end
