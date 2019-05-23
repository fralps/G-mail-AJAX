class EmailsController < ApplicationController
  def index
  	@emails = Email.all.reverse
  end

  def create
    # Creation d'un nouvel e-mail
    @email = Email.create(
      object: Faker::Lorem.sentence(4),
      body: Faker::Lorem.paragraph(20),
      wasread: false
      )

    # Permet le remote et l'execution AJAX
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def destroy  
    @emails = Email.all.reverse
    @email = Email.find(params[:id])

    @email.destroy  	

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def show
    @emails = Email.all.reverse
    @email = Email.find(params[:id])	
    @email.update(wasread: true)
    # Si on show le mail, il est lu donc on pass wasread à true
    

    # Permet le remote et l'execution AJAX
    respond_to do |format|
      format.html { redirect_to email_path(@email.id) }
      format.js { }
    end
  end
  
end
