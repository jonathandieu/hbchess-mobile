# hbchess-mobile
Repository to house the code for the mobile companion application of HBChess

## How to run the app:

### Installation
1. Install flutter/dart
2. Install Android Studio and run it
3. Click on 'More Actions' and then 'SDK Manager'
4. Go to the 'SDK Tools' tab and install 'Android SDK Command-Line Tools' by checking the box next to it
5. Go back to where 'More Actions' was and click on 'Virtual Device Manager'
6. Click on 'Create Device' and set up an emulator, I don't think it matters which one

### Running it
1. If you're using vscode, make sure to have the flutter and dart extensions installed.
2. On the bottom right of the screen on the blue toolbar, you'll be able to choose which device to run the app on. Choose the emulator you created.
3. Open up the terminal and run these commands:
    - flutter pub get
        - This installs any dependencies you need
    - flutter run
        - This actually runs the app, it should show up on the emulator after a bit
4. For hot reload, type in 'r' in the running terminal