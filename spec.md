Specifications for the Sinatra Assessment
Specs:

[x] Use Sinatra to build the app #i've used the DSL sinatra to build my webpage
[x] Use ActiveRecord for storing information in a database #created migrations with rake, used AR in migration to create both tables
[x] Include more than one model class (e.g. User, Post, Category) #created both models with has_many/belongs_to macros
[X]Include at least one has_many relationship on your User model (e.g. User has_many Posts) #user has many projects
[x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) #project belongs to user
[x] Include user accounts with unique login attribute (username or email) #used validate_uniqueness_of macro
[x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying #the belongs_to(user has the ability to create a project, view or read it, update the project, delete by instance or delete all)
[x] Ensure that users can't modify content created by other users #each username is unique to avoid processing confusion, you must be logged in to create new project,edit,see, or delete the project. i did this with matching with current_user and logged_in helper methods
[x] Include user input validations #used validates_prescence of macro
BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
[x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
Confirm #view read me

 [x]You have a large number of small Git commits #i have over 100 commits
[x] Your commit messages are meaningful #i try my best to match action and message
[x] You made the changes in a commit that relate to the commit message #yes
[x] You don't include changes in a commit that aren't related to the commit message #true
