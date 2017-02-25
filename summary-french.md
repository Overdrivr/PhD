# Résumé Français - (< 4000 caractères)

La miniaturisation des circuits intégrés se poursuit de nos jours avec le développement de technologies toujours plus fines et denses.
Cette tendance est supportée par des raisons économiques, permettant une intégration de masse, des performances plus élevées et une réduction des coûts de production.
La réduction de taille des circuits s'accompagne aussi d'une augmentation de leur sensibilité électrique, de part un baisse des épaisseurs d'isolants et des tensions d'alimentations.

L'électronique automobile est aussi un acteur majeur dans la nouvelle tendance des véhicules autonomes.
Ce type d'application a besoin d'analyser des données et d'appliquer des actions sur le véhicule en temps réel.
Elles commandandent des éléments critiques tels que les freins ou la direction, et ont la très grande responsabilité mais aussi comme objectif premier d'assurer et d'améliorer la sécurité des usagers.
Il est donc vital de guarantir que ces modules électroniques pourront effectuer leurs tâches correctement malgré toutes les perturbations auxquelles ils seront exposées.

L'environement automobile est particulièrement sévère pour l'électronique.
Le démarrage du moteur par exemple génère de fortes perturbations sur le réseau d'alimentation, pouvant détruire des composants non protégés.
Une autre source importante d'agression électrique est la décharge électrique ou ESD (Electrostatic Discharge).
Elle consiste en une impulsion très brève et de très forte amplitude due à une différence de potentiel entre deux objets.
Ce type d'évènement est suffisamment violent pour pouvoir détruire des composants électroniques ou les perturber pendant leur fonctionnement.
Les recherches présentées ici se concentrent sur cet aspect de perturbation fonctionnelle.
A cause des ESD, des fonctions électroniques peuvent cesser temporairement d'être opérantes.
Des méthodes d'analyse et de prédiction sont requises au niveau-circuit intégré afin de détecter des points de faiblesses susceptibles de générer des fautes fonctionnelles pendant l'exposition à une décharge électrostatique.

Différentes approches ont été explorés dans ce but.
Une méthode hiérarchique de modélisation a été mise au point afin d'être capable de reproduire la forme d'onde jusqu'à l'entrée du circuit intégré.
Avec cette approche, chaque élément du système est modélisé individuellement puis son modèle ajouté au schéma complet.
Un cas d'étude réaliste de défaillance fonctionnelle d'un circuit intégré est analysé à l'aide d'outils de simulation.
Afin d'obtenir plus de données sur cette faute, une puce de test a été développée.
Elle contient des structures de surveillance, qui mesurent tensions et courant et surveillent une fonction sous test, directement au niveau silicium.
La dernière partie de ce travail de recherche est concentrée sur le développement de méthodes d'analyse dans le but d'identifer efficacement des fautes par simulation.
Les outils de simulation sont largement mis à contribution, et des prototypes ont été implémentés afin de démontrer le potentiel de ces approches.
La première méthode consiste à modéliser chaque bloc d'une fonction individuellement, en utilisant des modèles comportementaux, puis permet de connecter ensemble ces modèles afin de déterminer la robustesse de la fonction complète.
A terme, l'objectif est d'être capable d'identifier les points de faiblesses dans le design du circuit afin d'y apporter des corrections.
La deuxième méthode tente de construire un modèle équivalent dit boite-noire d'une fonction de haut-niveau d'un circuit intégré.
Le but est de développer un modèle permettant des simulations ESD en alimenté, pouvant être distribué aux équipementiers sans révéler les détails de conception internes.
La conclusion résume le travail effectué dans cette thèse et identifies les découvertes notables, puis fournit des pistes pour des travaux de recherche futurs.
