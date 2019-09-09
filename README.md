# UI-Strings

This repository contains the source and translated strings for Arrival Advisor. 

It is integrated with our Weblate application found here: https://translate.peacegeeks.org/ 

### Source Strings 

The English source strings are found in the `*.pot` files. The msgid's in the `*.pot` files are used to indicate which strings each locale needs to translate on Weblate. 

### Git Workflow

There are two branches that are used in in this repository: `translate` and `master`. When committing and pushing changes from Weblate, the changes are automatically merged into the `translate` branch. 
Along with this, a PR is opened into the `master` branch. We are able to test changes made on Weblate using the `translate` prior to merging into `master`.

### Project Structure

We have three components in our UI-Strings project on Weblate. 

* Questionnaire - this is where you can find the source and translated questionnaire strings 
* Explore - this is where you can find the source and translated strings in the Explore section of Arrival Advisor 
* JSX_Strings - this is where you can find the source and translated JSX Strings IE: strings found on the About page. 

### Roles

There are two roles, not including admin: 

* Translator
    * Translate Strings
    * Add and Accept Suggestions
    * Use Machine Learning Services 
    * Comment on Strings
* Reviewer

    * can do everything above as well as:
    * Review strings
    * Push changes to the Github repository designated in the component settings

### Notifications

Users in either role need to sign up for component and translation notifications - these can be adjusted by clicking on the top right corner and clicking on Settings 

Component notifications are triggered when there is a merge failure and a new language request.

Translation notifications are triggered when there are new strings to translate, there are new comments/suggestions on their specified language.  

### Version

Currently using Weblate 3.5.1

### For More Informatin

See the Weblate's documentation [here](https://docs.weblate.org/en/weblate-3.5.1/)

