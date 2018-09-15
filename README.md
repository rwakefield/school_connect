## What is this?

This is a demo app I am working on that will highlight some common features in the web development world using Ruby on Rails, specifically, Authentication/Authorization using logins, and RESTful API design.

## Description

The idea behind this application is to model a school system (schools, classrooms, teachers, students, parents) and provide a message passing system using an API to post messages and make them appear on the “Dashboard” of the logged in user depending on their associations in Rails (a message post to the school will make the message appear on the dashboard to all users associated to that school). Only admin users will have access to create update and delete school info.

## Where is this going?

As stated before, you will be able to post messages to a users dashboard using the API. I have plans to develop a second app (will start once I get this into a state where I can actually post messages to the schools dashboard locally) so that I can test cross browser security with my API. Additionally, I plan on setting up an email server using this second app to send emails to the teachers and parents, because why not.

- [ ] Seed database with some schools
- [ ] Add rake task to create admin users (can only be added from the database)
- [ ] Add pagination to the schools view
- [ ] Add pagination to the get schools api
- [ ] Associate user with school on login
- [ ] Create messages table
- [ ] Associate messages table with users school
- [ ] Create dashboard section for school messages
- [ ] Build second app to post messages to schools (not sure exactly what this will look like)
- [ ] Secure API with some token based system (probably JsonWebToken but I haven’t really thought about that yet)

To make this sane I will probably wait until each level of API is working completely before I move on to the next one (so version one of this app will be having the schools getting messages from the other application before I move onto classroom and the others)


## API Design

For the API I am going with a RESTful API design that will return JSON. I will be adding hypermedia to the API using the Hypertext Application Language (HAL) standard. There is no real reason for this except because I like the way it looks.

#### Working APIs

* GET => http://localhost:3000/api/v1/schools

```json
{
    "_links": {
        "self": "http://localhost:3000/api/v1/schools"
    },
    "totalCount=": 1,
    "_embedded": {
        "schools": [
            {
                "_links": {
                    "self": "http://localhost:3000/api/v1/schools/6"
                },
                "name": "My School is Cool",
                "created_at": "2018-09-13T19:08:29.802Z",
                "updated_at": "2018-09-13T23:55:29.770Z"
            }
        ]
    }
}
```

* GET => http://localhost:3000/api/v1/schools/6

```json
{
    "_links": {
        "self": "http://localhost:3000/api/v1/schools/6"
    },
    "name": "My School is Cool",
    "created_at": "2018-09-13T19:08:29.802Z",
    "updated_at": "2018-09-13T23:55:29.770Z"
}
```

## How I work

I write my code using TDD practices following a very “agile” development process. So you should be able to track through each commit to follow what I am doing (each commit should be a “working” piece).
