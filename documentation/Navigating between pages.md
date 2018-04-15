# Navigating between pages using Routes

The classes (widgets) discussed in this document are:
- [Navigator](https://docs.flutter.io/flutter/widgets/Navigator-class.html)
- [MaterialApp](https://docs.flutter.io/flutter/material/MaterialApp-class.html)
- [BuildContext](https://docs.flutter.io/flutter/widgets/BuildContext-class.html)
- [WidgetBuilder](https://docs.flutter.io/flutter/widgets/WidgetBuilder.html)

Our app consists of a number of different pages, each one providing a subset of the app's functionality. This means that the user has to be able to navigate to those pages, either explicitly, by directly selecting a page, or implicitly, as a result of some action.

When there are few pages it is relatively simple to keep track of them in the code and handle the navigation directly, but as the app becomes more complex so does managing the navigation.

**Flutter** has some classes and infrastructure to make basic navigation simple. The key to the system is a stack. Stacks are simple, intuitive, Last-In-First-Out (LIFO) data structures (or if you prefer First-In-Last-Out). This means that the last item added to the stack is the first one available from the stack (or the first one you put in is the last one available).

_By comparison queues are First-In-First-Out (FIFO) data structures

Stacks are not a new idea, people have used stacks instinctively in their everyday lives for a long, long, time. They are great for reversing the order you took things appart in :)

In computer science a stack is a data structure with some associated functions for manipulating the data structure. The most basic usable stack has two functions: _push_ and _pop_.

- To add an item to the stack you _push_ it onto the stack, i.e. add it to the top of the stack.
- To remove an item you _pop_ it off the stack, i.e. take the topmost item off the stack.

The items are popped off the stack in the reverse order they were pushed onto the stack.

_As an aside, any other function I wanted to perform on the stack I would have to implement in terms of **pushing** and **popping**, e.g. if I wanted to remove an item from the stack I would have to pop off items until popped off the one to remove, then push the others I had removed to get to it back on again. Fortunately there is a data structure I can use that helps me ensure I push them back on in the reverse order I popped them off :o_

It is the automatic reversing of the order that makes a stack useful for tracking basic navigation between pages. If I'm on the main page of my app and then go to the settings page, I can simply press 'back' to return to the main page. In this case _back_ is synonymous with _pop_!

This is the essence of the **Navigator** class provided by **flutter**. You navigate to a page by _pushing_ it onto the **Navigator**, and return to the previous page by _popping_ the current page from the **Navigator**. The current page is _always_ the page at the top of the Navigator's stack...

## Using the Navigator widget
The **Navigator** widget manages routes, so when we want to navigate to a page we have to **push** a route onto the **Navigator**. You can create route objects on the fly, but for our purposes it is simplest to reference them by name. The **MaterialApp** widget provides an easy way for us to manage our routes. _(recall our MyApp widget builds a **MaterialApp** widget as the root of our application)_

```Dart
new MaterialApp(
  home: new HomePageWidget(),
  routes: <String, WidgetBuilder> {
    '/settings': (BuildContext context) => new SettingsPageWidget(),
    '/anotherPage': (BuildContext context) => new AnotherPageWidget(),
    // etc, etc.
  },
  // other property settings as required
)
```
_Note that this is only to show the routes property of the MaterialApp widget, there are other properties that need to be set to successfully create a new instance of a MaterialApp widget._

The **MaterialApp** widget allows for us to map the names of our routes to WidgetBuilder classes that can be used to create an instance of a page. The map is maintained in the **MaterialApp's _BuildContext_** _(not strictly speaking true, but good enough for now)_ and we can use the Navigator.of(context) method to obtain a Navigator that knows the routes we added to the **MaterialApp**. 

By default the **MaterialApp** also adds the _home_ widget to the _routes_ as '/', so there are actually two routes: 
1. '/' which references the HomePageWidget
2. '/settings' which references the SettingsPageWidget 

So, to navigate from the home page to the settings page we can use the **Navigator** like this:
```
Navigator.of(context).pushNamed('/settings')
```

And to return to the home page:
```
Navigator.of(context).pop()
```

The **flutter** framework takes care of creating the widgets for the routes using the **WidgetBuilder** instances we mapped to the routes in the **MaterialApp**, and of binding the 'back' button to popping the current page off the **Navigator**.

Remember that the **Navigator** maintains a stack of the pages we create. If instead of popping the settings page to return to the home page, we pushed the '/' route, there would be three pages in the **Navigator**: 
- home
- settings
- home

and pushing the 'back' button would bring us back to the settings page, which might not be the behaviour we want. So be cognizant of when to push and when to pop.

## Using routes with the BottomNavigationBar
Since we're providing navigation between the main pages of the app through the **BottomNavigationBar** the default behaviour of pushing and popping routes with the **Navigator** may not provide the expected results. The **Navigator** has some additional methods that manipulate the stack a bit differently. A few exmples are:
- [pushReplacementNamed](https://docs.flutter.io/flutter/widgets/Navigator/pushReplacementNamed.html): replaces the route at the top of the stack with the one being pushed.
- [popUntil](https://docs.flutter.io/flutter/widgets/Navigator/popUntil.html): pops routes of the stack until it finds one that matches the conditions given. The routes that are popped are not navigated to, so they are not displayed.
- [pushNamedAndRemoveUntil](https://docs.flutter.io/flutter/widgets/Navigator/pushNamedAndRemoveUntil.html): pushes a new route onto the stack, and then removes routes below it until it finds one that matches the conditions given.

There are a few more like these, and it is worth looking at them so you know what your options are.

For the **BottomNavigationBar** I suspect the _pushReplacementNamed_ method will be appropriate.
