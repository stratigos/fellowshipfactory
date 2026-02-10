class Manage::PeopleController < Manage::ManageController
  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to(manage_people_path, notice: "Person created successfully")
    else
      render :new
    end
  end

  def destroy
    @person = Person.find(params[:id])

    if @person.destroy
      redirect_to(manage_people_path, notice: "Person deleted successfully")
    else
      redirect_to(manage_people_path, alert: "Failed to delete Person")
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def update
    @person = Person.find(params[:id])

    if @person.update(person_params)
      redirect_to(manage_people_path, notice: "Person updated successfully")
    else
      render :edit
    end
  end

  private

  def person_params
    params
      .require(:person)
      .permit(:age, :email, :first_name, :last_name, organization_ids: [])
  end
end
