## Overview

This service is set up with Langgraph and FastAPI.
Currently, there is only a single LLM call with no graphs or tools.

## Installation

```bash
python3 -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
```

## Add Environment

Copy `.env.example` to `.env` and add your key after `ANTHROPIC_API_KEY=`. The server loads it on startup.

## Running the Server

`fastapi dev agent.py`

## Using the API

`curl http://localhost:8000/agent -H "Content-Type: application/json" -d '{"username": "1"}'`
