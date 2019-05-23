class EmailsController < ApplicationController
  def index
  	@emails = Email.all
  end

  def create
  	@email = Email.new(object: Faker::Lorem.sentence(4),
  												body: Faker::Lorem.paragraph)

  	if @email.save

      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end

      flash[:notice] = "You received an email"
    else
      redirect_to root_path
      flash[:notice] = "Something went wrong"
    end
  end

  def destroy  	
  end

  def show  	
  end
end
