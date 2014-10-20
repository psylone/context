class TasksController < ApplicationController

  # skip_before_action :verify_authenticity_token, :only => [ :create, :incontext, :step ]
  # before_action :find_task, only: [ :incontext, :step ]

  def index
  #   @tasks = current_user.tasks.free.incomplete.recent(5)
  #   @context = current_user.tasks.context.first
  end

  def create
  #   permitted = params.permit(:content)
  #   @task = current_user.tasks.build permitted
  #   render json: { success: @task.save, id: @task.id }
  end

  # def incontext
  #   result = @task.be_incontext!
  #   render json: { success: result, content: @task.content }
  # end

  # def step
  # end


  # private

  # def find_task
  #   @task ||= current_user.tasks.find params[:id]
  # end

end
