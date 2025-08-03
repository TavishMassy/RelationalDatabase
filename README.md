# Number Guessing Game

## 🛠️ What I Built
- A terminal-based number guessing game using Bash and PostgreSQL
- Integrated with a relational database to track user stats
- Ran on a virtual Linux setup via Docker

## ⚙️ Tools & Tech Stack
- Bash scripting: Game logic and user interaction
- PostgreSQL: Storing usernames, games played, and best scores
- Docker Engine: For isolated Linux environment
- VS Code + Dev Containers: Dev workflow setup
- Git: Version control and project submission

## 📌 Key Features
- Prompts user for a username and checks if they’ve played before
- Stores new users in the users table
- Greets returning players with personal game stats
- Generates a random number between 1–1000
- Tracks number of guesses and gives hints ("higher/lower")
- Validates user input (must be an integer)
- Saves games played and updates best score if beaten
- Uses SQL queries inside the Bash script for dynamic data updates
- Project files: number_guess.sh (script), number_guess.sql (DB schema)

🔗 Explore the full tutorial on freeCodeCamp’s official course page.
https://www.freecodecamp.org/learn/relational-database/build-a-number-guessing-game-project/build-a-number-guessing-game
