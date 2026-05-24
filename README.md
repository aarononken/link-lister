# Link Lister

A Rails 7.2 link-sharing application where users can post links, vote on them, and comment. Similar to Reddit or Hacker News.

## Features

- User authentication via Devise
- Post and share links
- Upvote/downvote links
- Comment on links
- User profiles with bio and location
- Links sorted by vote score

## Requirements

- Ruby 3.3.6
- Rails 7.2.3+
- PostgreSQL 12+

## Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd link-lister
```

2. Install dependencies:
```bash
bundle install
```

3. Configure the database:
   - Update `config/database.yml` with your PostgreSQL credentials
   - Create and migrate the database:
```bash
rails db:create
rails db:migrate
```

4. (Optional) Seed the database:
```bash
rails db:seed
```

## Running the Application

Start the Rails server:
```bash
rails server
```

Visit http://localhost:3000 in your browser.

## Running Tests

```bash
rails test
```

## Security Features

- CSRF protection enabled
- Strong parameters for mass-assignment protection
- Authentication required for creating links and comments
- Admin-only comment deletion
- URL validation on links
- Modern browser requirement for enhanced security

## Deployment

This app is deployment-ready with:
- Puma web server
- Asset pipeline with Sprockets
- Importmap for JavaScript
- Hotwire (Turbo + Stimulus) for modern interactivity

### Environment Variables

For production deployment, set:
- `SECRET_KEY_BASE` - Rails secret key (generate with `rails secret`)
- `DATABASE_URL` - PostgreSQL connection string

## License

This project is available as open source under the terms of the MIT License.

## Upgrade Notes

This application was upgraded from Rails 4.2 to Rails 7.2, with the following improvements:
- Modern Rails 7 conventions
- Security vulnerabilities fixed
- Hotwire instead of Turbolinks
- Puma instead of Thin
- Importmap for JavaScript
- URL validations added
- Authentication properly enforced
