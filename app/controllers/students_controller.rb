class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    @student=set_student
  end

  def edit
    @student=set_student
    if @student.active
      @student.update(active: false)
    else
      @student.update(active: true)
    end
    @student.save
    redirect_to show
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
