class Manage::PersonPresenter
  def initialize(person)
    @person = person
  end

  def <=>(other)
    last_name <=> other.last_name
  end

  def lname_fname
    "#{last_name}, #{first_name}"
  end

  def fname_lname
    "#{first_name} #{last_name}"
  end

  delegate :first_name, :id, :last_name, to: :person

  private

  attr_reader :person
end
