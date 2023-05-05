# Kumande Mobile Documentation
- API Base URL : https://kumande.leonardhors.site
- Database (MariaDB & Firebase)

# About App
Kumande is an app that can help you manage your daily consumed food. From that, you can browse
your past consumed food, analyze it, and make daily schedule. To help you maintain your healthy lifestyle, you can integrate your daily consumed food with BMI Calculator. In this app, also provide
dashboard and statistic, so your meal schedule becomes more structured.

======================= Features =========================
- Manage food schedule
- Consumed food statistic
- Make food list
- Consumed food history
- BMI Calculator (In-Progress)
- Tags for your consumed food, list, and schedule.

========================= Stack ==========================
- Flutter
- Firebase Auth
- Firebase Cloud Firestore (In-Progress)

Others :
# Kumande API 
- Repo : https://github.com/FlazeFy/Kumande_API
- Laravel 9 API
- Laravel Auth Sanctum
- Deploy on Hostinger

========================= Command =========================
# First Run
> flutter clean
> flutter pub get
> flutter run

# Run Application
> flutter run

============== File & Structure Directory =================
Assets (Image, Video)
Directory               : /assets

# Components (Widget)
    - Backgrounds : Custom backround using canvas
    - Containers : Container or box layout for item list (Interactable only for pop-up or navigation)
    - Dialogs : Success and failed pop up
    - Forms : Receive input from user and some can show the result
    - Icons : Define the icon that will be used by condition
    - Navbars : For page navigation between main-menu, sub-menu, bottomsheet, and side drawer
    - Skeletons : *in-progress*
    - Typography : Sets of title, subtitle, of paragraph
    - Others : line divider, and define image that will be used by condition

# Modules (Functionality)
    - APIs : Some API modules using laravel API
        - Models : Data mapping before sending to API endpoint. From json or to json
            - << Functionality Name >>
                - Commands : For insert, updated, and deleted SQL syntax
                - Query : For select SQL syntax
        - Services : Get and send data from models to API endpoint and get the response
            - << Functionality Name >>

    - Firebases :
        - Auth : Login and register auth using firebase auth

    - Helpers : Sets of function or class that will converted data type, generated new data ,generated widget from data, or validate the data
    
    - Variables : Sets of style guides variables and global variables (used in dummy data, or input option)

# Pages (Screen)
    - Landings : Pages outside the main-menu or sub-menu. Such as login, register, splash, forget pass, and get started
        - << Menus Name >>
            - index.dart : Main class that have scaffold. So it's act like screen and will hold some sets of layout
            - Usecases : Sets of layout (widget) that group by it's functionality. It will be related to Modules (API or Firebase)

    - MainMenus : Pages that will available on bottom navbar

    - SubMenus : Pages that will available after the user have interact to some button or container in main menu layout

============================ Rules ===============================

# Class dan Function rules
> Class using uppercase in first char, not using underscore
> Function using lowercase in first char

# Dart file rules
> file_name.dart
> Each one file contain max 500 SLOC
> Using lowercase and underscore 
> One pages folder only have one index.dart
