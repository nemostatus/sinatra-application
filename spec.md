Specifications for the Sinatra Assessment
Specs:

[x] Use Sinatra to build the app
[x] Use ActiveRecord for storing information in a database #created migrations with rake, used AR in migration to create both tables
[x] Include more than one model class (e.g. User, Post, Category) #created both models with has_many/belongs_to macros
[X]Include at least one has_many relationship on your User model (e.g. User has_many Posts) #user has many projects
[x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) #project belongs to user
[x] Include user accounts with unique login attribute (username or email)
[] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying #this is the user so has many projects belongs to user. im going to have to double chec with teacher about this requirement
[] Ensure that users can't modify content created by other users #i need to use helper method logged in for this and current user which i have already. i still want to test
[] Include user input validations #i believe i meet this requirement with line 8 for signup and also login however i need to make sure that my user can only enter 1-10 on rating system(input validation)
BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
[] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
Confirm #ill do that now

 [x]You have a large number of small Git commits
[x] Your commit messages are meaningful
[x] You made the changes in a commit that relate to the commit message
[x] You don't include changes in a commit that aren't related to the commit message
