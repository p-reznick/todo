require "rails_helper"

RSpec.describe Todo, :type => :model do

  it "returns title... if title is greater than 10 chars" do
    # if the title is longer than 10 chars, take the first 10 chars and add "..."
    # if the title is less than 10 chars, return the title
    todo = Todo.new(title: "Newest todo", description: "first todo", due_date: Time.now)
    expect(todo.return_title_digest).to eq("Newest tod...")
  end

  it "returns title if title is less than 10 chars" do
    todo = Todo.new(title: "New todo", description: "first todo", due_date: Time.now)
    expect(todo.return_title_digest).to eq("New todo")
  end

  it "returns todos due within the next 24 hours" do
    # a class method that returns todos due within the next 24 hours
    # end
    user = User.create(username: "user1", password: "xyz")
    category = Category.create!(title: "New Category", user_id: user.id)

    todo1 = Todo.create!(title: "New todo", description: "first todo", due_date: Time.now, user_id: user.id, category_id: category.id)
    todo2 = Todo.create!(title: "New todo", description: "first todo", due_date: Time.now, user_id: user.id, category_id: category.id)
    todo3 = Todo.create(title: "New todo", description: "first todo", due_date: 1.day.from_now + 10000, user_id: user.id, category_id: category.id)
    todo4 = Todo.create(title: "New todo", description: "first todo", due_date: 1.day.from_now + 10000, user_id: user.id, category_id: category.id)
    todo5 = Todo.create(title: "New todo", description: "first todo", due_date: 1.day.from_now + 10000, user_id: user.id, category_id: category.id)

    expect(Todo.due_within_24_hours.length).to eq(2)
  end

end
