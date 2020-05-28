# Teamplanner - https://teamplanner.xyz/
## Practice Spring Boot project. This version is hosted on Google Cloud Compute Engine and uses Google Cloud SQL service.
  
### Don't forget to edit application.properties when trying to run this project and register your application in Google's developer's console to configure Oauth2 and add google.client.** properties in properties file. Here's the link to Google dev console: https://console.developers.google.com/apis/dashboard. Also create a database and run the script from this repository to create the table necessary to run the code at this point.
### Also edit the sql script line for `use [SCHEMA_NAME]` and application properties for cloud.gcp instance connection name, database name, database username and password.
In deployed version the React front end files are added in resources/static folder of Spring app and will be served when user visits the website. After this first initial request, the front end app will behave like Single Page Appliaction.
