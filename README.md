# MazraaDrive

MazraaDrive est une application de gestion documentaire et de communication professionnelle.

## Fonctionnalités métier détaillées

### Utilisateurs (`AppUser`)
- Gestion des utilisateurs avec rôles, département, activation/désactivation
- Historique des accès et actions (audit logs)
- Gestion des droits d'accès (permissions)
- Suivi des requêtes documentaires, dossiers créés, documents uploadés
- Journalisation des requêtes d’IA (AIQueryLog)
- Gestion des dossiers de messagerie

### Gestion des rôles (`Role`)
- Création/modification de rôles
- Activation/désactivation
- Association avec les utilisateurs

### Départements (`Department`)
- Organisation des utilisateurs et dossiers par département
- Gestion des descriptions, dates de création et de mise à jour
- Suivi des demandes de documents

### Dossiers (`Folder`)
- Création de dossiers hiérarchiques (sous-dossiers)
- Association à un département et à un créateur
- Regroupement de documents

### Documents (`Document`)
- Gestion des métadonnées de documents (nom, type, taille, version)
- Stockage et validation des documents
- Association à un dossier et à un utilisateur uploader
- Suivi des demandes de documents liées

### Requêtes documentaires (`DocumentRequest`)
- Création et suivi des demandes de documents
- Association à un département et à un utilisateur demandeur
- Gestion des priorités, statuts, description, type
- Réponse par document, suivi des dates de demande et de réponse

### Messagerie interne (`Message`)
- Envoi et réception de messages entre utilisateurs internes
- Sujets, contenu, statut (lu/non lu), date d’envoi
- Organisation des messages dans des dossiers de messagerie

### Dossiers de messagerie (`MailFolder`)
- Création de dossiers pour organiser les messages
- Hiérarchie de dossiers (parent/enfants)
- Association à un utilisateur

### Audit des actions (`AuditLog`)
- Journalisation des actions réalisées par les utilisateurs
- Suivi de l’entité cible, identifiant, date
- Navigation vers l’utilisateur concerné

### Journalisation IA (`AIQueryLog`)
- Historique des requêtes d’IA faites par les utilisateurs
- Stockage de la question, résumé du résultat, date

---

## Technologies et architecture

- **ASP.NET Core** (API, sécurité, gestion des identités)
- **Entity Framework Core** (modélisation et persistance des données)
- **JWT Authentication**
- **Swagger** (documentation API)

- **PostgreSQL** (base de données)
- **AutoMapper** (mappage objet)
- **Gestion des rôles, permissions et audit**

---

## Pour tout voir
Les résultats ci-dessus sont limités.  
Pour explorer l’ensemble des fonctionnalités et entités, consultez la recherche de code sur GitHub :  
[Code Search MazraaDrive](https://github.com/search?q=repo%3AChedlyRebai%2FMazraaDrive&type=code)

---

> N’hésitez pas à compléter ou à demander des détails sur une entité métier spécifique !
