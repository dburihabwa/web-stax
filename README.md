# web-stax
Interface web pour la recherche de stack traces postées sur StackOverflow.

## Configuration requise

* Java 7
* Apache Tomcat 8

## Configurer la base de données
Modifiez les valeurs dans src/webapps/WEB-INF/config.properties pour addresser la bonne base de données.

## Builder le projet
```java
mvn package
```

## Installer la webapp
Déployez le war produit après avoir buildé le projet dans le repertoire webapps de Tomcat.
