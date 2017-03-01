# SQL Assessment

For this assessment, pretend we now we have a totally different website then from object relations section.
Please don't base your answers on your ruby work.

Here, we have a different Yelp-style application. We need customers, restaurants, owners, and reviews.  How do they link up?

## Topics / Objectives

+ Domain modelling
+ has_many / belongs_to relationships
+ SQL `Select` statements
+ SQL Joins

### Deliverables

1. As a first step, please write out the domain model in this file
   + What we are concerned about is which tables have foreign keys
   + Don't stress: There may be multiple correct answers based on your conception of the problem.

   Eg. for our books and authors your deliverable would look like

    ### books
    id | title | author_id

    ### author
    id | name |
2. As a second step, please fill in the stubbed out methods in the respective model.
  - Customer#reviews
    - returns all of the reviews written by that customer
  - Owner#restaurants
    - returns all restaurants belonging to that owner
  - Restaurant#owner
    - returns the owner of that restaurant
  - Review#customer
    - returns the customer of that review
  - Review#restaurant
    - returns the restaurant of that particular review


#### Hints:
  - The data always lives on the belongs_to relationship
  - Do the belongs_to first, then do the has_many
  - If there is a many to many, we need a third table
  - We've provided you with a `console.rb` file and a `seeds.rb` file. You can run `ruby tools/seeds.rb` to add some data to your database, and then `ruby tools/console.rb` to interact with your Ruby classes.


#### Write your domain model here:

### customers
|id| first_name| last_name
### restaurants
|id | name | owner_id
### reviews
|id| content | restaurant_id | customer_id
### owners
| id| first_name | last_name
