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

## Notes

Running on CLI (if ever): `flutter run -t lib/main_<variant>.dart --flavor <variant>;`

**ARCHITECTURE** – functional. Only domain can access both the page and data. Page cannot access data and vice-versa

**TASK**: Schedule

**TODO**: domain and page

Page: fetch schedule on load

To fetch, you need bloc or schedule bloc

On bloc: mock a loading state using Future.delayed(duration)

You initialize your fake data afterwards into entities

That is what you pass onto the page/UI

    Note: Enzo will be creating the contents of schedule_state.dart but that's only for comparison

    In bloc, you are calling an event that returns a state