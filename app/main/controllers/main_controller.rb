# By default Volt generates this controller for your Main component
class MainController < Volt::ModelController

  # A Volt::ModelController can have a model assigned to it, and
  # that model has a bunch of behaviors. We want to store our controller's
  # information into a database, so we will import a ":store" type of model,
  # which means our controller will import a bunch of methods to implement
  # this type of model's responsibilities.
  model :store

  def index
    # Add code for when the index view is loaded
  end

  def about
    # Add code for when the about view is loaded
  end

  def add_todo
    _todos << { name: page._new_todo }
    page._new_todo = ''
  end

  def current_todo
    _todos[params._index.or(0).to_i]
  end

  def remove_todo(todo)
    _todos.delete(todo)
  end

  private

  # The main template contains a #template binding that shows another
  # template.  This is the path to that template.  It may change based
  # on the params._controller and params._action values.
  def main_path
    params._controller.or('main') + '/' + params._action.or('index')
  end

  # Determine if the current nav component is the active one by looking
  # at the first part of the url against the href attribute.
  def active_tab?
    url.path.split('/')[1] == attrs.href.split('/')[1]
  end
end
