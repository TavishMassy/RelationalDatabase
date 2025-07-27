# 🎓 Student Database — Part 2 (FreeCodeCamp RDB Course)

This repository contains the completed version of the “Build a Student Database: Part 2” course from [freeCodeCamp's Relational Database curriculum](https://www.freecodecamp.org/learn/relational-database/learn-sql-by-building-a-student-database-part-2/build-a-student-database-part-2). It demonstrates advanced SQL querying and Bash scripting using a PostgreSQL student database within a Dockerized development container.

---

## 🛠️ What’s Included

- `students.sql` – SQL schema defining student and course tables for relational queries  
- `student_info.sh` – Bash script showcasing dynamic SQL queries against the student database  
- `.freeCodeCamp` – CodeRoad metadata for tracking tutorial progress  
- `.vscode` – Dev container setup files for consistent development environment  
- `.gitignore` – Git config to exclude unnecessary files from version control

---

## 💡 Key Concepts Practiced

- Structuring and querying relational data with **INNER**, **RIGHT**, and **FULL JOINs**
- Automating SQL queries using Bash scripting techniques
- Filtering, aggregating, and pattern matching within SQL
- Combining logical operations for multi-condition filtering
- Operating within Docker and VS Code dev containers

---

### 🔄 SQL JOIN Types Used

| JOIN Type      | Functionality                                                             | Usage Example                      |
|----------------|---------------------------------------------------------------------------|------------------------------------|
| **INNER JOIN** | Returns only matching rows in both tables                                 | Courses tied to majors             |
| **RIGHT JOIN** | Returns all rows from right table + matches from left                     | Majors shown even if no student    |
| **FULL JOIN**  | Returns all matching/non-matching rows from both sides                    | All majors + optional students     |

### 🧠 Notable Queries

- Find students with a perfect GPA: `WHERE gpa = 4.0`
- Select courses alphabetically before ‘D’: `WHERE course < 'D'`
- Filter students with GPA extremes and last names starting with ‘R’ onward
- Pattern matching with `ILIKE '%sa%'` and `LIKE '%r_'`
- Aggregating GPA stats using `ROUND(AVG(gpa), 2)`
- Listing majors with no students or students with 'ma' in their name
- Finding courses with only one student enrolled via `GROUP BY ... HAVING COUNT(...) = 1`

---

## 🚀 Getting Started

To replicate or run this project, follow the [official setup instructions](https://www.freecodecamp.org/learn/relational-database/learn-sql-by-building-a-student-database-part-2/build-a-student-database-part-2) from freeCodeCamp. You’ll need:

- Docker Engine  
- Visual Studio Code + Dev Containers Extension  
- Git

Steps:

1. Clone the [RDB Alpha repository](https://github.com/freeCodeCamp/rdb-alpha)  
2. Paste your freeCodeCamp token into the Dockerfile  
3. Rebuild the container and start the CodeRoad tutorial  
4. Follow the tasks inside VS Code to complete the project

---

## ✅ Goal

This project is designed to help learners develop a deeper understanding of SQL joins, filtering logic, and bash-driven automation. It's an ideal sandbox for experimenting with queries and building robust database logic—fork it, play with it, and expand it!
