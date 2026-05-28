# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Start server (development)
bundle exec rails server
# or via Procfile with thin:
bundle exec thin start -p 3000

# Database
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed

# Tests
bundle exec rake test                        # all tests
bundle exec ruby -Itest test/models/user_test.rb  # single test file

# Rails console
bundle exec rails console
```

## Architecture

This is a Rails 4.2 Reddit-style link-sharing app backed by PostgreSQL. Users submit links, vote on them, and comment on them.

**Models and key relationships:**
- `User` — Devise authentication; has `username`, `bio`, `location`; `acts_as_voter` (can vote on links); tracks `links_count` and `comments_count` via counter cache columns
- `Link` — belongs to `User` (counter cache); `has_many :comments`; `acts_as_votable`; stores `cached_votes_score` (integer, maintained by `acts_as_votable`) used for homepage sort order; `score` method returns upvotes minus downvotes
- `Comment` — belongs to `Link` and `User` (counter cache on user)

**Voting:** `acts_as_votable` gem maintains a polymorphic `votes` table. `cached_votes_score` on links is a denormalized integer kept in sync by the gem — the homepage sorts by this column (`Link.order(cached_votes_score: :desc)`). Individual up/downvote counts are fetched via `get_upvotes`/`get_downvotes`.

**Auth:** Devise with `database_authenticatable`, `registerable`, `recoverable`, `rememberable`, `trackable`, `validatable`. `username` is added to permitted sign-up params in `ApplicationController#configure_permitted_parameters`; `bio` and `location` are permitted for account updates. `CommentsController` uses non-standard `require_user` / `require_admin` before actions — these helpers must be defined or the app will error.

**Routes:** `devise_for :users` + standard resourceful routes for `users`, `comments`, and `links`. Links additionally have member routes `PUT /links/:id/like` → `links#upvote` and `PUT /links/:id/dislike` → `links#downvote`. Root is `links#index`.

**Database:** PostgreSQL; database name is `SocialNetwork_development` (not derived from the app directory name).
