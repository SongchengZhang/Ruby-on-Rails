namespace :courses do
  desc "Seed basic CSE courses"
  task seed_courses: :environment do
      #seed 1 basic CSE courses
      Course.destroy_all

      Course.create!([
      { title: "Software 1", shortDescription: "First of the software sequence in java", catalogNumber: "2221", term: "SP22"},
      { title: "Software 2", shortDescription: "Second of the software sequence in java", catalogNumber: "2231", term: "SP22"},
      { title: "Systems 1", shortDescription: "First of the systems sequence in ANSI C", catalogNumber: "2421", term: "SP22"},
      { title: "Systems 2", shortDescription: "Second of the systems sequence in ANSI C", catalogNumber: "2431", term: "SP22"}
      ])
      p "Created #{Course.count} courses"

      User.destroy_all
      p "Removed all users from system."
  end
  
end
