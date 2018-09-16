## What is this?

This is a demo app I am working on that will highlight some common features in the web development world using Ruby on Rails, specifically, Authentication/Authorization using logins, and RESTful API design.

## Description

The idea behind this application is to model a school system (schools, classrooms, teachers, students, parents) and provide a message passing system using an API to post messages and make them appear on the “Dashboard” of the logged in user depending on their associations in Rails (a message post to the school will make the message appear on the dashboard to all users associated to that school). Only admin users will have access to create update and delete school info.

## Where is this going?

As stated before, you will be able to post messages to a users dashboard using the API. I have plans to develop a second app (will start once I get this into a state where I can actually post messages to the schools dashboard locally) so that I can test cross browser security with my API. Additionally, I plan on setting up an email server using this second app to send emails to the teachers and parents, because why not.

### TODO:

- [x] Seed database with some schools
- [x] Add rake task to create admin users (can only be added from the database)
- [x] Add pagination to the schools view
- [x] Add pagination to the get schools api
- [ ] Associate user with school on login
- [ ] Create messages table
- [ ] Associate messages table with users school
- [ ] Create dashboard section for school messages
- [ ] Display messages on the school show page
- [ ] Post messages locally using api
- [ ] Allow admins to delete messages
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
        "self": "http://localhost:3000/api/v1/schools?page=1",
        "next": "http://localhost:3000/api/v1/schools?page=2"
    },
    "perPage=": "10",
    "totalPages=": "10",
    "totalCount=": "100",
    "_embedded": {
        "schools": [
            {
                "_links": {
                    "self": "http://localhost:3000/api/v1/schools/145"
                },
                "name": "Massachusetts Institute of Technology (MIT)",
                "created_at": "2018-09-15T17:52:05.625Z",
                "updated_at": "2018-09-15T17:52:05.625Z"
            },
            {
                "_links": {
                    "self": "http://localhost:3000/api/v1/schools/146"
                },
                "name": "Stanford University",
                "created_at": "2018-09-15T17:52:05.629Z",
                "updated_at": "2018-09-15T17:52:05.629Z"
            },
            {
                "_links": {
                    "self": "http://localhost:3000/api/v1/schools/147"
                },
                "name": "Harvard University",
                "created_at": "2018-09-15T17:52:05.632Z",
                "updated_at": "2018-09-15T17:52:05.632Z"
            },
            {
                "_links": {
                    "self": "http://localhost:3000/api/v1/schools/148"
                },
                "name": "California Institute of Technology (Caltech)",
                "created_at": "2018-09-15T17:52:05.635Z",
                "updated_at": "2018-09-15T17:52:05.635Z"
            },
            {
                "_links": {
                    "self": "http://localhost:3000/api/v1/schools/149"
                },
                "name": "University of Chicago",
                "created_at": "2018-09-15T17:52:05.637Z",
                "updated_at": "2018-09-15T17:52:05.637Z"
            },
            {
                "_links": {
                    "self": "http://localhost:3000/api/v1/schools/150"
                },
                "name": "Princeton University",
                "created_at": "2018-09-15T17:52:05.640Z",
                "updated_at": "2018-09-15T17:52:05.640Z"
            },
            {
                "_links": {
                    "self": "http://localhost:3000/api/v1/schools/151"
                },
                "name": "Cornell University",
                "created_at": "2018-09-15T17:52:05.643Z",
                "updated_at": "2018-09-15T17:52:05.643Z"
            },
            {
                "_links": {
                    "self": "http://localhost:3000/api/v1/schools/152"
                },
                "name": "Yale University",
                "created_at": "2018-09-15T17:52:05.645Z",
                "updated_at": "2018-09-15T17:52:05.645Z"
            },
            {
                "_links": {
                    "self": "http://localhost:3000/api/v1/schools/153"
                },
                "name": "Columbia University",
                "created_at": "2018-09-15T17:52:05.648Z",
                "updated_at": "2018-09-15T17:52:05.648Z"
            },
            {
                "_links": {
                    "self": "http://localhost:3000/api/v1/schools/154"
                },
                "name": "University of Pennsylvania",
                "created_at": "2018-09-15T17:52:05.650Z",
                "updated_at": "2018-09-15T17:52:05.650Z"
            }
        ]
    }
}
```

* GET => http://localhost:3000/api/v1/schools?page=5&per_page=5

```json
{
    "_links": {
        "self": "http://localhost:3000/api/v1/schools?page=5",
        "prev": "http://localhost:3000/api/v1/schools?page=4",
        "next": "http://localhost:3000/api/v1/schools?page=6"
    },
    "perPage=": "5",
    "totalPages=": "20",
    "totalCount=": "100",
    "_embedded": {
        "schools": [
            {
                "_links": {
                    "self": "http://localhost:3000/api/v1/schools/165"
                },
                "name": "Brown University",
                "created_at": "2018-09-15T17:52:05.680Z",
                "updated_at": "2018-09-15T17:52:05.680Z"
            },
            {
                "_links": {
                    "self": "http://localhost:3000/api/v1/schools/166"
                },
                "name": "University of Texas at Austin",
                "created_at": "2018-09-15T17:52:05.683Z",
                "updated_at": "2018-09-15T17:52:05.683Z"
            },
            {
                "_links": {
                    "self": "http://localhost:3000/api/v1/schools/167"
                },
                "name": "University of Washington",
                "created_at": "2018-09-15T17:52:05.686Z",
                "updated_at": "2018-09-15T17:52:05.686Z"
            },
            {
                "_links": {
                    "self": "http://localhost:3000/api/v1/schools/168"
                },
                "name": "Georgia Institute of Technology",
                "created_at": "2018-09-15T17:52:05.689Z",
                "updated_at": "2018-09-15T17:52:05.689Z"
            },
            {
                "_links": {
                    "self": "http://localhost:3000/api/v1/schools/169"
                },
                "name": "University of Illinois at Urbana-Champaign",
                "created_at": "2018-09-15T17:52:05.693Z",
                "updated_at": "2018-09-15T17:52:05.693Z"
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
