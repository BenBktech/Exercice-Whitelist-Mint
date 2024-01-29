# Exercice : Mint que pour les whitelistés avec Arbres de Merkle

## Introduction

Les arbres de Merkle, souvent utilisés dans la technologie blockchain, sont une structure de données qui permet une vérification et une validation efficaces et sécurisées des contenus de grands ensembles de données. Chaque feuille de l'arbre représente un bloc de données, et chaque noeud non-feuille est une empreinte cryptographique des noeuds enfants. Cela crée une empreinte unique pour l'ensemble de l'arbre, permettant de vérifier rapidement si un ensemble de données fait partie de l'arbre en comparant seulement un petit nombre d'empreintes.

## Exercice

Vous devez utiliser le contrat MerkleProof de OpenZeppelin afin d'autoriser le mint de NFT uniquement pour des whitelistés. L'avantage principal c'est d'économiser énormément en frais de gas par rapport aux mappings !

### Backend : Contrat

Vous devez tout d'abord compléter le contrat. (voir les "//!\ A COMPLETER /!\" dans le contrat).

### Backend : Fichier de déploiement

Le fichier de déploiement n'a pas besoin d'être complété. Il vous permettra de mieux comprendre ce qu'il y a derrière les arbres de Merkle.

### Frontend : Mint.jsx

Enfin, il faudra compléter le fichier "Mint.jsx" (voir les "//!\ A COMPLETER /!\" dans ce fichier).

### Astuces

Ce n'est pas si compliqué au final, il faut juste avoir le délic. 
Globalement, à partir d'une liste d'adresse, on va former un arbre. Grâce à cet arbre, on peut récupérer la racine, mais aussi une preuve. Essayez d'abord de comprendre l'aspect global, savoir exactement comment fonctionne l'algorithme au niveau des arbres de Merkle n'est pas indispensable.

