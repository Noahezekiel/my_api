# Welcome to My Api
***

## Task
NOTE: The project was done in main branch, i have to copy it to dev branch because your first review said my repo (dev) was empty. If you want to see all my commit, switch to main branch.
  
The goal of this project is to create a Movie API that allows users to manage a large dataset of movies. 
The challenge was implementing authentication, pagination, caching, and API documentation while keeping 
the API accessible for public use.
## Description
This API is built using Ruby on Rails and provides CRUD operations for movies. 
Authentication is handled via Devise with Doorkeeper (OAuth2). We also integrated Redis for caching, and Postman 
for testing and documentation.
## Installation
1. Prerequisites
    - Ruby (https://www.ruby-lang.org/en/downloads/)
    - PostgreSQL (https://www.postgresql.org/)
    - Redis (https://redis.io/)

2. Make sure you have the latest version of: 
    i, Node 
    ii, Yarn
    iii, ruby
    iv, Rails 
compatibles installed on your machine.

To install the project, follow these steps:
* Clone the repository:
    ```bash
    git clone https://github.com/Noahezekiel/my_api.git
    ```
    ```bash
    cd my_api
    ```
* Install dependencies:
    ```bash
    bundle install
    ```
* Set up the database:
    ```bash
    rails db:create
    ```
    ```bash
    rails db:migrate
    ```
    ```bash
    rails db:seed
    ```
* Run the server:
    ```bash
    rails server
    ```

## Usage
Postman Documentation

1. Authenticate User/Admin to get the access token
--Open Postman and click "New Request".
--Set Method to POST.
--Enter URL: http://localhost:3000/oauth/token.
--Go to the "Headers" tab and add:
--Content-Type: application/json
--Go to the "Body" tab and select "raw", then paste the following JSON:
{
  "grant_type": "password",
  "username": "your_user_email@example.com",
  "password": "your_password",
  "client_id": "your_client_id",
  "client_secret": "your_client_secret"
}
--Click "Send" to make the request.

- **Example Request**
    ```JSON
    {
        "grant_type": "password",
        "email": "nnooaahh24@gmail.com",
        "password": "password",
        "client_id": "Application's id",
        "client_secret": "Application's secret"
    }
    ```
- **Example Respond:**
    ```JSON
    {
        "access_token": "The access token",
        "token_type": "Bearer",
        "expires_in": 7200,
        "refresh_token": "The refresh token",
        "created_at": 1728231096
    }
NB: This will generate client ID and client secret    
rails console
app = Doorkeeper::Application.create!(
  name: "My Movie API Client",
  redirect_uri: "",
  scopes: ""
)
puts "Client ID: #{app.uid}"
puts "Client Secret: #{app.secret}"


2. User (CRUD Operations)

** Register a New User (Sign Up)
    Method: POST
    URL: http://localhost:3000/users
    Headers: "Content-Type": "application/json"

Body (JSON, raw format):
{
  "user": {
    "email": "test@example.com",
    "password": "password123",
    "password_confirmation": "password123"
  }
}

** Login (Sign In)
Method: POST
URL: http://localhost:3000/users/sign_in
Headers: "Content-Type": "application/json"

Body (JSON, raw format):
json
{
  "user": {
    "email": "test@example.com",
    "password": "password123"
  }
}


** View All Users 
Method: POST
URL: http://localhost:3000/users
Headers: "Content-Type": "application/json"


** Update User
Method: PUT
URL: http://localhost:3000/users/:ID
Headers: "Content-Type": "application/json",
        "Authorization": "Bearer YOUR_ACCESS_TOKEN"

Body (JSON, raw format):
json
{
  "user": {
    "email": "all@gmail.com",
    "password": "654321",
    "password_confirmation": "654321"
  }
}


** Delete User
Method: Delete
URL: http://localhost:3000/users/:ID
Headers: "Content-Type": "application/json",
        "Authorization": "Bearer YOUR_ACCESS_TOKEN"




3. Movies API (CRUD Operations)

**Get All Movies (Public)
Headers: "Content-Type": "application/json"
Method: GET
URL: http://localhost:3000/movies?page=1
Expected Response (200 OK)
json


**Create a New Movie (Requires Authentication)
Headers: "Content-Type": "application/json",
        "Authorization": "Bearer YOUR_ACCESS_TOKEN"
Method: POST
URL: http://localhost:3000/movies
Headers:
  "Content-Type": "application/json",
  "Authorization": "Bearer <your_token_here>"

Body (JSON, raw format):
json
{
  "movie": {
    "show_id": "s8810",
    "movie_type": "Movie",
    "title": "Example",
    "director": "Noah Ezekiel",
    "cast": "Example",
    "country": "Nigeria",
    "date_added": "2021-09-25",
    "release_year": 2020,
    "rating": "PG-18",
    "duration": "90 min",
    "listed_in": "Example",
    "description": "Example description."
  }
}



**Update a Movie (Requires Authentication)
Method: PATCH
URL: http://localhost:3000/movies/:ID
Headers:
  "Content-Type": "application/json",
  "Authorization": "Bearer <your_token_here>"
Body (JSON, raw format):
json
{
  "movie": {
    "title": "Inception Updated",
    "description": "A mind-bending thriller with an extended cut.",
    "release_year": 2010
  }
}

**Delete a Movie (Requires Authentication)
Method: DELETE
URL: http://localhost:3000/movies/:ID
Headers: "Authorization": "Bearer <your_token_here>",
        "Content-Type": "application/json"



### Postman Documentation Link
The follow the following link to access the postman documentation
   
    https://documenter.getpostman.com/view/42403948/2sAYkLoHwu

### Render Link
The follow the following link to access the host page: https://my-api-ergx.onrender.com


### The Core Team
Noah Ezekiel

<span><i>Made at <a href='https://qwasar.io'>Qwasar SV -- Software Engineering School</a></i></span>
<span><img alt='Qwasar SV -- Software Engineering School's Logo' src='https://storage.googleapis.com/qwasar-public/qwasar-logo_50x50.png' width='20px' /></span>
