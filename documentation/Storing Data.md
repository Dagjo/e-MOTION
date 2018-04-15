# Storing Data
For our app we will be storing data in a database, locally on the phone for now, though in future on a server. Android supports a relational database called [SQLite](https://www.sqlite.org/index.html), which as the name implies is a SQL database (SQL is generally pronounced as _see-quel_). For now there is no need to understand the internals of how a relational database works, it's an area of study unto itself, we will treat it as a black box. 
> black box: any complex piece of equipment, typically a unit in an electronic system, with contents that are mysterious to the user.

SQL is an acronym for **_Structured Query Language_**, a SQL database is one that 'understands' SQL. If we want to put data into the database, or read data from the database, we have to do it using commands written in SQL. For our app we only need to use some of the basic SQL features:

- put a record in the database
- read one, or more, records from the database
- delete one, or more, records from the database

_A record is a cohesive set of data that is stored as a unit in the database._

The database has to know what a record looks like before it can store it, a **database schema** defines the records and where they should be stored. In SQL the place where a record should be stored is called a **Table**. Tables are simple structures, they consist of **rows** and **columns**. The columns define the fields of the record, the rows contain the data for the fields. A table for storing the name and birth date of a person might look like this:

FirstName | LastName | Birthdate
--------- | -------- | ---------
Leonardo | da Vinci | April 15, 1452
Wolfgang | Mozart | January 27, 1756

If the table is named **PEOPLE**, we could get the first names of the people in the table using the query: 

```SQL
SELECT FirstName FROM PEOPLE
```

To add a person to the table we have to use a slightly more complex command:
```SQL
INSERT INTO PEOPLE (FirstName, LastName, Birthdate) VALUES ('Ludwig', 'van Beethoven', 'December 16, 1770')
```

## Our schema
The schema for our app will be fairly simple. We will need a table to store journal entries, a table to store mood, and a table to store when medication was taken.

## Using SQL in our app
Allthough the SQL we will need is not complicated we should use good programming practices and add an abstraction layer for accessing the database so we don't have to create queries all over the place in our code.

_Abstraction is a powerfull concept we use in computer science and programming all the time. For now you can think of it as simply hiding complexity from the rest of the app._

Using the concept of abstraction we will create our own _black box_ for reading and writing our data to the database. So for instance rather than writing a query in the code:
```Dart
List<Map> list = await database.rawQuery('SELECT FirstName, LastName, Birthdate FROM PEOPLE');
```
We will hide the query in a method in a class, let's call the class DataStore:
```Dart
List<Map> list = await datastore.getPeople();
```
