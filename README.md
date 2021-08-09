# Luna Restaurant Guide Version 0.1

The goal of this app was to build a restaurant guide app where users can register, search restaurants based on keywords/categories and read reviews. They can then add new reviews but also comment and like existing reviews. Restaurant owners can create their restaurant on the app, with opening hours, category, description, pictures, etc.

Frontend developped with React.js, Redux, React Router, Styled Components, Axios and additional packages. Most components are functional components using React Hooks.
Backend built with Django, Django REST and the database in the Docker deployment is using PostgreSQL.

## Features of the frontend app

Registration form using JWT token

-   Signin page
-   Signup form with validation code sent by email and verification page with details about the user.

Restaurants pages

-   Main page with best rated restaurants and search bar to filter on keywords.
-   Search page to display restaurants / reviews / users and filter based on criterias or categories.

Details pages

-   Restaurant details page with reviews, comments, address, map and ability to write a new review.
-   Ability to edit the restaurant description for the owner of the restaurant.

Profile page

-   Private profile page of the user with list of reviews and comments posted and restaurants owned.
-   Page to create a new restaurant and add all related information.
-   Edit profile page to modify personal information such as avatar, location, description, etc.

# List of endpoints

## Registration

-   /api/registration/ POST: Register new user by asking for email (a validation code will be send to given email).

-   /api/registration/validate/ POST: Validate the creation of new user with the code sent by email.

## Auth

-   /api/auth/token/ POST: Get a new JWT by passing username and password.

-   /api/auth/token/refresh/ POST: Get a new JWT by passing an old still valid JWT.

-   /api/auth/token/verify/ POST: Verify a token by passing the token in the body.

-   /api/auth/password-reset/ POST: Reset users password by sending a validation code in a email.

-   /api/auth/password-reset/validate/ POST: Validate password reset token and set new password for the user.

## Search

-   /api/search/ GET: Search for ‘restaurants’, ‘reviews’ or ‘users’. {type: ‘restaurants’, ‘search_string’: ‘Pub’}

## Home

-   /api/home/ GET: Get a list of the four best rated restaurants for the home screen.

## Restaurant

-   /api/restaurants/ GET: Get the list of all the restaurant.

-   /api/restaurants/new/ POST: Create a new restaurant.

-   /api/restaurants/category/<int:category_id>/ GET: Get the all the restaurants by category.

-   /api/restaurants/user/<int:user_id>/ GET: Get the all the restaurants created by a specific user in chronological order.

-   /api/restaurants/<int:id>/ GET: Get the details of a restaurant by providing the id of the restaurant.

-   /api/restaurants/<int:id>/ PATCH: Update a restaurant by id (only by owner or restaurant admin).

-   /api/restaurants/<int:id>/ DELETE: Delete a restaurant by id (only by owner or restaurant admin).

## Reviews

-   /api/reviews/new/<int:restaurant_id>/ POST: Create new review for a restaurant.

-   /api/reviews/restaurant/<int:restaurant_id>/ GET: Get the list of the reviews for a single restaurant.

-   /api/reviews/user/<int:user_id>/ GET: Get the list of the reviews by a single user.

-   /api/reviews/<int:review_id>/ GET: Get a specific review by ID and display all the information.

-   /api/reviews/<int:review_id>/ PATCH: Update a specific review (only by owner).

-   /api/reviews/<int:review_id>/ DELETE: Delete a specific review (only by owner).

-   /api/reviews/like/<int:review_id>/ POST: Like a review.

-   /api/reviews/like/<int:review_id>/ DELETE: Remove like from the review.

-   /api/reviews/likes/ GET: Get the list of the reviews the current user liked.

-   /api/reviews/comments/ GET: Get the list of the reviews the current user commented.

## Comments

-   /api/review/comment/<int:user_id>/ GET: Get all the comments from a single user.

-   /api/review/comment/new/<int:review_id>/ POST: Comment on the review.

-   /api/review/comment/<int:comment_id>/ DELETE: Delete the comment on the review.

## Categories

-   /api/category/list/ GET: Get the list of all the categories.

## Users

-   /api/me/ GET: Get the user profile.

-   /api/me/ PATCH: Update the user profile.

-   /api/users/list/ GET: Get all users.

-   /api/users/?search=<str:search_string>/ GET: Search for a user.

-   /api/users/<int:user_id>/ GET: get a specific user profile.
