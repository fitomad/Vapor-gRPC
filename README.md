# Vapor & gRPC
Repositorio con el proyecto de ejemplo para la charla de Globant sonre el protocolo de comunicación gRPC con el servidor Vapor.

En este caso vamos a desarrollar un servicio que devuelve una lista de podcasts almacenados en una base de datos Mongodb que hemos extraído del servicio de marketing de Apple.

## Requisitos

Necesitamos tener instalado en nuestro equipo el compilador de Protocol Buffer y el plug-in para poder generar código en lenguage Swift.

Para ello usaremos el gestor de paquetes para macOS Homebrew.

Ahora vamos a instalar el compilador

```bash
brew install swift-protobuf
```

Para comprobar que el paquete se ha instalado correctamente ejecutamos la siguiente instrucción en la Terminal

```bash
protoc --version
```

Y por último instalamos el plug-in para generar código Swift

```bash
brew install grpc-swift
```

## Añadiendo soporte gRPC al servidor Vapor

```swift
.package(url: "https://github.com/grpc/grpc-swift.git", from: "1.0.0")
```

```swift
.product(name: "GRPC", package: "grpc-swift")
```

## Generar código Swift a partir del archivo de definción Proto

Abrimos una terminal en nuestro equipo y nos situamos en la carpeta raiz de nuestro proyecto Vapor y ejecutamos el siguiente comando.

```bash
protoc --swift_out=Sources/App/Models/ --grpc-swift_out=Sources/App/Controllers/ podcasts.proto
```

Lo que estamos indicando es que queremos generar los modelos de datos en la carpeta `Sources/App/Models/` y los servicios en la ruta `Sources/App/Controllers/`

## Instalando Mongodb sobre Docker

### Docker

La instancia de la base de datos NoSQL Mongodb la tendremos disponible con una imagen Docker, así que lo primero que tenemos que hacer es instalar la versión Desktop para macOS de Docker que se puede conseguir desde su [página web](https://www.docker.com).

### Mongodb

Una vez instalado el cliente pasamos a instalar la imagen de Mongodb, así que abrimos un Terminal y ejecutamos el comando indicando abajo

```bash
docker run --name mongodb -d mongo
```

Y listo, ahora podemos arrancar la instanacia de Mongodb desde el cliente Docker cuando lo necesitemos.