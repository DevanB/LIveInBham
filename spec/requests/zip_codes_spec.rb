require 'spec_helper'

describe "ZipCodes" do
  describe "GET /zip_codes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get zip_codes_path
      response.status.should be(200)
    end
  end
end