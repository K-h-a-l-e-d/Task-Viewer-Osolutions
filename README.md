# Task Viewer Osolutions Tech Assessment

## Project Description
Simple Flutter Task Viewer Project which demonstrates simple CRUD operation, it Simply performs an HTTP GET request to fetch a list of tasks from an API, Displays these tasks in a ListView, on pressing on any of these tasks it navigates to more details about the task. also you can mark/unmark a task Checkbox  which toggles the status of a task whether its completed or not by sending a patch request to the API.
  
## Application Screenshots
|<img width="402" height="728" alt="swappy-20250918-095859" src="https://github.com/user-attachments/assets/0b698a77-f27f-4b1b-bfc3-9f678ead425a" />|<img width="400" height="727" alt="swappy-20250918-100601" src="https://github.com/user-attachments/assets/c04f3cfb-4293-4c00-ae96-ef0d8075f290" />|<img width="400" height="731" alt="swappy-20250918-100642" src="https://github.com/user-attachments/assets/3b3f05cc-6e27-4790-b095-f4f4bcc46b58" />|<img width="400" height="729" alt="swappy-20250918-100738" src="https://github.com/user-attachments/assets/c50538ea-a35d-46b3-a850-67b60ee3d929" />|
|-|-|-|-|

## App Overview
https://github.com/user-attachments/assets/0a7a1bcd-681b-42e7-b759-6f4dfeb83166




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

## Tech Stack
- Dio: for CRUD operations. used it for HTTP GET and PATCH in the project. while http package is a powerful option, i've chosen dio for this project as it handles json decode operation in GET requests out of the box.
- BLoC/Cubits: for state management, while Riverpod/Provider is a Strong Choice for state management as well, i've chosen BLoC as a personal preference and as i'm more familiar with its even/state-driven architecture.   
- Dartz: Dartz Package's Either Datatype is used to handle response fetched from API Whether that response was a successful query or an error. and i've chosen this package as it handles the null safety overhead making the code cleaner.