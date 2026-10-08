# ==============================================================================
# Antigravity Global Rules Auto-Setup Script for Windows (PowerShell)
# ==============================================================================
$ErrorActionPreference = "Stop"

$GeminiDir = Join-Path $HOME ".gemini"
$ConfigDir = Join-Path $GeminiDir "config"
$TargetFile = Join-Path $ConfigDir "GEMINI.md"
$LinkFile = Join-Path $GeminiDir "GEMINI.md"

Write-Host "[+] Erstelle Gemini-Konfigurationsordner: $ConfigDir" -ForegroundColor Cyan
New-Item -ItemType Directory -Force -Path $ConfigDir | Out-Null

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$SourceFile = Join-Path $ScriptDir "GEMINI.md"

if (Test-Path $SourceFile) {
    Write-Host "[+] Kopiere GEMINI.md aus Repository nach $TargetFile..." -ForegroundColor Cyan
    Copy-Item -Path $SourceFile -Destination $TargetFile -Force
} else {
    Write-Error "GEMINI.md wurde im Skriptverzeichnis nicht gefunden!"
    exit 1
}

Write-Host "[+] Richte Verknüpfung ein: $LinkFile -> $TargetFile" -ForegroundColor Cyan
if (Test-Path $LinkFile) {
    Remove-Item -Path $LinkFile -Force
}

try {
    # Versuche symbolischen Link (erfordert Entwicklermodus oder Admin-Rechte)
    New-Item -ItemType SymbolicLink -Path $LinkFile -Target $TargetFile -Force | Out-Null
    Write-Host "[✓] Symlink erfolgreich erstellt." -ForegroundColor Green
} catch {
    # Fallback auf Kopie, falls Windows-Rechte Symlinks blockieren
    Copy-Item -Path $TargetFile -Destination $LinkFile -Force
    Write-Host "[!] Symlink erfordert Entwicklermodus – stattdessen Datei-Kopie angelegt." -ForegroundColor Yellow
}

Write-Host "[✓] Antigravity-Regeln erfolgreich auf Windows eingerichtet!" -ForegroundColor Green
