## Overview

The Greeter App UI: React + TypeScript + Ant Design, built with Vite.

## Installation

This project needs Node 22.12 or newer. With nvm, run `nvm install` then `nvm use` (see `.nvmrc`).

`npm install`

## Running The Server

`npm run dev`

Visit `http://localhost:5173`. Requests to `/api` are forwarded to Rails on port 3001
(see `vite.config.ts`), so Rails must be running too.

## Code

- `src/components/GreetButton/GreetButton.api.ts` calls `POST /api/greetings`
- `src/components/GreetButton/GreetButton.tsx` shows the greeting in a card, or an error alert
