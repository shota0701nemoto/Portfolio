class ContactsController < ApplicationController
  def new
    @contact = Contact.new

     if @contact.valid?
    else

      render :new
  end
  end


  def confirm
    @contact = Contact.new(contact_params)

    return if @contact.valid?

      flash[:success] = '正しく入力してください'

      render :new

    end

    def back
   @contact = Contact.new(contact_params)
   render :new
 end

  def create
    #Contact.create!(contact_params)
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      flash[:success] = 'お問い合わせを受け付けました'
      redirect_to root_path
    else
      flash[:success] = '正しく入力してください'
      render :new
    end
  end



  private

  def contact_params
    params.require(:contact).permit(:email, :message)
  end
end
