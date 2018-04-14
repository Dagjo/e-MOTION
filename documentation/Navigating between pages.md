# Navigating between pages using Routes

## Classes referenced in this document
- Navigator
- MaterialApp

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


