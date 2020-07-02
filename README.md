# VisaPay

VisaPay is a flutter payment app with features like generating links and QR code for payments.


### Installation:

1) Install and setup flutter using [Install flutter](https://flutter.dev/docs/get-started/install).
2)  Clone this repository

```bash
git clone https://github.com/mikal09/Visa-Pay
```

## For Visa Pay Mobile Application

#### To Run:
1) Navigate to the project directory Visa-Pay
2) Remove the folder VisaPaymentRESTService folder
3) Install the required flutter extension and packages in VS Code or Android studio.
4) Launch Emulator or run on real device
5) Run the app from terminal using ```flutter run```.

## For Visa Pay Web Service

1) Navigate to the project directory Visa-Pay
1) Create a fat jar out of Spring Boot Application (VisaPaymentRESTService folder only) using ``` mvn clean install```. An embedded Tomcat Server is also built-in.
2) If you wish to deploy the application as WAR, change the packaging property inside pom.xml to war.
3) Run the jar file using ``` java -jar <artifact-name>```
