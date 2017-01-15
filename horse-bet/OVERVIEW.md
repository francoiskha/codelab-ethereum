# Architecture du projet
## Présentation  de l'environnement de travail
Nous allons développer notre premier smart contract au sein d'un environnement de développement propre à Ethereum.
Pour ce TP, vous allons utiliser  :

1. Un client/node blockchain

  Plusieurs clients, à choisir selon vos goûts, car ils ont tous les mêmes fonctionnalités. Les principaux :

  * Geth : client en GO (utilisé pour ce tp),
  * Eth : en C++,
  * Pyethapp : en python


2. Un framework de développement

  Trois principaux :

  * truffle
  * embarkJS
  * dapple

  Pour ce TP, nous utiliserons Truffle parce qu'il est conseillé pour les débutants.

  Truffle va simplifier plusieurs étapes de réalistion de D-app (Decentralised application) :
  - compilation intégrée de smart contract, linkink, déploiement et gestion des livrables,
  - test automatisé des contracts avec Mocha (framework de test JS) et Chai (framework BDD),
  - pipeline de build configurable et personnalisable,
  - déploiements scriptables et framework de gestion de migration,
  - gestion des blockchains de déploiement (public et privée),
  - console interactive de communication avec les contrats ...

## Arborescence du projet

L'arborescence de notre projet est constituée de :

- .truffle-solidity-loader : fichier .sol.js qui sont des artifacts crées par un framework appelé Ether Pudding. Ces fichiers sont crées à partir d'une ABI, d'un binaire ou d'une adresse de contrat et vont permettre de s'interfacer facilement avec le contrat en Javascript,

- build => répertoire de travail de truffle

- client => le répertoire contenant la partie WEB de notre D-app, qui contient donc le site en Angular 2

- contracts => dossier où sont stockés les smart-contracts de notre D-app en Solidity (.sol)

- migrations => les scripts de déploiement des smart-contract sur la blockchain

- test => le fichier contenant les sources js de test Mocha et Chai de nos smart-contract

- server : sources et configuration du serveur koa qui sert l'ihm

- tasks : tasks gulp servant à automatiser le déploiement de notre application

- truffle.js : le fichier de configuration de truffle

