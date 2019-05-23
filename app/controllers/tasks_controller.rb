class TasksController < ApplicationController
  before_action :authenticate_user!

  def new
    @categories = Category.all
  end

  def create
    @task = Task.new(task_params)
    @category = Category.find(category_params)
    @task.category = @category
    if @task.save

      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end

      flash[:notice] = "Task created"
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end

  def edit
    @task = Task.find(params[:id])
    @categories = Category.all

  end

  def update
    @task = Task.find(params[:id])

    # If the box is actived and the box is checked, the param :name has the value 1, so we pass it to true
    # else, it means it is unchecked, and status goes to false.
    if (task_params[:name] == "1")
      @task.update(status: true)
    else
      @task.update(status: false)
    end

    flash[:notice] = "Task edited"


    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def index
    @tasks = Task.all
    @category = Category.find(category_params)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end


  private

  def task_params
    params.permit(:title, :deadline, :description, :id, :status, :name)
  end

  def category_params
    params.require(:Category)
  end

end
