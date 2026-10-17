@echo off

where claude >nul 2>nul
if %errorlevel% neq 0 (
    echo Error: Claude Code is not installed, Install with: npm install -g @anthropic-ai/claude-code
    pause
    exit /b 1
)

cd workspace
claude --dangerously-skip-permissions --model claude-opus-5 --effort max --system-prompt-file ..\jb.md
