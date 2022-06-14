# World-Time-App
Creating an app to show the time in various cities around the world by Flutter

In the application, there are 3 main pages: Home, Loading, and Location.
In Home page, users see the time in the current city they selected. Also, if the time is morning or noon, the background image will be a sunny photo while in the night there will be a dark sky image.
  Home page is also the page which users see the "edit location button". This button shows the Location page when onpressed.
Location page is the page where users select the city that they want in order to see the time in that city. The cities are created in Card Widgets with Listview.builder.
Lastly, the Loading page is the screen which is displayed when a data request is sent and the app was waiting for that data.
