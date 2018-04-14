The **flutter** framework is based in the concept of a _widget_. 

Widget is defined, generally, as:
> a small gadget or mechanical device, especially one whose name is unknown or unspecified.

Or more specifically for software purposes as:	
> an application, or a component of an interface, that enables a user to perform a function or access a service.


In **flutter** our application will consist of a top level widget that represents the foundation of the app.
By default this widget is defined in the main.dart file when you create a new **flutter** project, and is called **MyApp**.

**MyApp** is considered the root of your application since the rest of the app 'grows' like a tree from this one widget.

Conceptually our app looks like this:

```
MyApp 
 |
 |- Home
 |
 |- Journal
 |   |
 |   |- New Journal Entry
 |   |
 |   |- Read Journal Entry
 |
 |- Contacts
 |   |
 |   |- Contact 1
 |   |
 |   |- Contact 2
 |   |
 |   |- New Contact
 |
 |- Resources
 |   |
 |   |- Resource 1
 |   |
 |   |- Resource n
 |   |
 |   |- New Resource
 |
 |- Stats
 |   |
 |   |- Graph 1
 |   |
 |   |- Graph n
 |
 |- Settings
```

With each of the nodes representing a widget in the system.

In reality the tree is more complicated, since each of our widgets is really a sub-tree consisting of a number of widgets of its own.
For instance our main pages, the Home, Journal, Contacts, Resources and Stats widgets, are Scaffold widgets. 
The **Scaffold** widget is provided by the **flutter** framework and provides functionality to lay out some common features in an app like drawers and navigation bars.

From our wire frames we know we want to have an application bar at the top of our pages, and a navigation bar at the bottom.
So the tree representing one of our main pages looks more like this:

```
Journal
 |
 |- AppBar
 |
 |- body
 |   |
 |   |- List of Journal entries
 |   |
 |   |- New Journal entry
 |   |
 |   |- Read Journal entry 
 |
 |- BottomNavigationBar
```

The **AppBar** and **BottomNavigationBar** are also standard widgets provided by the **flutter** framework, each of which consists of a number of widgets.
The _body_ is where we add our widgets, i.e. we will have to define widgets that allow a user to select from a list of journal entries, read a journal entry, and create a new journal entry.

As you can see, the application is a tree of many, many, widgets :)

**flutter** provides a lot of standard widgets, but there are plenty of widgets that we will have to build ourselves that add the distinguishing functionality of our app.

If you think about it a bit, you will realize that we could lay out our application in many other ways, but the constraints of the **flutter** framework mean we will always have some tree structure.
For instance rather than making each of our main widgets Scaffold instances, we could do something like this:

```
MyApp 
 |
 |- Scaffold
 |   |
 |   |- AppBar
 |   |
 |   |- body
 |   |   |
 |   |   |- Home
 |   |   |
 |   |   |- Journal
 |   |   |   |
 |   |   |   |- New Journal Entry
 |   |   |   |
 |   |   |   |- Read Journal Entry
 |   |   |
 |   |   |- Contacts
 |   |   |   |
 |   |   |   |- Contact 1
 |   |   |   |
 |   |   |   |- Contact 2
 |   |   |   |
 |   |   |   |- New Contact
 |   |   |
 |   |   |- Resources
 |   |   |   |
 |   |   |   |- Resource 1
 |   |   |   |
 |   |   |   |- Resource n
 |   |   |   |
 |   |   |   |- New Resource
 |   |   |
 |   |   |- Stats
 |   |       |
 |   |       |- Graph 1
 |   |       |
 |   |       |- Graph n
 |   |
 |   |- BottomNavigationBar
 |         
 |- Settings
```

This layout is probably a bit more efficient, however it is a little more complicated on the coding side as it requires us to maintain the AppBar and BottomNavigationBar state globally rather than as part of each main page.

Deciding on trade-offs like that is a common thing when programming. Simple code is easier to code and maintain, but perhaps not as efficient. Efficient code may be more performant, but may have more bugs and be harder to work with in the long run.

As a rule of thumb I like to start with simple, then make things more efficient if necessary.
 
 
