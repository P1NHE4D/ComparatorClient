# Comparator

With the comparator, you can easily compare two objects with regard to their overall popularity
and optional, user-defined aspects, such as performance, design, security etc.. To achieve that,
the application uses an extensive elastic search data set to retrieve an array of sentences that
relate to the given query data and analyses them using a custom-built classifier as well as the
natural-language processor by IBM watson to determine which object is perceived to be better.

<div style="display: inline-block">
  <img src="https://raw.githubusercontent.com/P1NHE4D/ComparatorClient/master/media/QueryScreen.png" height="300px"/>
  <img src="https://raw.githubusercontent.com/P1NHE4D/ComparatorClient/master/media/QueryResultScreen1.png" height="300px"/>
  <img src="https://raw.githubusercontent.com/P1NHE4D/ComparatorClient/master/media/QueryResultScreen2.png" height="300px"/>
  <img src="https://raw.githubusercontent.com/P1NHE4D/ComparatorClient/master/media/FilterScreen.png" height="300px"/>
  <img src="https://raw.githubusercontent.com/P1NHE4D/ComparatorClient/master/media/SentenceListScreen.png" height="300px"/>
</div>

## Contents

1. [Architecture](#architecture)
2. [Installation](#installation)
3. [Execution](#execution)

## Architecture

The comparator consists of a [ASP.NET Core](https://docs.microsoft.com/en-us/aspnet/core/?view=aspnetcore-3.1) 
backend as well as a mobile frontend written in [Dart](https://dart.dev) using the
[Flutter](https://flutter.dev) framework by Google. 
The repository of the backend can be found [here](https://github.com/P1NHE4D/Comparator).

## Installation

This section guides you through the process of installing the mobile client of the
comparator on your device.

If you are looking for a guide on how to install the backend, please refer to the [readme](https://github.com/P1NHE4D/Comparator)
provided in the comparator backend repository.

### Install Flutter
The Flutter team provides a comprehensive documentation on how to install and setup Flutter
on your local machine. As Flutter is required for the mobile client to run, please follow the 
[guide on how to install flutter](https://flutter.dev/docs/get-started/install) on your local machine.

### Install Dependencies
After cloning the repository, execute `flutter pub get` to install the required dependencies in
a terminal of your choice.

## Execution
Connect your mobile device to your computer or start the android/iOS simulator.
Execute `flutter run` in the project root directory of the project to install the 
application on your device. 
