class ProgrammersController < ApplicationController
  
  # GET /programmers
  # GET /programmers.json
   def generate_new_password_email
      user = User.find(params[:user_id])
      user.send_reset_password_instructions
      flash[:notice] = "Reset password instructions have been sent to #{user.email}."
      redirect_to admin_user_path(user)
   end
  def index
    @programmers = Programmer.all
    @pins = @programmers.to_gmaps4rails
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @programmers }
    end
  end

  # GET /programmers/1
  # GET /programmers/1.json
  def show
    @programmer = Programmer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @programmer }
    end
  end

  # GET /programmers/new
  # GET /programmers/new.json
  def new
    @programmer = Programmer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @programmer }
    end
  end

  # GET /programmers/1/edit
  def edit
    @programmer = Programmer.find(params[:id])
  end

  # POST /programmers
  # POST /programmers.json
  def create
    @programmer = Programmer.new(params[:programmer])

    respond_to do |format|
      if @programmer.save
        format.html { redirect_to @programmer, notice: 'Programmer was successfully created.' }
        format.json { render json: @programmer, status: :created, location: @programmer }
      else
        format.html { render action: "new" }
        format.json { render json: @programmer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /programmers/1
  # PUT /programmers/1.json
  def update
    @programmer = Programmer.find(params[:id])

    respond_to do |format|
      if @programmer.update_attributes(params[:programmer])
        format.html { redirect_to @programmer, notice: 'Programmer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @programmer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programmers/1
  # DELETE /programmers/1.json
  def destroy
    @programmer = Programmer.find(params[:id])
    @programmer.destroy

    respond_to do |format|
      format.html { redirect_to programmers_url }
      format.json { head :no_content }
    end
  end
end
