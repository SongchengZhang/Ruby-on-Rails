class SearchController < ApplicationController
  #search according to titles
    def search  
        if params[:search].blank?  
          redirect_to('/admin/index', alert: "Empty Search!")
        else  
            @paramter=params[:search].strip
            @results = Course.all.where("title LIKE :search", search: "%#{@paramter}%")

        end  
      end
end
