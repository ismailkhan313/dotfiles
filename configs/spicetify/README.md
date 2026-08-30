# Spicetify

Stock Spicetify with **no theme** and a single extension: **Adblockify**. Nothing cosmetic is customized — the only reason this is installed is ad removal.

- Platform: macOS (Apple Silicon)
- Spicetify: v2.44.0
- Spotify: desktop client from spotify.com — **not** the Mac App Store build, which is sandboxed and cannot be patched
- Last verified: 2026-08-30

---

## Paths

| What | Where |
|---|---|
| CLI + bundled defaults | `~/.spicetify` |
| User config | `~/.config/spicetify` |
| Config file | `~/.config/spicetify/config-xpui.ini` |
| User extensions | `~/.config/spicetify/Extensions` |
| Pristine Spotify backup | `~/.config/spicetify/Backup` |
| Spotify app resources | `/Applications/Spotify.app/Contents/Resources` |
| Spotify prefs | `~/Library/Application Support/Spotify/prefs` |

The installer appends the PATH line to `~/.config/zsh/.zshrc`, not `~/.zshrc` — worth remembering if the shell config ever gets reorganized.

Nothing here is symlinked from this repo. Spicetify rewrites `config-xpui.ini` in place on every `spicetify config` call, so it's documented rather than version-controlled — the commands below regenerate it exactly.

---

## Install from scratch

Order matters. Spotify must exist and have been run at least once before Spicetify touches anything, or the backup captures nothing.

**1. Install Spotify first.** Download from spotify.com, drag to `/Applications`, launch, log in, and leave it open ~60 seconds so it writes `prefs`.

**2. Install the Spicetify CLI.**

```sh
curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
```

It offers to install Marketplace — decline (`n`). See [Marketplace](#marketplace-optional) below for why.

Open a new shell, or `source ~/.config/zsh/.zshrc`.

**3. Back up and patch.**

```sh
spicetify backup apply
```

This snapshots the untouched Spotify files into `~/.config/spicetify/Backup` before patching. That backup is the single-command undo for everything Spicetify does — if it's missing, `spicetify restore` has nothing to restore from.

**4. Install Adblockify.**

```sh
curl -o ~/.config/spicetify/Extensions/adblock.js \
  https://raw.githubusercontent.com/rxri/spicetify-extensions/main/adblock/adblock.js
spicetify config extensions adblock.js
spicetify apply
```

Spotify restarts patched.

---

## Config

Everything is stock. The two blank values are deliberate — no theme, no color scheme:

```
color_scheme
current_theme
```

The rest as `spicetify config` reports it:

| Key | Value | Note |
|---|---|---|
| `check_spicetify_update` | `1` | default |
| `always_enable_devtools` | `0` | default |
| `inject_theme_js` | `1` | default; inert with no theme |
| `replace_colors` | `1` | default; inert with no color scheme |
| `inject_css` | `1` | default |
| `overwrite_assets` | `0` | default |
| `spotify_launch_flags` | *(empty)* | default |
| `extensions` | `adblock.js` | the only intentional change |
| `custom_apps` | *(empty)* | `marketplace` if installed |

Preprocesses and AdditionalFeatures are untouched defaults (`disable_ui_logging 1`, `remove_rtl_rule 1`, `expose_apis 1`, `disable_sentry 1`, `sidebar_config 0`, `home_config 1`, `experimental_features 1`).

Verify a fresh install with `spicetify config` — `extensions` should read `adblock.js` and `Backup version` should show a Spotify version string, not blank. **A blank `Backup version` means nothing was ever backed up**, which means Spotify isn't actually patched.

---

## Adblockify

Source: [rxri/spicetify-extensions](https://github.com/rxri/spicetify-extensions/tree/main/adblock). Distributed on the Spicetify Marketplace as "Adblockify"; the file is `adblock.js`.

**Does:** skips audio ads between tracks, removes ad banners and upsell popups, re-enables queue editing and free seeking.

**Doesn't:** native lyrics, downloads, "Very High" quality, or Jams. Those are server-side entitlements tied to the account, not client-side UI the extension can unlock.

**There is no rules file.** Unlike a browser ad blocker, Adblockify ships no user-editable filter list, no allowlist, and no settings panel — it's a single JS file that patches Spotify's client at runtime. Configuration is binary: the file is in `extensions` or it isn't. Nothing to tune, nothing to sync in dotfiles beyond the one config line.

Note this violates Spotify's terms of service, and accounts do occasionally get actioned for it.

---

## Maintenance

**Spotify auto-updates wipe the patch.** The UI reverts to stock and ads come back. Fix:

```sh
spicetify backup apply
```

If that misbehaves after a major Spotify version bump, take a fresh backup against the new version:

```sh
spicetify restore backup apply
```

**Adblockify goes stale.** Spotify changes things server-side, ads start slipping through, rxri patches upstream. Most "Adblockify stopped working" reports are a stale copy or a Spotify update that silently un-patched the client — check the patch first, then update the extension:

```sh
curl -o ~/.config/spicetify/Extensions/adblock.js \
  https://raw.githubusercontent.com/rxri/spicetify-extensions/main/adblock/adblock.js
spicetify apply
```

---

## Reset to stock

Restore Spotify, then set the config aside and regenerate defaults:

```sh
spicetify restore
mv ~/.config/spicetify ~/.config/spicetify.old
spicetify
```

`restore` must run **first** — moving the config folder takes `Backup/` with it, and after that Spotify stays patched with no way back short of reinstalling it. If `restore` errors with "not a valid path", nothing was patched and it's safe to continue.

Confirm with `spicetify config`: theme, color scheme, extensions, and custom apps all empty. Then `rm -rf ~/.config/spicetify.old`.

**Full uninstall** additionally: `rm -rf ~/.spicetify` and remove the Spicetify PATH line from `~/.config/zsh/.zshrc`.

---

## Marketplace (optional)

```sh
curl -fsSL https://raw.githubusercontent.com/spicetify/marketplace/main/resources/install.sh | sh
```

Installs a GUI browser for themes and extensions into Spotify's sidebar and runs `backup apply` itself.

Not part of this setup. It's a point-and-click installer for a machine that only ever installs one extension, its search is unreliable ([known issue](https://github.com/spicetify/marketplace/issues/1099) — queries return one result or none), and installing through a GUI isn't reproducible from a dotfiles repo. The `curl` in step 4 does the same job in a form that can be scripted.

It also lands in `custom_apps` and `CustomApps/marketplace`, so a config reset silently removes it — reinstall with the command above if it disappears.

---

## Troubleshooting

**`/Applications/Spotify.app/Contents/Resources is not a valid path`** — Spotify isn't installed there. Install it, or point Spicetify at the real location:

```sh
spicetify config spotify_path "/path/to/Spotify.app/Contents/Resources"
```

Also the expected error when running Spicetify commands before Spotify exists.

**Permission errors on the app bundle:**

```sh
sudo chmod -R a+wr /Applications/Spotify.app
spicetify backup apply
```

**Ads returned after an update** — the patch, not the extension. Run `spicetify backup apply` before touching anything else.

**Marketplace missing from the sidebar** — a config reset removed it. Rerun the Marketplace installer.