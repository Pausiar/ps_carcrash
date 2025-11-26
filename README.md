# ps_carcrash

Script simple de choque de vehículos para FiveM.

## Descripción

Este script simula efectos realistas cuando tu vehículo choca a alta velocidad:
- **Temblor de cámara** proporcional a la velocidad del impacto
- **Bloqueo temporal de controles** (acelerador, freno y dirección)
- **Sistema de cooldown** para evitar múltiples activaciones seguidas

## Instalación

1. Descarga o clona este repositorio
2. Coloca la carpeta `ps_carcrash` en tu directorio `resources`
3. Añade `ensure ps_carcrash` a tu `server.cfg`

## Configuración

Puedes modificar los siguientes valores en `client.lua`:

| Variable | Valor por defecto | Descripción |
|----------|-------------------|-------------|
| `minSpeed` | 30.0 | Velocidad mínima (km/h) para activar efectos |
| `maxSpeed` | 180.0 | Velocidad máxima considerada |
| `minShake` | 0.1 | Intensidad mínima del temblor de cámara |
| `maxShake` | 1.0 | Intensidad máxima del temblor de cámara |
| `minDisable` | 1000 | Tiempo mínimo de bloqueo de controles (ms) |
| `maxDisable` | 6000 | Tiempo máximo de bloqueo de controles (ms) |
| `cooldown` | 2500 | Tiempo entre choques consecutivos (ms) |

## Requisitos

- FiveM Server
- No requiere dependencias adicionales

## Autor

**Pausiar**

## Licencia

Este proyecto es de uso libre.
