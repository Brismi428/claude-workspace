# Shell Aliases for Claude Code

Two shell aliases streamline launching Claude Code sessions with this workspace.

## Setup

Choose the section that matches your shell.

### Bash / Zsh (macOS, Linux)

Add these lines to your `~/.zshrc` (or `~/.bashrc`):

```bash
alias cs='claude "/prime"'
alias cr='claude --dangerously-skip-permissions "/prime"'
```

Then reload your shell: `source ~/.zshrc`

### PowerShell (Windows)

Add these lines to your PowerShell profile. To find your profile path, run `$PROFILE` in PowerShell, then open (or create) that file and add:

```powershell
function cs { claude "/prime" }
function cr { claude --dangerously-skip-permissions "/prime" }
```

Then reload: `. $PROFILE`

### Fish

Add these to `~/.config/fish/config.fish`:

```fish
alias cs 'claude "/prime"'
alias cr 'claude --dangerously-skip-permissions "/prime"'
```

Then reload: `source ~/.config/fish/config.fish`

---

## The Aliases

### `cs` -- Claude Safe

```bash
alias cs='claude "/prime"'
```

Launches Claude Code and immediately runs `/prime` to load workspace context. Claude will ask for permission before executing commands, reading sensitive files, or making changes.

**Use when:** Starting a new session where you want to review and approve each action.

### `cr` -- Claude Run

```bash
alias cr='claude --dangerously-skip-permissions "/prime"'
```

Launches Claude Code with permission prompts disabled, then runs `/prime`. Claude can execute commands and make changes without asking for approval.

**Use when:** You trust the task, want faster iteration, or are doing routine work where constant approvals slow you down.

## Why Both?

- **`cs`** gives you oversight -- good for unfamiliar tasks, sensitive operations, or when you want to learn what Claude is doing
- **`cr`** gives you speed -- good for familiar workflows where you trust Claude to operate autonomously