ActiveAdmin.register Session do
  controller do
    def permitted_params
      params.permit(:session => [:speaker_id, :title, :abstract])
    end
  end
end
