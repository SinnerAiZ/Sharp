class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  layout 'details'
  # GET /teachers
  # GET /teachers.json
  def index
    @nonpaged_teachers = Teacher.all
    @teachers = @nonpaged_teachers.page(params[:page]).per(20)
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
    @course = Course.new
  end

  # GET /teachers/new
  def new
    if @account.teacher
        redirect_to teacenter_path and return
    end
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers
  # POST /teachers.json
  def create

    if @account.teacher
        respond_to do |format|
          format.html { redirect_to teacenter_path, notice: 'Teacher has been existed.' }
        end
        return
    end
    @teacher = Teacher.new(teacher_params)
    respond_to do |format|
      if @teacher.save
        @account.teacher = @teacher
        @account.is_teacher = true
        @account.save
        format.html { redirect_to teacenter_path, notice: 'Teacher was successfully created.' }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:name, :sex, :address, :school, :intro)
    end
end
