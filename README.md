# ui_collection

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Advance Flutter Structures 101

This project is a playground for new devs to master the Featured First Architecture.


# Using the featured first approach

The featured first approach is derived from Uncle Bob's "**Clean Architecture**"

Uncle Bob's clean architecture has 3 Layers:
- Data
    - Repository(Data)
    - Models
    - Data Source
- Domain
    - Repository(Domain)
    - Entities
    - Use Cases
- Presentation
    - Logic Holders (Flutter Bloc, Provider, Get, and Etc)
    - Widgets

And overseeing all of this layers is the Core. With that being said. The file Structure for such an architecture is something like this:

- lib
    - app
        - logic holders (bloc)
        - helpers
        - modules
        - widgets
    - core
        - dependency injector
        - navigation
        - http client
        - storage
        - network
    - data
        - datasource
        - model
        - mapper
        - repositories
        - exceptions
    - domain
        - entities
        - enums
        - failures
        - params
        - repositories
        - use cases



Our featured first architecture on the other hand has 3 layers as well. But we do not separate each layer according to their specification. Instead, all of a feature's layer is inside our module. The file structure for this architecture is as follows:

- lib
    - core
        - logic providers (inject logic holders)
        - dependency injector
        - navigation
        - http client
        - storage
        - network
        - constants
        - enums
        - factories
    - modules
        - data
            - datasource
            - model
            - mapper
            - repositories
        - domain
            - logic holders (bloc)
            - entity
            - failure
            - params
        - page
        - widget
    - helper
    - dependency
    - widget


