# Vapor-gRPC
Uso del protocolo de comunicación gRPC con el servidor Vapor

Generar código Swift a partir del archivo `proto`

```bash
protoc --swift_out=Sources/App/Models/ --grpc-swift_out=Sources/App/Controllers/ podcasts.proto
```
