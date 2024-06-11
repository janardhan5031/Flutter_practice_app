# flutter_application_1

A new Flutter project.

## Getting Started

To run the applicatin : flutter run

To install the dependencies : flutter pub get

To get the outdated packages : flutter pub oudated

To upgrade the dependencies : flutter pub upgrade


Routing Strategies : 
    1. Using Navigator of context {
        Navigator.of(context):

            Navigator is a Flutter class that manages a stack of pages (also called routes).
            Navigator.of(context) gets the Navigator instance that is managing the route for the given BuildContext (context).

        push():

            The push() method adds a new route to the top of the navigator stack. The new route will be displayed, and the previous routes will remain in the stack.

        MaterialPageRoute:

            MaterialPageRoute is a widget that provides a transition effect typical of Material Design (the design language of Flutter).
            It is a type of PageRoute that is used to define the transition animation and other characteristics of the route.

        builder: (context) => const ThirdPage():

            builder is a function that takes the current BuildContext and returns the widget that should be displayed for the route.
            const ThirdPage() creates an instance of ThirdPage (which should be defined elsewhere in your code). The const keyword indicates that the instance is constant and can be optimized by the Dart compiler.
    }

    2.
    

