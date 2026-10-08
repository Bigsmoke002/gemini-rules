# Gemini & Antigravity Global Environment Rules

Zentrale, geräteübergreifende Verhaltens- und Sicherheitsregeln für den **Google Antigravity / Gemini Coder** Agenten.

---

## 📋 Enthaltene Regeln

### 1. Agent-Verhalten & Autonomie
* **A. Read-Only / Inspektions-Modus:** Bei Projekten und Servern (SSH/Remote) darf der Agent ohne einmalige, explizite Erlaubnis keine Dateien ändern oder manipulierende Befehle ausführen.
* **B. Bug- & Error-Behebung nur nach Einzelerlaubnis:** Gefundene Fehler dürfen erst nach Rückfrage und Freigabe behoben werden.
* **C. Ausführliche Abschluss-Dokumentation:** Am Ende jeder Aufgabe muss der Agent detailliert erklären, **was** gemacht wurde und **warum**.
* **D. Persistentes Gedächtnis ("Gehirn"):** Aktive Pflege und regelmäßiger Abgleich einer Wissensdatenbank (`memory_store` / SQLite) gegen Vergessen und Halluzinationen.
* **E. Eskalation bei Stagnation:** Nach mehreren erfolglosen Versuchen muss Wissen aus verifizierten Quellen recherchiert werden.
* **F. Pflicht zur aktuellen Recherche:** Immer neueste offizielle Dokumentationen, Business-Standards und Nischen-Quellen hinzuziehen.
* **G. Zeitanker-Regel:** Das aktuelle Datum/Jahr muss bei jeder Recherche berücksichtigt werden, um veraltete Antworten zu verhindern.
* **H. Auto-Provisioning:** Erkennt der Agent ein neues System ohne Regeln, rollt er diese automatisch global (`~/.gemini/config/GEMINI.md`) aus.

### 2. Android Device Rules (Google Pixel 9 Pro XL)
* Spezifische Richtlinien für Root (`init_boot`), AdGuard-Proxy und OTA-Update-Sicherheit.

---

## 🚀 Installation auf einem neuen Gerät

### Linux & macOS

#### Option A: Klonen via SSH (für private Repositories)
```bash
git clone git@github.com:Bigsmoke002/gemini-rules.git ~/.gemini-rules
~/.gemini-rules/setup.sh
```

#### Option B: 1-Befehl-Setup (falls Repository öffentlich ist)
```bash
curl -fsSL https://raw.githubusercontent.com/Bigsmoke002/gemini-rules/main/setup.sh | bash
```

---

### Windows (PowerShell)
Erstelle das Konfigurationsverzeichnis und kopiere die `GEMINI.md`:
```powershell
New-Item -ItemType Directory -Force -Path "$HOME\.gemini\config"
# GEMINI.md in $HOME\.gemini\config\GEMINI.md ablegen
```

---

## 📂 Struktur

```text
.
├── GEMINI.md     # Die vollständigen globalen Agenten-Regeln
├── AGENTS.md     # Symlink auf GEMINI.md für universelle Tool-Kompatibilität
├── setup.sh      # Automatisches Setup-Skript für Linux/macOS
└── README.md     # Diese Dokumentation
```