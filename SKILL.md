---
name: folder-history
description: >-
  Inspects, loads, and maintains project history, past decisions, git activity,
  and context whenever working in a directory or sub-folder where previous work was done.
  Use when starting work in a folder, opening a sub-folder of an existing project,
  or resuming previous tasks.
---

# Folder & Project History Skill

This skill allows Antigravity to retrieve, understand, and update the context and history of any directory—including nested subfolders inside an existing project.

---

## 🎯 When to Use

- When starting a task in a project or folder to check what was done previously.
- When working in a sub-folder (e.g. `client/`, `backend/`, `packages/module-a`) and needing context from the parent project root.
- When resuming work after a previous session.
- When concluding a task to record what was accomplished for future sessions.

---

## 🔍 Step 1: Scan Folder and Ancestor Directories

When you begin working in a directory, find where previous work and git roots exist:

1. Run the scanning script:
   ```powershell
   powershell -ExecutionPolicy Bypass -File "C:\Users\medra\.gemini\config\skills\folder-history\scripts\find_history.ps1" -StartPath .
   ```
   *Or inspect manually:*
   - Check the current folder for `PROJECT_HISTORY.md`, `HISTORY.md`, `CHANGELOG.md`, or `.agents/history.md`.
   - If not found or if inside a subfolder, walk up to parent directories until the root (or `.git` root) to check for these files.

2. Read any discovered history files using `read_file`.

3. If a Git repository is detected in the folder or parent folder, inspect recent activity:
   ```powershell
   git status --short
   git log -n 5 --pretty=format:"%h - %an, %ar : %s"
   ```

---

## 📖 Step 2: Leverage the Discovered Context

1. **Identify the Project Root & Hierarchy:**
   - Determine if the current directory is the root or a sub-component of a larger project.
   - Align package/module work with parent project architecture and conventions.

2. **Acknowledge Past Work:**
   - Mention key context to the user briefly (e.g. *"J'ai analysé l'historique du projet : nous reprenons après [dernier commit/dernière tâche enregistrée]..."*).

3. **Continue Pending Tasks:**
   - Check if the history notes contain uncompleted checklist items (`- [ ]`) or known issues.

---

## 📝 Step 3: Record Work Before Ending Session

To ensure future sessions (and future subfolder navigations) remember the work done:

1. If `PROJECT_HISTORY.md` exists at the project root:
   - Append a new entry under `## 🕒 Activity Log & Work History` detailing:
     - Today's date
     - Summary of changes made (files modified/added)
     - Key architectural decisions
     - Any pending tasks or notes for the next session.

2. If `PROJECT_HISTORY.md` does not exist yet and significant work was performed:
   - Create `PROJECT_HISTORY.md` at the project root using the template:
     [PROJECT_HISTORY_TEMPLATE.md](./resources/PROJECT_HISTORY_TEMPLATE.md).

