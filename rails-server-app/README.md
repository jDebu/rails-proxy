# Rails Server App

This is the server exposing an API for posts.

## How to run

1. Install dependencies:
   ```bash
   bundle install
   ```

2. Start the server on port 3001:
   ```bash
   rails s --port 3001
   ```

The server will be available at: [http://localhost:3001](http://localhost:3001)

## Endpoints

- `GET /posts`: Returns a list of posts.