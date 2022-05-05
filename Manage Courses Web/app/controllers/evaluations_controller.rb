class EvaluationsController < ApplicationController
    def create
        @evaluation = Evaluation.new evaluation_params
        @evaluation.instructor_id = current_user.id
        @evaluation.save

        redirect_to '/'
    end

    private
    # Whitelist for [trusted] params for recommendation creation
    def evaluation_params
        params.fetch(:evaluation, {}).permit(:student_email, :body)
    end
end