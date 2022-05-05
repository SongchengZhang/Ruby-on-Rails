class ApplicationFormsController < ApplicationController
  before_action :set_application_form, only: %i[ show edit update destroy ]

  # GET /application_forms or /application_forms.json
  def index
    
  end

  # GET /application_forms/1 or /application_forms/1.json
  def show
  end

  # GET /application_forms/new
  def new
    @application_form = ApplicationForm.new
  end

  # GET /application_forms/1/edit
  def edit
  end

  # POST /application_forms or /application_forms.json
  def create
    @application_form = ApplicationForm.new(application_form_params)

    respond_to do |format|
      if @application_form.save
        format.html { redirect_to application_form_url(@application_form), notice: "Application form was successfully created." }
        format.json { render :show, status: :created, location: @application_form }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @application_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /application_forms/1 or /application_forms/1.json
  def update
    respond_to do |format|
      if @application_form.update(application_form_params)
        format.html { redirect_to application_form_url(@application_form), notice: "Application form was successfully updated." }
        format.json { render :show, status: :ok, location: @application_form }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @application_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /application_forms/1 or /application_forms/1.json
  def destroy
    @application_form.destroy

    respond_to do |format|
      format.html { redirect_to application_forms_url, notice: "Application form was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application_form
      @application_form = ApplicationForm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def application_form_params
      params.fetch(:application_form, {}).permit(:qualifications, :details, :userEmail)
    end
end
