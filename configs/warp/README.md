# Warp

Plain export of Warp's user settings file.

**Location**: `configs/warp`

Warp also has account-based Settings Sync (`account.is_settings_sync_enabled`
in the file itself), so this copy is mainly for bootstrapping a fresh machine
before signing into Warp, or as an offline backup outside of Warp's sync.

## Restore

Quit Warp, then:

```bash
cp configs/warp/settings.toml ~/.warp/settings.toml
```

Relaunch Warp to pick up the changes.

## Notable settings in here

- `appearance.themes.theme = "phenomenon"` with `system_theme = true` and
  `selected_system_themes` mapping dark → `phenomenon`, light → `light`.
- `appearance.text.enforce_minimum_contrast = "never"` — flip this in
  Settings → Appearance → Text if terminal UI elements (e.g. CLI input vs.
  output rows) feel low-contrast.
- `privacy.telemetry_enabled` / `crash_reporting_enabled` are both `false`.

Not included: `~/.warp/launch_configurations/` (machine-specific launch
configs) — add them here later if they turn out to be worth versioning.
