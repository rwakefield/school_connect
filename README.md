## What is this?

This is a demo app I am working on that will highlight some common features in the web development world using Ruby on Rails, specifically, Authentication/Authorization using logins, and RESTful API design.

## Description

The idea behind this application is to model a school system (schools, classrooms, teachers, students, parents) and provide a message passing system using an API to post messages and make them appear on the “Dashboard” of the logged in user depending on their associations in Rails (a message post to the school will make the message appear on the dashboard to all users associated to that school). Only admin users will have access to create update and delete school info.

## Setup Locally

```bash
rake db:setup
rake admin_creator:create[YOUR_EMAIL,YOUR_PASSWORD]
rails s
```
#### Admin Login

The admin links are intentionally hidden from regular users, you can log in as an admin by visiting this path

* http://localhost:3000/admins/sign_in

## Where is this going?

As stated before, you will be able to post messages to a users dashboard using the API. I have plans to develop a second app (will start once I get this into a state where I can actually post messages to the schools dashboard locally) so that I can test cross browser security with my API. Additionally, I plan on setting up an email server using this second app to send emails to the teachers and parents, because why not.

### TODO:

- [x] Seed database with some schools
- [x] Add rake task to create admin users (can only be added from the database)
- [x] Add pagination to the schools view
- [x] Add pagination to the get schools api
- [x] Associate user with school on login
- [x] Create messages table
- [x] Associate messages table with users school
- [x] Create dashboard section for school messages
- [x] Display messages on the school show page
- [x] Restrict messages show to filter user schools
- [x] Get school messages api
- [x] Get school message api
- [x] Link to messages api on school api
- [x] Post messages locally using api
- [x] Patch messages locally using api
- [x] Delete messages locally using api
- [ ] Allow admins to delete messages
- [ ] Build second app to post messages to schools (not sure exactly what this will look like)
- [ ] Secure API with some token based system (probably JsonWebToken but I haven’t really thought about that yet)

To make this sane I will probably wait until each level of API is working completely before I move on to the next one (so version one of this app will be having the schools getting messages from the other application before I move onto classroom and the others)

## API Design

For the API I am going with a RESTful API design that will return JSON. I will be adding hypermedia to the API using the Hypertext Application Language (HAL) standard. There is no real reason for this except because I like the way it looks.

#### Working APIs

* GET => http://localhost:3000/api/v1/schools?per_page=5

```json
{
    "_links": {
        "self": "http://localhost:3000/api/v1/schools?page=1",
        "next": "http://localhost:3000/api/v1/schools?page=2"
    },
    "perPage=": "5",
    "totalPages=": "20",
    "totalCount=": "100",
    "_embedded": {
        "schools": [
            {
                "_links": {
                    "self": "http://localhost:3000/api/v1/schools/1",
                    "messages": "http://localhost:3000/api/v1/schools/1/messages"
                },
                "name": "Massachusetts Institute of Technology (MIT)",
                "created_at": "2018-09-16T04:21:10.530Z",
                "updated_at": "2018-09-16T04:21:10.530Z"
            },
            {
                "_links": {
                    "self": "http://localhost:3000/api/v1/schools/2",
                    "messages": "http://localhost:3000/api/v1/schools/2/messages"
                },
                "name": "Stanford University",
                "created_at": "2018-09-16T04:21:10.540Z",
                "updated_at": "2018-09-16T04:21:10.540Z"
            },
            {
                "_links": {
                    "self": "http://localhost:3000/api/v1/schools/3",
                    "messages": "http://localhost:3000/api/v1/schools/3/messages"
                },
                "name": "Harvard University",
                "created_at": "2018-09-16T04:21:10.549Z",
                "updated_at": "2018-09-16T04:21:10.549Z"
            },
            {
                "_links": {
                    "self": "http://localhost:3000/api/v1/schools/4",
                    "messages": "http://localhost:3000/api/v1/schools/4/messages"
                },
                "name": "California Institute of Technology (Caltech)",
                "created_at": "2018-09-16T04:21:10.556Z",
                "updated_at": "2018-09-16T04:21:10.556Z"
            },
            {
                "_links": {
                    "self": "http://localhost:3000/api/v1/schools/5",
                    "messages": "http://localhost:3000/api/v1/schools/5/messages"
                },
                "name": "University of Chicago",
                "created_at": "2018-09-16T04:21:10.560Z",
                "updated_at": "2018-09-16T04:21:10.560Z"
            }
        ]
    }
}
```

* GET => http://localhost:3000/api/v1/schools/1

```json
{
    "_links": {
        "self": "http://localhost:3000/api/v1/schools/1",
        "messages": "http://localhost:3000/api/v1/schools/1/messages"
    },
    "name": "Massachusetts Institute of Technology (MIT)",
    "created_at": "2018-09-16T04:21:10.530Z",
    "updated_at": "2018-09-16T04:21:10.530Z"
}
```

* GET => http://localhost:3000/api/v1/schools/1/messages?per_page=5

```json
{
    "_links": {
        "self": "http://localhost:3000/api/v1/schools/1/messages?page=1",
        "next": "http://localhost:3000/api/v1/schools/1/messages?page=2"
    },
    "perPage=": "5",
    "totalPages=": "3",
    "totalCount=": "15",
    "_embedded": {
        "messages": [
            {
                "_links": {
                    "self": "http://localhost:3000/api/v1/schools/1/messages/118"
                },
                "header": "Test Message 14",
                "body": "The quick brown fox jumps over the lazy dog",
                "created_at": "2018-09-16T18:58:19.838Z",
                "updated_at": "2018-09-16T18:58:19.838Z"
            },
            {
                "_links": {
                    "self": "http://localhost:3000/api/v1/schools/1/messages/117"
                },
                "header": "Test Message 13",
                "body": "The quick brown fox jumps over the lazy dog",
                "created_at": "2018-09-16T18:58:19.835Z",
                "updated_at": "2018-09-16T18:58:19.835Z"
            },
            {
                "_links": {
                    "self": "http://localhost:3000/api/v1/schools/1/messages/116"
                },
                "header": "Test Message 12",
                "body": "The quick brown fox jumps over the lazy dog",
                "created_at": "2018-09-16T18:58:19.831Z",
                "updated_at": "2018-09-16T18:58:19.831Z"
            },
            {
                "_links": {
                    "self": "http://localhost:3000/api/v1/schools/1/messages/115"
                },
                "header": "Test Message 11",
                "body": "The quick brown fox jumps over the lazy dog",
                "created_at": "2018-09-16T18:58:19.827Z",
                "updated_at": "2018-09-16T18:58:19.827Z"
            },
            {
                "_links": {
                    "self": "http://localhost:3000/api/v1/schools/1/messages/114"
                },
                "header": "Test Message 10",
                "body": "The quick brown fox jumps over the lazy dog",
                "created_at": "2018-09-16T18:58:19.820Z",
                "updated_at": "2018-09-16T18:58:19.820Z"
            }
        ]
    }
}
```

* GET => http://localhost:3000/api/v1/schools/1/messages/118

```json
{
    "_links": {
        "self": "http://localhost:3000/api/v1/schools/1/messages/118"
    },
    "header": "Test Message 14",
    "body": "The quick brown fox jumps over the lazy dog",
    "created_at": "2018-09-16T18:58:19.838Z",
    "updated_at": "2018-09-16T18:58:19.838Z"
}
```

* POST => http://localhost:3000/api/v1/schools/2/messages

```json
{"message": { "header": "This is the header", "body": "This is the body" } }
```

* PATCH => http://localhost:3000/api/v1/schools/30/messages/123

```json
{"message": { "header": "updated header", "body": "updated body" } }
```

## How I work

I write my code using TDD practices following a very “agile” development process. So you should be able to track through each commit to follow what I am doing (each commit should be a “working” piece).
