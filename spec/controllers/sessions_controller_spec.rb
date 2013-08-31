require "spec_helper"

describe SessionsController do
  let(:speaker) {Speaker.create(firstname: "Seth", lastname: "Larson", email: "tyler@blendisimo.com")}
  let(:session) {Session.create(speaker: speaker, title: "Speaker 2 test title")}
  describe "session routes" do
    it "routes get /sessions to sessions#index" do
      expect(:get => "/sessions").to route_to(
        :controller => "sessions",
        :action => "index",
      )
    end
    it "routes get /sessions/:id to sessions#show" do
      expect(:get => "/sessions/" + session.id.to_s).to route_to(
        :controller => "sessions",
        :action => "show",
        :id => session.id.to_s
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

    it "loads all of the sessions into @sessions" do
      session_speaker1 = Speaker.create!(firstname: "Seth", lastname: "Larson", email: "tyler@blendisimo.com")
      session_speaker2 = Speaker.create!(firstname: "Tyler", lastname: "Harms", email: "seth@blendisimo.com")

      session1 = Session.create!(speaker: session_speaker1, title: "Speaker 1 test title")
      session2 = Session.create!(speaker: session_speaker2, title: "Speaker 2 test title")

      get :index

      expect(assigns(:sessions)).to match_array([session1, session2])
    end
  end
  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show, :id => session.id
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
    it "renders the show template" do
      get :show, :id => session.id
      expect(response).to render_template("show")
    end
  end
end
