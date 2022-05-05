# README



* Ruby version 2.7.5
Installation Instructions:
check ruby version by opening command prompt and enter ruby -v
if ruby does not have a version then download ruby
for windows download from rubyinstaller.org
for linux use command: sudo apt-get install ruby

install rails gem with command: gem install rails -v 6.1.4
install node.js with commands: sudo apt-get install nodejs
sudo npm install -g n
sudo n stable
install and set up yarn with commands: npm install --global yarn
rails webpacker:install

All other ruby gems versions are defined in Gemfile and Gemfile.lock
install and update all gems use command: bundle install

Database dependency on sqlite3
Install on linux with command: sudo apt-get install sqlite3

If rails server has errors it is due to wrong ruby version/failed gem installations
Check over Gemfile.lock for proper versions and compare to following command: gem list
Command: gem --version (should come out to be 3.1.6 that comes with ruby 2.7.5)
ruby --version (should come out to be 2.7.5 and your respective OS version (examples: [x86_64-linux] or [x64-mingw32]))
* System dependencies

    System dependency on Minimalist GNU for Windows or Microsoft Windows operating systems.
    Also works on generic GNU/linux operating system.

    A file to design website and its functionality based on database
    Install the required dependencies
    $bundle install
* Configuration

   require_relative "config/environment"
   (Shownin config.ru)


* Database creation

    rails g migrate (database name)
    Database has been predetermined through project's db/migrate migrations and schema

* Database initialization

    rails db:migrate
    This will initialize database in local sqlite3 file, not on a server.

* How to run the test suite
    Shown in test file

* Services (job queues, cache servers, search engines, etc.)
    Different users owns different services.
        STUDENT Functionality

        Students can login, and browse the course catalog.
        Student, Student pending instructor, can also fill out application form for grader, apply to each course as a grader

    INSTRUCTOR Functionality

        Instructors can login, and browse the course catalog

    ADMIN Functionality

        Admin's can:

        browse the course catalog
        edit the course catalog (add/delete/change)
        reload the course catalog
        approve Instructor or Admin requests

    General Functionality
    All course catalog views are automatically sorted by CatalogNumber ascending low (1000's) to high (5000's)
    This allows for access to courses by difficulty/lower to greater prerequisite requirements/ year level.

    Seach to check classes they want are in course catalog (Search course title)

    Sign in and sign up through devise gem implementation. On log in page can use link to reset password.
    
    Students and instructors can apply to be instructor or admin.Each user has home page and then link to respective student, instructor, or admin page.

    
* Deployment instructions
    A web application would help streamline this workflow and ensure some consistency in the information that is gathered.

Run bundle install to install all runtime dependencies for gems. Need to Restart server after

-------------------------------

### How to Execute:
0)  Run bundle install to install all runtime dependencies for gems,  Database initialization     Seed the database (Remember)    
    bundle install                                                      rails db:migrate                     $rake db:seed
    
    Admin can log in and seed/reload database with valid link to API url
    The API URL is https://content.osu.edu/classes/search

valid parameters are:

    q=   (can be blank, or cse for CSE Classes)
    campus=   (col for Columbus)
    p=  (page #, starting at 1)
    term=  (1222 for Spring 2022)
    academic-career=ugrad (for undergrad only classes)
    subject=   (blank, or cse)

A valid query would be:  https://content.osu.edu/classes/search/?q=&campus=col&p=1&term=1222

1) type 'rails s' in the command line prompt to run server
2) open up browser(firefox recommended)  
3) type 'localhost:3000' in the url bar or visiting http://localhost:3000  
4) When users sign up, they need to enter email which has restrictins like must end with @osu.edu and start with name dot number (name.#). Besides, users can choose their own roles in the website includes students and student_pend_instructor which means that sign up instructors must wait until admin prove. Otherwise, instructors can only log in as students.  
5) after logging in, users can see their own page and personal profile with link here
6) If users wants reset password, they can click link reset password to do that.  
7) By clicking user's own role's page, students can browse classes and apply for an instructor or an admin. Instructors can browse classes and apply for an admin. Admin can browse the course catalog ,edit the course catalog (add/delete/change),reload the course catalog by entering url and approve Instructor or Admin requests.  
8)  Initial Admin login credentials for admin access/control
    Admin email     = admin.1@osu.edu    
    Admin password    = password    
    (predetermined password and account)    
9) Courses are sorted automatically
---------------------------------
How to apply to become a grader or a instructor of a course

A course can have a instructor and have multiple grader. The number of grader for a 
course is determined admin. Admin can increase or decrease the maximum number of
grader for a course by increase the Max Grader Number and decrease the Max Grader 
Number on the admin page. If a course is applicable, student or instructor can click 
on apply to show the willingness to be a grader or instructor and waiting the admin 
to approve. And admin can approve the apply in the admin page.	
