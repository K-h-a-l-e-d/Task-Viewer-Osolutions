# Task Viewer Osolutions Tech Assessment

## Project Description
Simple Flutter Task Viewer Project which demonstrates simple CRUD operation, it Simply performs an HTTP GET request to fetch a list of tasks from an API, Displays these tasks in a ListView, on pressing on any of these tasks it navigates to more details about the task. also you can mark/unmark a task Checkbox  which toggles the status of a task whether its completed or not by sending a patch request to the API.
  
## Application Screenshots

## How to Run

1. Clone the repo
```
git clone https://github.com/K-h-a-l-e-d/Task-Viewer-Osolutions.git
```

2. add your API Credentials in the project using '--dart-define' way as the following (NOTE that you can use other ways to securely pass your credentials). 
- for linux and macOS run the following code format with your Credentials in a terminal 
```
export PROJECT_ID=<Your_PROJECT_ID>
```
```
export ANON_KEY=<Your_ANON_KEY>
```
- for windows you can follow the same approach but its recommended to use Powershell

3. run your IDE from the same terminal in which you ran the commands in step 2.

4. now in the IDE terminal run ``` flutter pub get ```

5. run the project by running the following command in IDE terminal
```
flutter run --dart-define PROJECT_ID=$PROJECT --dart-define ANON_KEY=$ANON_KEY
```
