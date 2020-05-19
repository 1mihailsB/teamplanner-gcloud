# Teamplanner
## Practice Spring Boot project. This version is hosted on Google Cloud Compute Engine and uses Google Cloud SQL service.
  
### Don't forget to edit application.properties when trying to run this project and register your application in Google's developer's console to configure Oauth2 and add google.client.** properties in properties file. Here's the link to Google dev console: https://console.developers.google.com/apis/dashboard. Also create a database and run the script from this repository to create the table necessary to run the code at this point.
### Also edit the sql script line for `user [SCHEMA_NAME]` and application properties for cloud.gcp instance connection name, database name, database username and password.
Rest API to be consumed by front end app.
Will include Google Authentication: on the front end - retrieval of Authorization Code,
on back end - verification of this Authorization Code using Google's https://oauth2.googleapis.com/token endpoint, which is set in application.properties.
