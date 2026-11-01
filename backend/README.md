## Overview

A Rails API with a single endpoint, `POST /api/greetings`. Each request stores a new `Greet` row
in SQLite, asks the LangGraph server for a greeting, and returns `{ "id": 1, "greeting": "..." }`.

## Installation

```bash
bundle install
bin/rails db:migrate
```

## Running The Server

`bin/rails server`

The server runs on port 3001, because the original Next.js app uses 3000. It expects the LangGraph
server at `http://localhost:8000/agent`; set `AGENT_URL` to point it somewhere else.

## Tests

`bin/rails test`

The tests stub the LangGraph server with WebMock, so they don't need it running or an API key.

## Using the API

`curl -X POST http://localhost:3001/api/greetings`
