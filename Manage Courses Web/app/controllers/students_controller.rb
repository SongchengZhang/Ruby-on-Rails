class StudentsController < ApplicationController
    #Send instructor requests to admin from students and reload page
    def approve_pending_ins
        user = User.find(params[:data][:id])
        if user.role == 'students' then
          puts("Approving user " + user.email)
          user.update!({:role =>3})
        end
        redirect_to :controller => 'students', :action => 'index'
      end
      #Send admin requests to admin from students and reload page
      def approve_pending_admin
        user = User.find(params[:data][:id])
        if user.role == 'students' then
          puts("Approving user " + user.email)
          user.update!({:role =>4})
        end
        redirect_to :controller => 'students', :action => 'index'
      end
    
    def index
      #@courses = Course.all
      @pagy, @courses = pagy(Course.order(catalogNumber: :ASC),items: 15)
      render "students/index"
    end

    def apply_grader 
      @user_course = UserCourse.new(user_id: params[:id], course_id: params[:id2])
      @user_course.update!({:gApply =>1})
      @user_course.save
      redirect_to :controller => 'students', :action => 'index'
    end
end
