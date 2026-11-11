# Project History & Memory (Exemple de projet)

## 📌 Project Overview
- **Nom du projet :** Mon Application Démo
- **Objectif :** Démonstration de l'historique et de la mémoire de travail pour Antigravity.
- **Stack :** Node.js / React / TypeScript

---

## 🕒 Activity Log & Work History

### 2026-11-09 - Mise en place de l'API et de l'authentification
- **Auteur/Agent :** Antigravity
- **Travaux terminés :**
  - Création de l'architecture backend dans `/backend/api/`
  - Ajout des routes `/login` et `/register` avec tokens JWT
  - Validation des entrées utilisateurs avec Zod
- **Décisions d'architecture :**
  - Choix de JWT stateless pour simplifier le scaling.
  - Séparation des contrôleurs et des services dans `src/`.
- **Tâches restantes / À reprendre lors de la prochaine session :**
  - [ ] Connecter la base de données PostgreSQL
  - [ ] Écrire les tests unitaires pour le rafraîchissement des tokens
  - [ ] Configurer le middleware CORS

