# Working with the BottomNavigationBar

The [BottomNavigationBar](https://docs.flutter.io/flutter/material/BottomNavigationBar-class.html) is a widget that represents a bar with icons, and text, that should be used to navigate to other pages of your app.
Usually you would use a **BottomNavigationBar** in conjunction with a [Scaffold](https://docs.flutter.io/flutter/material/Scaffold-class.html) widget, since the **Scaffold** widget provides support for positioning the bar on the page.

There are a couple of things to be aware of when using the **BottomNavigationBar**:
1. It requires at least two [BottomNavigationBarItem](https://docs.flutter.io/flutter/widgets/BottomNavigationBarItem-class.html) widgets to function, less than two and you will see errors on your screen.
2. **BottomNavigationBarItems** must have both an _icon_ widget, and a _title_ widget. If you only provide one or the other you will get errors.

## The BottomNavigationBarItem
A [BottomNavigationBarItem](https://docs.flutter.io/flutter/widgets/BottomNavigationBarItem-class.html) is simply a widget that represents something to display on the **BottomNavigationBar** for the user to click on so initiate a navigation to another page. As such is requires only an icon and a title to display.

Flutter provides an enormous set of standard icons for use in your app, you reference them from the [Icons](https://docs.flutter.io/flutter/material/Icons-class.html) class, e.g. **Icons.home** or **Icons.people**. For our purposes we should be able to use standard icons for now.

So, when we create a **BottomNavigationBarItem** it will look something like this:

```Dart
new BottomNavigationBarItem(icon: new Icon(Icons.home), title: new Text("Home"))
``` 

## The BottomNavigationBar
The **BottomNavigationBar** displays the **BottomNavigationBarItems**, and tracks which one is currently selected. It takes care of highlighting the selected BottomNavigationBarItem for you, and displays the BottomNavigationBarItems in one of two ways depending on the method you specify.

In general you will not want to add more items to the navigation bar than can be comfortably displayed accross the screen, so **BottomNavigationBarType.fixed** is the best method to use.

As mentioned a **BottomNavigationBar** needs a list of at least two **BottomNavigationBarItems** to function. To know which item is the selected one it keeps track of the index of that item in the provided list.

Creating a minimal instance of a **BottomNavigationBar** will look something like this:

```Dart
new BottomNavigationBar(
  currentIndex: 0,
  type: BottomNavigationBarType.fixed,
  items: <BottomNavigationBarItem>[
    new BottomNavigationBarItem(icon: new Icon(Icons.home), title: new Text("Home")),
    new BottomNavigationBarItem(icon: new Icon(Icons.people), title: new Text("Contacts")),
  ])
```
In this case we are only providing two **BottomNavigationBarItem** instances, so there will only be two options displayed in the bar.  

Since we are creating a new instance with **_currentIndex: 0_** the Home icon and text will be highlighted when the bar is displayed, if we used **_currentIndex: 1_** the 'Contacts' icon and text would be highlighted.
 
_Note: arrays, and lists, in Dart are indexed from 0, not 1._
  
Navigation between the pages does not happen automatically though, using the base **BottomNavigationBar** class there is no way to indicate where to navigate to. Fortunately the **BottomNavigationBar** provides a way for us to respond to a user tapping one of the items.
 
We can add code that is executed when the user taps on an item by setting the _onTap_ property of the bar:

```Dart
new BottomNavigationBar(
  currentIndex: 0,
  type: BottomNavigationBarType.fixed,
  items: <BottomNavigationBarItem>[
    new BottomNavigationBarItem(icon: new Icon(Icons.home), title: new Text("Home")),
    new BottomNavigationBarItem(icon: new Icon(Icons.people), title: new Text("Contacts")),
  ]),
  onTap: (int index) {
    switch (index) {
      case 0: /* Navigate to the 'home' page */; break;
      case 1: /* Navigate to the 'contacts' page */; break;
    }
  })
  ```
  
_Note: I'm not showing how to navigate to another page here, that is discussed in another document._
