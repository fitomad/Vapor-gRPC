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

## Instalando Mongodb sobre Docker

### Docker

La instancia de la base de datos NoSQL Mongodb la tendremos disponible con una imagen Docker, así que lo primero que tenemos que hacer es instalar la versión Desktop para macOS de Docker que se puede conseguir desde su [página web](https://www.docker.com).

### Mongodb

Una vez instalado el cliente pasamos a instalar la imagen de Mongodb, así que abrimos un Terminal y ejecutamos el comando indicando abajo

```bash
docker run --name mongodb -d mongo
```

Y listo, ahora podemos arrancar la instanacia de Mongodb desde el cliente Docker cuando lo necesitemos.

### Cargando los datos necesarias para la prueba

En la carpeta `...` del respositorio podéis encontrar tres archivos JSON con lo que poblaremos nuestra base de datos. Para ello usaremos la herramienta Compass, un entorno gráfico para la gestión de instancias MongoDB.

#### Crear la base de datos

Lo primero que necesitamos es crear una nueva base de datos MongoDB, así que inicamos Compass y nos conectamos a nuestra instancia de MongoDB que tengo instalada en Docker. La cadena de conexión es

```
mongodb://localhost:27017
```

Tras conectarnos seleccionamos la pestaña **Databases** y pulsamos en el botón **Create Database**

En la ventana modal que se nos abre rellenamos el formulario con los siguientes datos

* Database Name: `podcasts`
* Collection Name: `PodcastCollection`

Ahora pulsamos en el botón **Create Database**. Ya tenemos lista nuestra base de datos.

#### Cargando los datos

Buscamos nuestra base de datos en la lista de bases de datos disponibles y pulsamos sobre su nombre, lo que nos llevará a la pantalla donde veremos las colección disponibles para esta base de datos, donde veremos la colección que acabamos de crear.

Pulsamos sobre el nombre de la colección (`PodcastCollection`) para ver los detalles y datos contenidos en esta colección.

Buscamos el botón con el título **Add data** y lo pulsamos. En el menú desplegable seleccionamos la opción **Import file**

En la ventana emergente que nos aparece seleccionamos el archivo JSON con los datos de podcasts y en Select Input Type File marcamos la opción JSON.

Pulsamos sobre el botón **Import** y listo, ya tenemos cargado nuestro primero archivo de datos de podcasts.

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

## Enlaces de interés

Si queréis leer más acerca de gRPC, Protocol Buffers, Vapor y las herramientas que hemos usando durante la charla os animamos a visitar estos enlaces

### gRPC

* [Sitio web oficial](https://grpc.io/)
* Como Netflix usa gRPC (Parte [I](https://netflixtechblog.com/practical-api-design-at-netflix-part-1-using-protobuf-fieldmask-35cfdc606518) y [II](https://netflixtechblog.com/practical-api-design-at-netflix-part-2-protobuf-fieldmask-for-mutation-operations-2e75e1d230e4))

### Protocol Buffers

* [Version 3 language specification](https://developers.google.com/protocol-buffers/docs/reference/proto3-spec)
* [Scalar Types](https://developers.google.com/protocol-buffers/docs/proto3#scalar)
* [Well-Known Type](https://developers.google.com/protocol-buffers/docs/reference/google.protobuf)

### Vapor

* [Sitio oficial](https://vapor.codes/)
* [Documentación](https://docs.vapor.codes/)
* [Artículo](https://medium.com/@FitoMAD/vapor-4-websockets-60a8e943a025) sobre WebSockets en Vapor con [repositorio]() asociado

### Herramientas

* [Homebrew](https://brew.sh/index_es)
* [Docker](https://www.docker.com/)
* [MongoDB](https://www.mongodb.com/try/download/community) y su [image](https://www.mongodb.com/compatibility/docker) Docker
* Mongo GUI [Compass](https://www.mongodb.com/products/compass) 
* [Postman](https://www.postman.com/downloads/)