# N + 1 queries problem

This is an example of a solution to n + 1 queries problem which is described [here](http://guides.rubyonrails.org/active_record_querying.html#eager-loading-associations). The application is available on [Heroku](https://secret-shelf-9574.herokuapp.com).

## Generating sample data

In a development environment:

    $ bundle exec rake generate_data N=<number_of_posts>

In a production environment (Heroku):

    $ heroku pg:reset DATABASE_URL --confirm <application_name>
    $ heroku run rake db:migrate
    $ heroku run rake generate_data N=<number_of_posts>

## Response times

Before:
```
N = 100
Completed 200 OK in 378ms (Views: 163.0ms | ActiveRecord: 213.9ms)
Completed 200 OK in 997ms (Views: 320.4ms | ActiveRecord: 676.2ms)
Completed 200 OK in 559ms (Views: 195.5ms | ActiveRecord: 363.3ms)
Completed 200 OK in 478ms (Views: 180.5ms | ActiveRecord: 296.4ms)

N = 1000
Completed 200 OK in 6356ms (Views: 2720.8ms | ActiveRecord: 3634.4ms)
Completed 200 OK in 3583ms (Views: 1416.7ms | ActiveRecord: 2165.4ms)
Completed 200 OK in 4340ms (Views: 1837.1ms | ActiveRecord: 2499.4ms)
Completed 200 OK in 4963ms (Views: 2226.5ms | ActiveRecord: 2736.2ms)
```

After:
```
N = 100
Completed 200 OK in 37ms (Views: 22.1ms | ActiveRecord: 13.8ms)
Completed 200 OK in 75ms (Views: 68.4ms | ActiveRecord: 6.1ms)
Completed 200 OK in 103ms (Views: 89.3ms | ActiveRecord: 12.7ms)
Completed 200 OK in 81ms (Views: 73.8ms | ActiveRecord: 6.2ms)

N = 1000
Completed 200 OK in 279ms (Views: 239.3ms | ActiveRecord: 39.2ms)
Completed 200 OK in 413ms (Views: 375.8ms | ActiveRecord: 36.4ms)
Completed 200 OK in 333ms (Views: 297.0ms | ActiveRecord: 32.5ms)
Completed 200 OK in 596ms (Views: 543.2ms | ActiveRecord: 45.6ms)
```
