## Overview

A Rails + React version of the Greeter App. This repository contains three servers:

- `frontend`: React + TypeScript + Ant Design, served by Vite (port 5173)
- `backend`: A Rails API with a SQLite database (port 3001)
- `langgraph-server`: A Python server running a LangGraph API (port 8000)

There are instructions to run each of these in their respective directories. Run all three at
once, each in its own terminal, then visit `http://localhost:5173` and click `Press to Greet`.

## How it works

- The React app sends `POST /api/greetings`. Vite forwards anything under `/api` to Rails.
- Rails stores a `Greet` row in the database and sends its ID to the Python agent
  (`backend/app/services/greeting_generator.rb`).
- The Python agent asks Claude to write a greeting, which is passed back up to the browser.
- If the agent is down or crashes, Rails returns a `502` with a JSON error, and the page shows it.
