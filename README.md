# ps_carcrash

Script simple de efectos de choque de vehículos para FiveM.

## Descripción

Este recurso añade efectos realistas cuando un vehículo choca a alta velocidad:
- Temblor de cámara escalado según la velocidad del impacto
- Bloqueo temporal de los controles del vehículo
- Sistema de cooldown para evitar choques consecutivos

## Instalación

1. Descarga o clona este repositorio
2. Coloca la carpeta `ps_carcrash` en tu directorio `resources`
3. Añade `ensure ps_carcrash` a tu `server.cfg`

## Configuración

Puedes ajustar los siguientes valores en `client.lua`:

| Variable | Descripción | Valor por defecto |
|----------|-------------|-------------------|
| `minSpeed` | Velocidad mínima para activar efectos (km/h) | 30.0 |
| `maxSpeed` | Velocidad máxima considerada (km/h) | 180.0 |
| `minShake` | Intensidad mínima de temblor de cámara | 0.1 |
| `maxShake` | Intensidad máxima de temblor de cámara | 1.0 |
| `minDisable` | Tiempo mínimo de bloqueo de controles (ms) | 1000 |
| `maxDisable` | Tiempo máximo de bloqueo de controles (ms) | 6000 |
| `cooldown` | Tiempo entre choques (ms) | 2500 |

## Dependencias

- Ninguna

## Autor

- **Pausiar**
