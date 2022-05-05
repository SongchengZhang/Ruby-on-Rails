class Course < ApplicationRecord
    include HTTParty
    validates :title, presence: true
    has_many :user_course
    has_many :user, through: :user_course
    base_uri ''
    #default_params fields: "title, term, catalogNumber, shortDescription", q: "search"
    #format :json

    #def self.for term
        #get("", query: {query: term})["courses"]
    #end

    #Seeds/fills Course table from osu API url
    def self.getCourseFromOSU
        Section.destroy_all
        Course.destroy_all
        
        
        response = HTTParty.get(@base_uri)
        
        course_list = response.parsed_response["data"]["courses"]

        sectionCount = 0

        course_list.each do |elem| #elem is {course => {...} }
            #puts elem["course"]["term"]  #this would print each elem term value
    
            course_element = elem["course"]

            #new Course table tuple and save
            #Attributes title, term, catalogNumber, shortDescription only 
            Course.create!({title: course_element["title"], 
            term: course_element["term"], 
            catalogNumber: course_element["catalogNumber"], 
            maxUnits: course_element["maxUnits"],
            minUnits: course_element["minUnits"],
            academicOrg: course_element["academicOrg"],
            academicCareer: course_element["academicCareer"],
            subject: course_element["subject"],
            subjectDesc: course_element["subjectDesc"],
            courseId: course_element["courseId"],
            maxNumber: 3,
            graderNumber: 0,
            shortDescription: course_element["shortDescription"],
            offeringNumber: course_element["offeringNumber"]})
            

            sections = elem["sections"]
            sections.each do |elem2|
                sectionCount = sectionCount + 1
                section1 = elem2

                Section.create!({course_id: Course.last.id,
                classNumber: section1["classNumber"],
                section: section1["section"],
                instructionMode: section1["instructionMode"],
                startDate: section1["startDate"],
                endDate: section1["endDate"],
                cancelDate: section1["cancelDate"],
                sessionCode: section1["sessionCode"],
                meetingDays: section1["meetingDays"],
                waitlistCapacity: section1["waitlistCapacity"],
                enrollmentTotal: section1["enrollmentTotal"],
                waitlistTotal: section1["waitlistTotal"],
                courseOfferingNumber: section1["courseOfferingNumber"]
                })
            end
        end
        #puts "Seeded courses table with " + course_list.length.to_s + " courses from url " + url
        #puts "Seeded sections table with " + sectionCount.to_s() + " sections"
    end
    def self.setBaseUri(url)
        @base_uri = url    
    end
    
end
