param(
    [string]$StartPath = (Get-Location).Path
)

$current = Get-Item $StartPath
$historyFilesFound = @()
$gitFound = $false
$gitDetails = $null

$knownHistoryNames = @(
    "PROJECT_HISTORY.md",
    "HISTORY.md",
    "CHANGELOG.md",
    "PROJECT_LOG.md",
    "DEV_NOTES.md",
    "TODO.md",
    ".agents/history.md",
    ".agent/history.md"
)

Write-Output "=== SCANNING FOR FOLDER & PARENT HISTORY ==="
Write-Output "Starting directory: $($current.FullName)"

while ($current -ne $null) {
    # Check for history files in $current
    foreach ($name in $knownHistoryNames) {
        $candidatePath = Join-Path $current.FullName $name
        if (Test-Path $candidatePath -PathType Leaf) {
            $historyFilesFound += [PSCustomObject]@{
                Directory = $current.FullName
                File = $candidatePath
                Name = $name
            }
        }
    }

    # Check for git repo
    $gitDir = Join-Path $current.FullName ".git"
    if ((Test-Path $gitDir) -and (-not $gitFound)) {
        $gitFound = $true
        try {
            Push-Location $current.FullName
            $branch = git branch --show-current 2>$null
            $recentCommits = git log -n 5 --pretty=format:"%h - %s (%cr)" 2>$null
            $status = git status --short 2>$null
            Pop-Location
            $gitDetails = [PSCustomObject]@{
                RepoRoot = $current.FullName
                Branch = $branch
                RecentCommits = $recentCommits
                Status = $status
            }
        } catch {
            Pop-Location
        }
    }

    $current = $current.Parent
}

Write-Output "`n--- 1. PROJECT / SESSION HISTORY FILES FOUND ---"
if ($historyFilesFound.Count -gt 0) {
    foreach ($item in $historyFilesFound) {
        Write-Output "Found: $($item.File)"
    }
} else {
    Write-Output "No dedicated history files found (e.g. PROJECT_HISTORY.md, CHANGELOG.md)."
}

Write-Output "`n--- 2. GIT CONTEXT & ACTIVITY ---"
if ($gitFound -and $gitDetails) {
    Write-Output "Git Root: $($gitDetails.RepoRoot)"
    Write-Output "Active Branch: $($gitDetails.Branch)"
    Write-Output "Recent Commits:"
    if ($gitDetails.RecentCommits) {
        $gitDetails.RecentCommits | ForEach-Object { Write-Output "  $_" }
    } else {
        Write-Output "  (No commits yet)"
    }
    Write-Output "Working Tree Status:"
    if ($gitDetails.Status) {
        $gitDetails.Status | ForEach-Object { Write-Output "  $_" }
    } else {
        Write-Output "  Clean (no uncommitted changes)"
    }
} else {
    Write-Output "No Git repository found in current or parent hierarchy."
}

