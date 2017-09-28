require "rails_helper"

RSpec.feature "user", :type => :feature do
  scenario "logs in" do
    user = User.create!(username: 'user10', password: 'user10', email: 'user10')

    visit '/login'
    fill_in 'Username', :with => 'user10'
    fill_in 'Password', :with => 'user10'
    click_button 'Login'

    visit '/'
    expect(page).to have_text("All Todos")
    visit '/logout'
  end

  scenario "creates a new todo" do
    user = User.create!(username: 'user10', password: 'user10', email: 'user10')

    visit '/login'
    fill_in 'Username', :with => 'user10'
    fill_in 'Password', :with => 'user10'
    click_button 'Login'

    visit '/todos/new'
    expect(page).to have_text("Title")
    fill_in "Title", :with => "todo-with-rspec"
    fill_in "Description", :with => "todo-desc-rspec"
    #select("October", from: "todo[due_date(2i)]").select_option
    #select("10", from: "todo[due_date(3i)]").select_option
    #select("2018", from: "todo[due_date(1i)]").select_option

    select("October", from: "todo[due_date(2i)]").select_option
    select("22", from: "todo[due_date(3i)]").select_option
    select("2018", from: "todo[due_date(1i)]").select_option

    #find('#todo_due_date_2i').find('option[value="10"]').click
    #find('#todo_due_date_3i').find('option[value="22"]').click
    #find('#todo_due_date_1i').find('option[value="2020"]').click
    save_and_open_page
    click_button "Create Todo"

    #todo = Todo.find_by(title: 'todo-with-rspec')
    todos = Todo.all
    p todos.length
    expect(todo).to be_truthy
  end

#  scenario "creates a new todo" do
#    user = User.create!(username: 'user10', password: 'user10', email: 'user10')
#
#    visit '/login'
#    fill_in 'Username', :with => 'user10'
#    fill_in 'Password', :with => 'user10'
#    click_button 'Login'
#
#    visit '/todos/new'
#    expect(page).to have_text("Title")
#    fill_in "Title", :with => "todo-with-rspec"
#    fill_in "Description", :with => "todo-desc-rspec"
#    click_button "Create Todo"
#
#    todo = Todo.find(title: 'todo-with-rspec')
#    visit '/todo/' + todo.id.to_s + '/edit'
#    save_and_open_page
#  end
end
