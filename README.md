# Test technique
## Rendu
Faite un repos git (gihub public ou privée et communiqué nous le lien)

## but 

Évalué la capacité d'un candidat à faire une application structuré et testée.

### notions importantes

Les deux notions les plus importante de ce test sont :

1. Les test d'intégration (ou features test)
1. Les services object (couche ruby on rails supplémentaire)
1. Les nested routes (namespace ou module)

Documentation

[feature test](https://www.simplermachines.com/rspec-feature-tests/)

[rspec capybara](https://www.codewithjason.com/rails-integration-tests-rspec-capybara/)

[service objet](https://www.toptal.com/ruby-on-rails/rails-service-objects-tutorial)

[nested routes](https://guides.rubyonrails.org/routing.html)

**Note : pas besoin de faire de css, ni de système d'authentification.**

## Thème de l'application

**Bienvenue à  Bijouxville**

Ici les model et fonctionnalité porte sur le thème de le bijouterie.

Pour faire simple dans l'application il y a :
il y a des bijoutier qui ont des bijoux qui ont des pierres précieuse.

### Description des model 

La base imposée est
Vous pouvez ajouter autant d'attributs et de model que nécessaire. 

```
Stone name price
Material name base_cost
Jeweler name
Jewel name

JewelStats 
```

Le prix d'un bijou et égale au coût de base d'un matériaux plus le prix de chaque pierre

Un bijou peu avoir de 0 à n pierre.



## Questions

### Feature test

implémentez les fonctionnalités suivante


#### Sénario 1 Une home page basique

```cucumber
Étant donnée des bijoutiers avec des bijoux
Lorsque je suis sur la home page 
Alors je vois le nombre de bijoutier
Et je vois les type de bijoux (or, argent, fer...)
Et je vois les type de pierre précieuses (ruby, saphir, émeraude...)
```

Note : il doit y avoir un lien vers  les ressources :

1. les bijoutier
1. les type de bijoux
1. les type de pierre précieuses

#### Sénario 2 statistique des finances

```cucumber
Étant donnée des bijoutiers avec des bijoux
Lorsque je suis sur la home page 
Alors je vois la somme total de bijoux ville (tout les bijoux de tout les bijoutier).
Et je vois la somme total par type et par pierre
```

#### Sénario 3 suppression de bijou
```cucumber
Étant donnée des bijoutiers avec des bijoux
Et que je suis sur la home page
Lorsque je navigue jusqu'à la page d'un bijoux
Et que je le supprime
Et que je reviens à la home page
Alors les totaux ont été recalculé
Et le type de bijoux et pierre précieuse n'a pas bougé
```

## Service Object


### 1 créez un service objet qui :

1. supprime un bijou 
1. met les statistique à jour

ce service doit être testé avec ```rspec``` 

```
spec/services/jewel_destroy.rb
```

### 2 Il y a un service object qui.

qui peut créer un bijoutier avec des bijoux
utilisé pour initialisé votre application (seed)

## Bonus

Ces choses ne sont pas attendu sur un temps court

mettre toutes les fonctionnalité dans un espace admin et utilisé la gem ```devise``` pour l'authentification

Ecrire les features test avec la gem ```turnip``` 
