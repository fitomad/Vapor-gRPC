# Uso de gRPC con el servidor Vapor

Repositorio con el proyecto de ejemplo para la charla encuadrada en la **UI Talks de Globant** sobre el protocolo de comunicación gRPC con el servidor Vapor.

Como ejemplo vamos a desarrollar un servicio que devuelve una lista de podcasts almacenados en una base de datos Mongodb que hemos extraído de las [herramientas de marketing de Apple](https://rss.applemarketingtools.com).

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

Abrimos el archivo de definición de paquete de nuestro proyecto `Package.swift` y añadimos las siguientes dos líneas en sus secciones correspondientes

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

## Arrancando Vapor

Nos teneos que situar en el directorio raiz de nuestro proyecto de ejemplo y desde la Terminal ejecutar el siguiente comando

```bash
vapor run
```

Si queremos levantar el servicio en alguno de los entornos predefinidos usando su archivo de variables asociado podemos hacerlo usando las siguientes líneas de comando

Para el entorno de **pruebas** y su archivo asociado `.env.testing`
```bash
vapor run --env testing
```

Entorno de **desarrollo** usando el archivo `.env.development`
```bash
vapor run --env development
```

Y el entorno de **producción** con las variables definidas en `.env.production`
```bash
vapor run --env production
```