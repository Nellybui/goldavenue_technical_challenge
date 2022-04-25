# Test technique
## Rendu
Faire un repository git (github public ou privé et communiquer le lien par email)

## But

Evaluer la capacité à faire une application structurée et testée.

**Note : le rendu visuel (HTML, CSS, JS) n'est pas pris en compte. Pas besoin de perdre du temps sur la mise en page.**

### Notions importantes

Les notions les plus importantes de ce test sont :

1. Les tests d'intégration (ou features test)
1. Les services object (couche ruby on rails supplémentaire)
1. Les nested routes (namespace ou module)

#### Documentation

[feature test](https://www.simplermachines.com/rspec-feature-tests/)

[rspec capybara](https://www.codewithjason.com/rails-integration-tests-rspec-capybara/)

[service objet](https://www.toptal.com/ruby-on-rails/rails-service-objects-tutorial)

[nested routes](https://guides.rubyonrails.org/routing.html)

**Note : pas besoin de faire de CSS, ni de système d'authentification.**

## Sujet du test

**Bienvenue à Bijouxville**

Ici les Models et les fonctionnalités portent sur le thème de le bijouterie.

Dans l'application il y a :
Des bijoutiers qui détiennent des bijoux.
Des bijoux qui ont des pierres précieuses.

### Description des Models

Vous pouvez ajouter autant d'attributs et de Models que nécessaire. 

```
Stone name price
Material name base_cost
Jeweler name
Jewel name

JewelStats 
```

Le prix d'un bijou et égal au coût de base d'un matériel plus le prix de chaque pierre.
Un bijou peut avoir de 0 à n pierres.

## Questions

### Feature test

Implémenter les fonctionnalités suivantes

#### Sénario 1 - homepage simple

```cucumber
Étant donné des bijoutiers avec des bijoux
Lorsque je suis sur la home page 
Alors je vois le nombre de bijoutiers
Et je vois les types de bijoux (or, argent, fer...)
Et je vois les types de pierre précieuses (ruby, saphir, émeraude...)
```

Note : il doit y avoir un lien vers les ressources :

1. Les bijoutiers
1. Les types de bijoux
1. Les types de pierre précieuses

#### Sénario 2 - statistiques des finances

```cucumber
Étant donné des bijoutiers avec des bijoux
Lorsque je suis sur la home page 
Alors je vois la somme totale de bijouxville (tous les bijoux de tous les bijoutiers).
Et je vois la somme totale par type et par pierre
```

#### Sénario 3 - suppression de bijoux
```cucumber
Étant donné des bijoutiers avec des bijoux
Et que je suis sur la home page
Lorsque je navigue jusqu'à la page d'un bijoux
Et que je le supprime
Et que je reviens à la home page
Alors les totaux ont été mis à jour
Et le type de bijoux et pierre précieuse n'a pas changé
```

## Service Object

### 1 - Créer un service objet qui :

1. Supprime un bijou 
1. Met les statistiques à jour

Ce service doit être testé avec ```rspec``` 

```
spec/services/jewel_destroy.rb
```

### 2 - Il y a un service object qui :

1. Peut créer un bijoutier avec des bijoux
1. Est utilisé pour initialiser votre application (seed)

## Bonus

Ces choses ne sont pas attendues sur un temps court et sont donc facultatives.

1. Mettre toutes les fonctionnalités dans un espace admin et utiliser la gem ```devise``` pour l'authentification
1. Ecrire les features test avec la gem ```turnip``` 
