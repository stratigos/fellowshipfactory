class Manage::PresentPeople
  def self.call(people: [])
    new(people: people).send(:call)
  end

  private

  attr_reader :people

  def initialize(people: [])
    @people = people
  end

  def call
    if people.empty?
      @people = Person.all
    end

    people.map { |person| ::Manage::PersonPresenter.new(person) }.sort
  end
end
