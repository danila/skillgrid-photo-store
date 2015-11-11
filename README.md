dnlrmkv photo store
============
Simple online store application for Skillgrid Internship

## Installation
1. Clone the repo: `git clone https://github.com/danila/skillgrid-photo-store.git`
2. Change directory `cd skillgrid-photo-store`
3. Install gems: `bundle install`
4. Run DB migration: `rake db:migrate`
5. Seed the DB: `rake db:seed` 
6. Run Sidekiq as daemon: `sidekiq &`
7. Run the app: `rails s`
8. Open page in browser: `http://localhost:3000/`
