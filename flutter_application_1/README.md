# flutter_application_1

A new Flutter project.

## Getting Started

To buid the apk : flutter build apk --build-name=1.0 --build-number=1

To install new pluggin : flutter pub add PLUGIN_NAME

To run the applicatin : flutter run

To install the dependencies : flutter pub get

To get the outdated packages : flutter pub oudated

To upgrade the dependencies : flutter pub upgrade



## Routing Strategies 
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

    2.Named Routes Navigation : 
        1.Routes Map :
            Here instead of pushing the build context into Navigator context, we navaigating to specific route on press functionality.
            
            routes: {
                "/secondPage": (_)=>const SecondPage(name:"janardhan")
            },
            routes in the MeteriaApp from MyApp will take care of handling navigation. But if we want to pass dynamic data to specic route its difficult.

        2.Route Generator : 
            initialRoute: "/",
            onGenerateRoute: RouteGenerator.generateRoute,

            this method will manages all routes at one place. based on the routes, Material app will handle this in easily.
            we can pass the dynamic data to the routes specified widget fron onTap (or) onPressed function.
        


## State Management : 
    1. Statefull Widget
        pros :
            it is usefull for less than three widget's state management by passing their state managing value or funtions to the child widgets
        
        cons :
            It is hard to handle robust and sofisticated state management for large number of widgets


    2. Statefull Builder
        pros :
            