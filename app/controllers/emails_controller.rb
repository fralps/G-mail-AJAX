class EmailsController < ApplicationController
  def index
  	@emails = Email.all
  end

  def create
    # Creation d'un nouvel e-mail
  	@email = Email.create(
      object: Faker::Lorem.sentence(4),
      body: Faker::Lorem.paragraph
      )

    # Permet le remote et l'execution AJAX
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def destroy  	
  end

  def show
    @email = Email.find(params[:id])	

    # Permet le remote et l'execution AJAX
    respond_to do |format|
      format.html { redirect_to email_path(@email.id) }
      format.js { }
    end
  end
  
end
