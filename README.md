# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of learning Rails by example.

The project was based on legacy code, and numerous new features were added:
 * Admin security: admin pages now protected with user name and password combination through http basic authentication.
 * A sold-out badge is displayed when product quantity reaches 0
 * Sale feature: an admin sale page has been added. The current sale feature has also been added to the user interface.
 * User authentication functionalities have been added, with registration and login pages. User passwords are not stored as plain text on the database and email addresses are checked for uniqueness at registration.
 * Order Details page has been overhauled displaying relevant information after order confirmation, including items ordered, final amount of the order and the email address used to place the order.
 * Empty cart: if the cart is empty and a user clicks on the icon, a friendly message will direct them to add items before checking out, with a link back to the home page.



## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
