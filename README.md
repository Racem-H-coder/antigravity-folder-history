# 📁 Antigravity - Système d'Historique de Dossier & Mémoire Hiérarchique

Bienvenue ! Ce dossier contient tous les fichiers configurés pour permettre à Antigravity de **lire automatiquement l'historique** d'un projet, même si vous travaillez dans un **sous-dossier** profond.

---

## 📌 Pourquoi ce système ?

Par défaut, chaque nouvelle session d'un agent repart de zéro. Grâce à cette configuration :
1. **Mémoire automatique :** Dès que vous ouvrez un projet, Antigravity sait ce qui a déjà été fait lors des sessions précédentes.
2. **Remontée hiérarchique :** Si vous travaillez dans un sous-dossier (ex : `backend/api/controllers`), Antigravity remonte automatiquement l'arborescence pour trouver la racine de votre projet et lire son historique.
3. **Mise à jour en fin de tâche :** Antigravity met à jour le fichier `PROJECT_HISTORY.md` à la racine pour consigner le travail réalisé et les tâches restantes (`TODO`).

---

## 📂 Contenu de ce dossier

| Fichier / Dossier | Rôle |
| :--- | :--- |
| **`SKILL.md`** | La compétence Antigravity (`folder-history`) qui lui explique comment chercher l'historique et comment le mettre à jour. |
| **`AGENTS.md`** | La règle globale appliquée à toutes vos sessions pour qu'Antigravity vérifie systématiquement l'historique sans que vous ayez besoin de lui demander. |
| **`scripts/find_history.ps1`** | Le script PowerShell qui remonte les dossiers parents pour chercher les dépôts Git et fichiers d'historique. |
| **`resources/PROJECT_HISTORY_TEMPLATE.md`** | Le modèle prêt à l'emploi pour initialiser l'historique dans n'importe lequel de vos projets. |
| **`demo-projet/`** | Un projet d'exemple montrant un historique déjà renseigné et un sous-dossier `backend/api` pour tester. |

---

## 🧪 Comment tester immédiatement ?

1. Rendez-vous dans le dossier `demo-projet\backend\api\`.
2. Double-cliquez sur `tester_detection.bat`.
3. Vous verrez que le script remonte automatiquement depuis `backend\api\` jusqu'à `demo-projet\` et détecte immédiatement le fichier `PROJECT_HISTORY.md` !

---

## 🚀 État de l'installation dans Antigravity

Le système est **100 % installé et actif** dans votre environnement Antigravity :
- **Plugin global :** `C:\Users\medra\.gemini\config\plugins\folder-history\`
- **Compétence active :** `C:\Users\medra\.gemini\config\skills\folder-history\`
- **Règles globales actives :** `C:\Users\medra\.gemini\config\AGENTS.md` et `GEMINI.md`

Toutes vos futures sessions Antigravity bénéficient désormais automatiquement de la lecture d'historique et de la détection ascendante dans les sous-dossiers.

