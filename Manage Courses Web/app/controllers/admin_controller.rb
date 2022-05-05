class AdminController < ApplicationController
  skip_before_action :verify_authenticity_token
def increaseMax
  c=Course.find(params[:id])
  c.maxNumber+=1
  c.save
  redirect_to :controller => 'admin', :action => 'index'
end
def decreaseMax
  c=Course.find(params[:id])
  if c.maxNumber > 1
    c.maxNumber-=1
  end
  c.save
  redirect_to :controller => 'admin', :action => 'index'
end


  def approve_course
    us=UserCourse.find(params[:id])
    us.update!({:apply =>2})
    us.save
    redirect_to :controller => 'admin', :action => 'index'
  end

  def disapprove_course
    us=UserCourse.find(params[:id])
    us.update!({:apply =>0})
    us.save
    redirect_to :controller => 'admin', :action => 'index'
  end

  def approve_grader
    id = current_user.id;
    us=UserCourse.find(params[:id])
   us.update!({:gApply =>2})
    us.save
    uc=Course.find_by(id: us.course_id)

    Grader.create({
      user: us.user,
      section: Section.find(params[:section_id]),
      course_id: uc.id
    })

    uc.graderNumber+=1
    uc.save
    redirect_to :controller => 'admin', :action => 'index'
  end
  def disapprove_grader
    us=UserCourse.find(params[:id])
   us.update!({:gApply =>0})
    us.save
    redirect_to :controller => 'admin', :action => 'index'
  end

    #Approve requests become instructor from students and reload page
  def approve_instructor
    user = User.find(params[:data][:id])
    if user.role == 'student_pending_instructor' then
      puts("Approving user " + user.email)
      user.update!({:role =>1})
    end
    redirect_to :controller => 'admin', :action => 'index'
  end

  #Setlink and load in one action
  def setLink
    Course.setBaseUri(params["course"]["base_uri"])
    Course.getCourseFromOSU
    redirect_to :controller => 'admin', :action => 'index' #refresh page to update table
  end

  #Load controller just for access
  def load
    Course.getCourseFromOSU
  end

  def error
    #render "admin/error"
  end

  def index
    #render "admin/index"
    #@courses = Course.all
    @pagy, @courses = pagy(Course.order(catalogNumber: :ASC),items: 10)
    if !current_user.nil?
      if !current_user.admin?
        redirect_to :controller => 'admin', :action => 'error' #current_user not admin
      end
    else
      redirect_to :controller => 'admin', :action => 'error' #current_user undefined
    end
  end
  #Approve requests become admin from students and reload page
  def approve_admin
    user = User.find(params[:data][:id])
    if user.role == 'student_pending_admin' or user.role == 'instructor_pending_admin'then
      puts("Approving user " + user.email)
      user.update!({:role =>2})
    end
    redirect_to :controller => 'admin', :action => 'index'
  end
  #Refuse requests from students or instrutors and reload page
  def refuse_admin
    user = User.find(params[:data][:id])
    if user.role == 'student_pending_instructor' then
      puts("Approving user " + user.email)
      user.update!({:role =>0})
    end
    user = User.find(params[:data][:id])
    if user.role == 'instructor_pending_admin' then
      puts("Approving user " + user.email)
      user.update!({:role =>1})
    end
    
    redirect_to :controller => 'admin', :action => 'index'
  end

end

