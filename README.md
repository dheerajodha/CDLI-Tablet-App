# CDLI Tablet App made using Flutter

<b>ABOUT</b> : CDLI already has it's Android and iPad application published on stores to allow users of app to learn about ancient history, one entry at a time. By "entry", I mean daily entry, the current apps add a new entry each day to give the users something new to look and learn each day. These entries contain an image of an artifact/cunieform/sculptures of historical interests, along with a description about them.<br><br>

<b>PURPOSE</b> : This project works on to develop new mobile applications for CDLI developed
completely by Flutter so that we won’t need two seperate mobile applications for both
android and apple devices, this would help in saving lost of time and energy in
maintaining both the apps. Also, this gave me an opportunity to learn about Flutter, and at the same time, to work on my first Open Source Project.<br><br>


<b>MY PLAN</b> (on how to fetch data from json array) : 

➔ To do this task, we’ll use 2 Flutter libraries :
- HTTP​ for network calls.
- json_annotation​ for annotating your JSON model classes.

<br>➔ Since, a class defines the fields you’ll pull from the JSON, following classes will be
present inside ​ Cuneiform_Data.dart ​ file :
- CuneiformData : class having attributes ​ url, thumbnail, theme, title, blurb,
description ​ and​ date.
- CuneiformDataList : class to hold dart list of CuneiformData.

<br>➔ Naming Convention :
- Here, CuneiformData class is used to fetch the overall data of each entry from
the json array, which will be displayed in several routes.
- So, basically we are fetching “Data” of each “Cuneiform”, hence CuneiformData.

<br>➔ We’ll also use two development libraries that create helper classes for converting
JSON strings into our model objects :
- build_runner​ , which runs your json_serializable library.
- json_serializable​ , which creates the extra helper classes that convert strings
into your models.

<br>➔ And, the URL that we’ll be using to fetch data is :
https://cdli.ucla.edu/cdlitablet_android/fetchdata.php<br><br>

<b>FLOW DIAGRAM</b> 

<img src="./CDLI_ULTRA_UPDATE_JSONFETCH.jpg">

<b>Source</b> : My brain + draw.io<br>

<b>Note</b> :<br>	
        ➢ *​ ​: <i>Problem</i> -> ​ Here we are ​ not​ passing the date(or any attribute that uniquely
	identifies an entry) of the tapped item to CuneiformInfoPage() to display that
	entry’s info. Because if we do that, we’d once again call the API to fetch the data
	of the tapped item, and since async functions are time consuming, we should
	avoid them as much as possible.<br>
	<i>Solution</i> -> ​ Hence, what we can do is, we directly pass the tapped object
	itself to the CuneiformInfoPage(), so we can directly access the attribute value of
	the tapped object using the dot operator. Here we don’t need to call the API
	again to fetch data.<br>
        ➢ [1] : ​ This class is present inside Cuneiform_Collection_Page.dart file, it’s job is to
	fetch the ‘thumbnail’ and ‘date’ from the json array, and display them in form of
	GridView.<br>
        ➢ [2] : ​ This class is present inside the Cuneiform_Data.dart file (which stores our
	models), its job is to hold a Dart list of CuneiformsData to be displayed.<br>
        ➢ [3] : ​ This class is present inside Cuneiform_Info_Page.dart file, it’s job is to
	display ‘url’, ’title’, ‘blurb’ and ‘description’ of the tapped item.<br><br>


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
