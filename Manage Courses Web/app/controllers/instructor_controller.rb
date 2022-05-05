class InstructorController < ApplicationController 
  #Send admin requests to admin from instrutors and reload page
    def approve_pending_admin
        user = User.find(params[:data][:id])
        if user.role == 'instructor' then
          puts("Approving user " + user.email)
          user.update!({:role =>5})
        end
        redirect_to :controller => 'instructor', :action => 'index'
      end

    def index
      #@courses = Course.all
      @pagy, @courses = pagy(Course.order(catalogNumber: :ASC),items: 15)
      render "instructor/index"
    end

    
    def apply_course 
    @user_course = UserCourse.new(user_id: params[:id], course_id: params[:id2])
    @user_course.update!({:apply =>1})
    @user_course.save
    redirect_to :controller => 'instructor', :action => 'index'
    end

    def evaluate
      @evaluation = Evaluation.new
    end
end
