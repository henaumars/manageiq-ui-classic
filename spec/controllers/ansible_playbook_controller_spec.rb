describe AnsiblePlaybookController do
  before do
    EvmSpecHelper.create_guid_miq_server_zone
    login_as FactoryGirl.create(:user_admin)
  end

  context "#show" do
    let(:playbook) { FactoryGirl.create(:embedded_playbook) }
    subject { get :show, :params => {:id => playbook.id} }
    render_views

    it "returns status 200" do
      is_expected.to have_http_status 200
    end

    it "renders correct template" do
      is_expected.to render_template(:partial => "layouts/_textual_groups_generic")
    end

    it "does not display tags" do
      get :show, :params => {:id => playbook.id}
      expect(response.body).not_to include("Smart Management")
    end
  end

  context "#show_list" do
    subject { get :show_list }
    render_views

    it "returns status 200" do
      is_expected.to have_http_status 200
    end

    it "renders correct template" do
      is_expected.to render_template(:partial => "layouts/_gtl")
    end
  end
end
