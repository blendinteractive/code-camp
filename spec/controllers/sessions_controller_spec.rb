require "spec_helper"

describe SessionsController do
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
end
