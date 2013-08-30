ActiveAdmin.register Speaker do
  controller do
    def permitted_params
      params.permit(:speaker => [:firstname, :lastname, :email])
    end
  end
end
