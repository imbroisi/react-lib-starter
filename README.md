
# React Lib Development | The Easy Way

> _Including local library deployment (no need to deploy to **npm** during development), TypeScript, Hooks support, Unit Test, ESLint, pre-commit validations, and no monorepo._

If you’ve landed on this page, maybe you’re just learning how to make React libraries, or you’ve been beaten a lot trying — creating libraries is not trivial. There are many things to do, between installing specialized libraries, tools and a complex sequence of procedures to locally test you lib.

Well, the good news is that I think I’ve created a very practical and easy way to develop React libraries, mainly including a playground to test your libraries without the need to publish to **npm** repo. You create or edit some content in your library, run just one specific command and — that’s it. Your test app automatically opens in the browser after the entire local build and local deployment process has been performed.

Let’s get down to business.

> **Note**: _These procedures has been tested on Mac and Linux. For Windows you may have to make some adjustments_.

I created a kind of template, a small library that will serve as a starting point for your project. Let’s install and test that library locally.

```bash
git clone git@github.com:imbroisi/react-lib-starter.git  
cd react-lib-starter  
npm install  
code .
```

Now you have the starter project installed and opened in VSCode.

As you can see in VSCode, we have two main directories:  
-  **_library_**: where your library will be developed.  
- **_playground_**: where you will have a React App to import and test you library locally.

Once installed, the starter project comes with an example library with **one component** and **one hook** in the **_library_** directory.  
Also, in **_playground_** you have a Creat-React-App program, ready to use the library.

Now, finally, run the command:

```bash
npm run local-publish
```

and wait a few seconds while your library is built, packaged and deployed locally. If you want to see what’s going on behind the scenes, take a look at the **_scripts/local-publish.sh_** file.

At the end of the process your browser will be opened showing the App page with the library imported.

Just that.

Now you able to play aroud the project, changing things in the libray and the App, and see the results.

>_Every time you make changes in the lib, just stop the program (**ctrl+c**), and run the command "**npm run local-publish**" again._
> 
> _If you only make changes to the test App in the _playground_, you don’t need to rebuild the library — the update will show up automatically in the browser._

---
## How to create a new project based on react-lib-starter


If you don't know how to create a project based on another, this section is for you.

Let's assume your project will be called **_my-lib.  
_**And your **npm** user name is **_janedoe_** (later I'll talk about **npm** repo)**_._**

Step 1: create the **_my-lib_** in Github site with just the _README.md_ file. Be shure you branch default name is **_main_**.

Step 2: in you machine, go to your local copy of **_react-lib-starter_**.

Step 3: do this in you terminal (at **_react-lib-starter_** repo), replacing <YOUR GIT USER> with your Github user name:

```bash
git push git@github.com:<YOUR GIT USER>/my-lib.git +main:main
```

At this point you have in Github site (not in your local machine) a repository named **_my-lib_**, your personal copy of **_react-lib-starter_**.

Step 4: to have your **_my-lib_** project in your machine, go to where you want to have it and:

```bash
git clone git@github.com:<YOUR GIT USER>/my-lib.git  
cd my-lib
```

Step 5: update the names inside the project code.  
a) update important fields in all three _package.json_ in the project to fit your project name. For example in _library/package.json_:

```
"name": "@janedoe/my-lib",  
"version": "<THE INITIAL VERION OF THE LIB>", // 0.1.0 is a good choice  
"author": "<YOUR NAME>",
```

Where **janedoe** is your **npm** user name, and **my-lib** the name of your lib.

b) there are other fields that would be nice to update, such as _description_, _repository_, _license_, _bugs and homepage_.

c) in the app’s _playground_, change the name of the lib in the _import_ statement in **_App.tsx_**.

Now you're good to go. You can create some code in your library, and to test it:

```
npm run local-publish
```

And see the result in the broser.

> _Remembering that every time you make changes to the lib, just stop the program (**ctrl+c**), and run the above command again._
> 
> _Also, if you only make changes to the test app in the **playground**, you don’t need to rebuild the library — the changes will automatically appear in the browser._

---
## How to publish your library on npm repo


Once your lib is done, to be able to publish your project to the **npm** repository you need to have a **npm** account. Access [this link](https://www.npmjs.com/signup) to create a **npm** account if you don’t already have one.

At **npm** repo your library can be private (only for paid account) or public (free or paid accout).

In the terminal go to **_my-lib_** project, directory **_library_**.

```
npm run build  
npm publish --access public # or for private lib just "npm publish"
```

Now your library is in the **npm** repo and ready to be used.

As any lib _import_ in React projects, install your lib in a new Rect project this way:

```
npm install @janedoe/my-lib
```

And to use it inside your code:

```
import { YourLibComponentA, YourLibComponentB } from '@janedoe/my-lib';
```

