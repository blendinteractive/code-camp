require "spec_helper"

describe SpeakersController do
  let(:speaker) {Speaker.create(firstname: "Seth", lastname: "Larson", email: "tyler@blendisimo.com")}
  describe "speaker routes" do
    it "routes get /speakers to speakers#index" do
      expect(:get => "/speakers").to route_to(
        :controller => "speakers",
        :action => "index",
      )
    end
    it "routes get /speakers/:id to speakers#show" do
      expect(:get => "/speakers/" + speaker.id.to_s).to route_to(
        :controller => "speakers",
        :action => "show",
        :id => speaker.id.to_s
      )
    end
  end
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the speakers into @speakers" do
      speaker1 = Speaker.create!(firstname: "Seth", lastname: "Larson", email: "tyler@blendisimo.com")
      speaker2 = Speaker.create!(firstname: "Tyler", lastname: "Harms", email: "seth@blendisimo.com")
      get :index

      expect(assigns(:speakers)).to match_array([speaker1, speaker2])
    end
  end
  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show, :id => speaker.id
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
    it "renders the show template" do
      get :show, :id => speaker.id
      expect(response).to render_template("show")
    end
  end
end
