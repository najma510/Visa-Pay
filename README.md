# VisaPay

VisaPay is a flutter payment app with features like generating links and QR code for payments.


### Installation:

1)  Clone this repository

```bash
git clone https://github.com/mikal09/Visa-Pay
```
2) Navigate to the project directory Visa-Pay
3) Install the required flutter extension and packages in VS Code or Android studio.


## For Visa Pay Mobile Application

#### To Run:
```bash
flutter run
```

## For Visa Pay Web Service

1) Create a fat jar out of Spring Boot Application (VisaPaymentRESTService folder) using ``` mvn clean install```. An embedded Tomcat Server is also built-in.
2) If you wish to deploy the application as WAR, change the packaging property inside pom.xml to war.
3) Run the jar file using ``` java -jar <artifact-name>```
