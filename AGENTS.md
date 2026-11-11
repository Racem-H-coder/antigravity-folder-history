# Global Agent Guidelines: Folder & History Awareness

When working on any task or opening a project/folder:
1. **History & Context Discovery:**
   - Check if the current directory or any parent directory contains past work, project notes, or a Git repository.
   - Look for `PROJECT_HISTORY.md`, `CHANGELOG.md`, `HISTORY.md`, or `.agents/history.md`.
   - If operating within a sub-folder (e.g., `frontend/`, `api/`, `packages/*`), traverse up to the root project to understand global architecture and context.
   - Activate the `folder-history` skill or run `powershell -ExecutionPolicy Bypass -File "C:\Users\medra\.gemini\config\skills\folder-history\scripts\find_history.ps1" -StartPath .` whenever needed.
2. **Session Continuity & Memory:**
   - Acknowledge previous work when resuming a project.
   - After completing significant work or tasks, update or create `PROJECT_HISTORY.md` at the project root with the date, modifications done, architectural choices, and pending items.

