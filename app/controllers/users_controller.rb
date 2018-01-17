class UsersController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def create
    @user = User.new(params[:user])
    #@user.password = "102030"
    #@user.password_confirmation = "102030"

    respond_to do |format|
      if @user.save

        # As linhas abaixo enviam email para o usuário. Precisa encontrar uma maneira correta de fazer isso.
        # OBS: Está funcionando!
        # @user = current_user
        # UserMailer.registration_confirmation(@user).deliver
 
        format.html { redirect_to @user, notice: 'Usuário criado com sucesso.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # método criado

  # def enviar
    # @user = user
    # mail(to: @user.email, subject: "Testando a gem letter_opener!")
  # end

  private

  def user_params
    params.require(:user).permit(:name,:telefone)
  end

end
