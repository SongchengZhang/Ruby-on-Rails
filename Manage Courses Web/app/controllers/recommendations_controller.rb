class RecommendationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
        @recommendation = Recommendation.new
        @courses = Course.all
    end

    def create
        @recommendation = Recommendation.new(recommendation_params)
        @recommendation.user_id = current_user.id 

        @recommendation.save

        redirect_to '/'
    end

    def apply
      @user_course = UserCourse.new(user_id: params[:user_id], course_id: params[:course_id])

      user = User.find(params[:user_id])

      if (user.role == "students")
        @user_course.update!({:gApply=>1})
      elsif user.role == "instructors"
        @user_course.update!({:apply=>1})
      end

      @user_course.save

      Recommendation.destroy(params[:id])

      redirect_back(fallback_location:"/")
    end

    def delete
      Recommendation.destroy(params[:id])

      redirect_back(fallback_location:"/")
    end

    private
        # Whitelist for [trusted] params for recommendation creation
        def recommendation_params
            params.fetch(:recommendation, {}).permit(:student_email, :course_id, :id)
        end
end
  