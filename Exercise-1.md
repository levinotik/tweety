# Exercise 1

Clone this project using git. In the project directory, use `Stack` to setup the project. 

`stack setup` and then `stack build`

There is a Haskell source file named `Database.hs`. It will contain functions for connecting to and working with a local Postgres database. The first thing we need to do is to construct a connection string according to the [Postgres format](https://www.postgresql.org/docs/9.4/static/libpq-connect.html#LIBPQ-CONNSTRING). 

In the Hasql package (the package we'll be using to interact with Postgres), this means we need to construct a `Settings` type which is actually just a type alias for a `ByteString`. Recall that a `ByteString` is just an optimized String. The Hasql package provides a [convenience function](https://hackage.haskell.org/package/hasql-0.19.18/docs/Hasql-Connection.html#v:settings) for helping us construct the connection string we need. This function is defined as 

```haskell
settings :: ByteString -> Word16 -> ByteString -> ByteString -> ByteString -> Settings
```

These arguments, in order, are for the host, port, user, password and the database name. 

Since we do not want to store these details directly in our application, both because of flexibility and security, we will read these values from a configuration file. Ordinarily, this configuration file would be added to our `.gitignore` file so that no record of it would exist in source control. However, for the purposes of this project, I've included it in this repository so you can see what the configuration file ought to look like. You can find it in `conf/app.cfg`. You need to edit this file to match the details that make sense for your own Postres database running on your local machine. 

Your task is to complete the implementation of the `loadDBSettings` function in the `Database` module. 

To do this, you will need to load configuration values from the configuration file using the Configurator package. Take a look at the [section on "Lookup functions"](https://hackage.haskell.org/package/configurator-0.3.0.0/docs/Data-Configurator.html#g:9) in the Configurator documentation.

Once you've figured out how to load up the configuration values for the host, port, user, password and database name, you will use the [`settings`](https://hackage.haskell.org/package/hasql-0.19.18/docs/Hasql-Connection.html#v:settings) convenience function provided by the Hasql package to output a value of type `Settings` (which you'll remember is really just a `ByteString`).

Bonus:

1. Why is the outer type of the `loadDBSettings` function `IO` if `Settings` is just a `ByteString`?
2. Take a look at the Hasql documentation and see if you can figure out how to acquire a connection to the database with your newly constructed `Settings` and then test that everything is working. You can simply execute a query such as `select 1` to confirm everything is working. 



