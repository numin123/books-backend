# Books Backend App

This is the backend application for managing books. It is built with Ruby on Rails.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

You need to have the following installed:
- Ruby
- Rails
- Redis

### Installation

Here are the steps to set up the environment:

1. **Clone the repository**
    ```
    git clone https://github.com/numin123/books-backend.git
    ```

2. **Navigate to the directory**
    ```
    cd books-backend
    ```

3. **Install dependencies**
    ```
    bundle install
    ```

4. **Set up the database**
    ```
    rails db:create
    rails db:migrate
    ```
5. **Create .env from .env.example**
    ```
    JWT_SECRET_KEY=ff9a3ade5456843383b6a900d7274b60b4a350faf6d30e4eb1ba313a741db199892dc19fd96dbbe49c7b7c8953979910381eee1cdc84418290710f56d42c5c5b

6. **Start the server**
    ```
    rails s
    ```

Now, you should be able to see the application running at `localhost:3000` in your web browser.

Books frontend repository https://github.com/numin123/books-frontend
