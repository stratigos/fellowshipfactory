class Manage::OrganizationsController < Manage::ManageController
  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      redirect_to(
        manage_organizations_path,
        notice: "Organization created successfully"
      )
    else
      render :new
    end
  end

  def destroy
    @organization = Organization.find(params[:id])

    if @organization.destroy
      redirect_to(
        manage_organizations_path,
        notice: "Organization deleted successfully"
      )
    else
      redirect_to(
        manage_organizations_path,
        alert: "Failed to delete organization"
      )
    end
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def index
    @organizations = Organization.includes(:people).all
  end

  def list_people
    @organization = Organization.includes(:people).find(params[:id])

    render(partial: "people_card", locals: {organization: @organization})
  end

  def new
    @organization = Organization.new
  end

  def update
    @organization = Organization.find(params[:id])

    if @organization.update(organization_params)
      redirect_to(
        manage_organizations_path,
        notice: "Organization updated successfully"
      )
    else
      render :edit
    end
  end

  private

  def organization_params
    params.expect(organization: [:name, person_ids: []])
  end
end
