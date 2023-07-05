
# Tamatem Task

an iOS app that includes a web view displaying https://tamatemplus.com. The web view should have back, forward, and refresh buttons. When the app is opened, the user needs to see a centered button with the name “Open Browser”, and upon clicking it, the browser should be presented as a modal view containing the desired web view with all buttons with the ability to close it

## Documentation

I realise that the task specified using inline comments, however i strive to avoid writing unneccessary comments unless I have to. I try to make my ode as readable as possible

in regards to the loading indicator, apparently you use JavaScript to handle sub-Domain changes which is undetectable by the wkwebview delegate methods, which is why i used an observer i found on the web to measure estimated progress to show/hide indicator

## Authors

Seif Ghotouk
