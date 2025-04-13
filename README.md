# MathQuiz 🎓

MathQuiz is a Ruby on Rails educational platform designed to help users practice math quizzes by operation and difficulty. It includes full user authentication, quiz tracking, and secure session handling.

---

## 📦 Features

- ✅ User authentication (custom login system)
- 🧠 Create and solve quizzes
- 📊 Track user scores and quiz performance
- 🔐 Secure version with session management
- 🚫 Insecure version (for demonstration or comparison)
- ✏️ Admin user seeded for testing login functionality
- 💡 Simple interface using Rails views

---

## 🧰 Technologies Used

- Ruby on Rails (v7+)
- SQLite (default database)
- Importmap (for JavaScript management)
- Turbo (default in Rails 7)
- Custom authentication (no Devise)

---

## 👨‍🏫 Admin Login (for secure branch)

This project includes a pre-seeded admin user to help test the login system.

### 🔑 Admin Credentials

- **Email:** `admin@example.com`
- **Password:** `password123`

To create the user locally, run:

```bash
rails db:seed
```

> Make sure you're using the `secure` branch.

---

## 🗂️ Main Components

### Models:
- `User`: Authenticated user with secure password (`has_secure_password`)
- `Quiz`: A math quiz created by a user
- `Question`: Individual questions in a quiz

### Controllers:
- `SessionsController`: Handles login/logout
- `UsersController`: User registration and management
- `QuizzesController`: Quiz creation, solving, and scoring
- `QuestionsController`: Add and manage quiz questions

### Views:
- `sessions/new.html.erb`: Login page
- `quizzes/index.html.erb`: List of quizzes
- `quizzes/show.html.erb`: Show quiz and results
- `questions/_form.html.erb`: Form to create/edit questions
- `layouts/application.html.erb`: Base layout with flash messages

---

## 🚀 Running the App

1. Install dependencies:

```bash
bundle install
```

2. Create and migrate the database:

```bash
rails db:create
rails db:migrate
```

3. Seed the admin user:

```bash
rails db:seed
```

4. Run the Rails server:

```bash
bin/rails server
```

Then open your browser and go to:

```
http://localhost:3000
```

---

## 🔀 Branches

This project has two branches:

- **`secure`** – Protected version with security features:
  - Session management
  - Password encryption
  - CSRF protection
  - Safe redirects
  - Flash messages

- **`insecure`** – Intentionally vulnerable version:
  - XSS injection via quiz fields
  - No authentication checks
  - No session validation

You can switch between branches with:

```bash
git checkout secure
# or
git checkout insecure
```

---

## 📄 License

MIT License

---

Created with 💙 by Ahmad for educational purposes.
