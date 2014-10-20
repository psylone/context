module TasksHelper

  def show_task_class task
    css = 'tasks__next__element'
    css += task.content.blank? ? ' tasks__next__empty-element' : ' tasks__next__filled-element'
    css
  end

  def show_task task
    task.content.present? ? task.content : '+'
  end

end
