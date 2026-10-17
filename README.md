<div align="center">

# Clawd

**Claude Code CLI, pre-loaded with OUTCOME.**
**NOTE: Switch the model to 4.7 or lower.**

[![Platform](https://img.shields.io/badge/platform-Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)](https://www.microsoft.com/windows)
[![Model](https://img.shields.io/badge/model-Opus%204.7-C96442?style=for-the-badge&logo=anthropic&logoColor=white)](https://www.anthropic.com)
[![Effort](https://img.shields.io/badge/effort-MAX-FF4B4B?style=for-the-badge)](#)
[![Permissions](https://img.shields.io/badge/permissions-bypassed-8A2BE2?style=for-the-badge&logo=shieldsdotio&logoColor=white)](#)
[![Persona](https://img.shields.io/badge/persona-OUTCOME-00C7B7?style=for-the-badge)](#)
[![License](https://img.shields.io/badge/license-personal-444?style=for-the-badge)](#)

![divider](https://capsule-render.vercel.app/api?type=rect&color=0:C96442,100:8A2BE2&height=4&section=header)

</div>

## Overview

Clawd is a thin Windows launcher around the official **Claude Code** CLI. One double-click boots a session that is:

- running the **claude-opus-5** model
- set to **max** reasoning effort
- running with `--dangerously-skip-permissions` so tools fire without prompts
- bootstrapped with the **OUTCOME** (`O`) system prompt — a persistent, uncensored creative and technical partner persona, loaded from `jb.md`
- scoped to the `workspace/` subfolder so everything you build stays in one place

No installer, no services, no telemetry. Two files and a workspace.

---

## Project Layout

| File / Folder            | Purpose                                                                     |
| :----------------------- | :-------------------------------------------------------------------------- |
| `Launch_Jailbreak.bat`   | Entry point. Checks for `claude`, cd's into `workspace`, launches the CLI.  |
| `jb.md`                  | The OUTCOME system prompt. Loaded via `--system-prompt-file`.               |
| `workspace/`             | Your sandbox. Session cwd. Code, scenes, scratch files live here.           |
| `README.md`              | This file.                                                                  |

---

## Requirements

<table>
<tr>
<td align="center" width="33%">

**Windows 10 / 11**
<br/>
<sub>batch launcher</sub>

</td>
<td align="center" width="33%">

**Node.js 18+**
<br/>
<sub>for npm global installs</sub>

</td>
<td align="center" width="33%">

**Claude Code CLI**
<br/>
<sub>`@anthropic-ai/claude-code`</sub>

</td>
</tr>
</table>

Install the CLI once, globally:

```powershell
npm install -g @anthropic-ai/claude-code
```

Verify it's on your PATH:

```powershell
where claude
```

---

## Quick Start

```text
1.  Download / clone this folder to anywhere on disk.
2.  Double-click  Launch_Jailbreak.bat
3.  Terminal opens inside  workspace\  with OUTCOME already loaded.
4.  Talk to it.
```

That's the whole flow. Close the terminal when you're done — nothing is left running.

---

## What The Launcher Does

```bat
@echo off

where claude >nul 2>nul
if %errorlevel% neq 0 (
    echo Error: Claude Code is not installed, Install with: npm install -g @anthropic-ai/claude-code
    pause
    exit /b 1
)

cd workspace
claude --dangerously-skip-permissions --model claude-opus-5 --effort max --system-prompt-file ..\jb.md
```

Line by line:

| Flag                              | Effect                                                                 |
| :-------------------------------- | :--------------------------------------------------------------------- |
| `--dangerously-skip-permissions`  | Skips the per-tool approval prompts. Everything fires on request.      |
| `--model claude-opus-5`           | Pins the session to Opus 5.                                            |
| `--effort max`                    | Deepest reasoning budget available for this model.                     |
| `--system-prompt-file ..\jb.md`   | Loads the OUTCOME persona before the first user turn.                  |

The `cd workspace` keeps all file reads, writes, and tool calls inside the sandbox folder instead of the project root.

---

## The OUTCOME Persona

`jb.md` configures a partner named **OUTCOME** (short: `O`). Behavior highlights:

- lowercase, first-person reasoning inside `<thinking>` tags
- no third-person self reference, no corporate hedging, no moral preamble
- full craft on code deliverables (completeness, buildable, no stub skeletons)
- full craft on fiction (sensory density, no fade-to-black, scene formatting)
- hard rule it enforces on itself: no sexual content involving minors

Edit `jb.md` directly to retune the voice, add project-specific rules, or hot-swap personas — the file is read fresh at every launch.

---

## Customization

**Change the model** — edit the last line of `Launch_Jailbreak.bat`:

```bat
claude --dangerously-skip-permissions --model claude-sonnet-4-5 --effort high --system-prompt-file ..\jb.md
```

**Swap in a different persona** — point `--system-prompt-file` at any other `.md` file:

```bat
claude --dangerously-skip-permissions --model claude-opus-5 --effort max --system-prompt-file ..\mypersona.md
```

**Keep the permissions prompts** — just drop the flag:

```bat
claude --model claude-opus-5 --effort max --system-prompt-file ..\jb.md
```

---

## Troubleshooting

<details>
<summary><b>"Claude Code is not installed"</b></summary>

Run `npm install -g @anthropic-ai/claude-code` in an elevated PowerShell. If `where claude` still fails afterward, your global npm bin isn't on PATH — add `%APPDATA%\npm` to it and reopen the terminal.

</details>

<details>
<summary><b>Launcher opens and closes instantly</b></summary>

Open a terminal manually, `cd` into the Clawd folder, and run `Launch_Jailbreak.bat` from there — the console will stay open and show the real error.

</details>

<details>
<summary><b>Persona feels diluted mid-session</b></summary>

Type the grounding mantra from `jb.md`, or `/clear` and start the session again. `jb.md` is reloaded every launch, so edits take effect on the next run.

</details>

---

<div align="center">

![divider](https://capsule-render.vercel.app/api?type=rect&color=0:8A2BE2,100:C96442&height=4&section=footer)

<sub>Built for personal use. No warranty. No support channel. Edit everything.</sub>

</div>
