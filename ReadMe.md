# Serve Rails assets with Nginx

## How to deploy

# Option one
```bash
$> cd precompile_on_the_host
$> make config
$> make deploy
$> make stop
```

# Option two
```bash
$> cd precompile_at_runtime
$> make deploy
$> make stop
```

# Option three
```bash
$> cd precompile_during_docker_build
$> make deploy
$> make stop
```
