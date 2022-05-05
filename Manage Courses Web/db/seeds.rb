# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

url = 'https://content.osu.edu/v2/classes/search?q=&campus=col&p=1&term=1222'
response = HTTParty.get(url)
#p response.each
#count = 0

#response.parsed_response["data"].each do |elem|
    #puts elem
    #count = count + 1
#end
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
    shortDescription: course_element["shortDescription"]})

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
        waitlistTotal: section1["waitlistTotal"]
        })
    end

    #TODO: add all elements/attributes + other relations nested
    #TODO: add controller code to change URL and reload database for Admins.
end
    #["course"]["title"]


puts "Seeded courses table with " + course_list.length.to_s + " courses from url " + url
puts "Seeded sections table with " + sectionCount.to_s() + " sections"
#p response[data]

