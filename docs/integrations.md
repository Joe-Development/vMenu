# vMenu-ox Configuration Options

This is basic documentation for integrated convars for well integrations... duhh!

## Available Configuration Options

### `vmenu_keep_player_head_props`
**What it does:** Controls whether players keep their hats, glasses, and other head accessories when they get hit or pushed.

**How to use it:**
```
# Add this line to your server.cfg
setr vmenu_keep_player_head_props true
```

**Options:**
- `true` (Default): Players will keep their hats and glasses on when hit (GTA Online style)
- `false`: Players can lose their hats and glasses when hit (GTA V Single Player style)

---

### `vmenu_blackout_affect_vehicles`
**What it does:** Controls whether vehicle headlights work during blackouts (power outages).

**How to use it:**
```
# Add this line to your server.cfg
setr vmenu_blackout_affect_vehicles false
```

**Options:**
- `true`: Vehicle headlights will turn off during blackouts
- `false` (Default): Vehicle headlights will continue to work during blackouts

---

### `vmenu_outfitcodes`
**What it does:** Enables or disables the outfit code system, which requires oxmysql.

**How to use it:**
```
# Add this line to your server.cfg
setr vmenu_outfitcodes true
```

**Options:**
- `true`: Enables the outfit code system (requires oxmysql resource to be started)
- `false` (Default): Disables the outfit code system

**Requirements:**
- The oxmysql resource must be started for this feature to work

---

### `vmenu_vehiclecodes`
**What it does:** Enables or disables the vehicle code system, which requires oxmysql.

**How to use it:**
```
# Add this line to your server.cfg
setr vmenu_vehiclecodes true
```

**Options:**
- `true`: Enables the vehicle code system (requires oxmysql resource to be started)
- `false` (Default): Disables the vehicle code system

**Requirements:**
- The oxmysql resource must be started for this feature to work

