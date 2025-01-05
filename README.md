# Weathy

**Weathy** es una aplicación iOS que permite consultar las condiciones climáticas de diferentes zonas por días. La app se conecta a un servicio de pronóstico del clima proporcionado por el [WeatherAPI](https://api.weatherapi.com/) y muestra la información de manera interactiva.

## Características

- Consulta de clima por ubicación.
- Visualización del clima para los próximos días.
- Soporte para integración de interfaces **SwiftUI** y **UIKit**.
- Implementación de arquitecturas **VIPER** y **MVVM** para manejar la lógica de la app.
- Pruebas unitarias y pruebas de interfaz con **Snapshots**.

## Arquitectura y Patrones de Diseño

La aplicación está construida de manera modular, permitiendo una fácil extensión y mantenimiento. Los siguientes patrones de diseño y arquitecturas se han implementado en el proyecto:

- **VIPER** (View, Interactor, Presenter, Entity, Router) para una separación clara de responsabilidades.
- **MVVM** (Model-View-ViewModel) para una mejor gestión de la interfaz de usuario y la lógica de negocio.
- **Observer** para implementar la comunicación entre los diferentes módulos de la aplicación.
- **Singleton** para manejar instancias únicas en toda la aplicación, como la configuración de red.
- **Repository** para abstraer el acceso a los datos y facilitar el manejo de la fuente de información (API).
- **Facade** para simplificar la interacción con la API y los servicios internos.
- **Adapter** para permitir que las diferentes capas del proyecto interactúen sin acoplarse demasiado entre sí.
- **Strategy** para permitir la implementación de diferentes estrategias de carga y presentación de datos.
- **Dependency Injection** para la inyección de dependencias de manera flexible y para facilitar el testing.

## Dependencias

La gestión de dependencias se realiza con **CocoaPods**. A continuación, se describen las dependencias principales utilizadas en el proyecto:

- **Alamofire**: Para realizar las peticiones HTTP.
- **SnapKit**: Para la creación de interfaces con AutoLayout de manera declarativa.
- **XCTest** y **SnapshotTesting**: Para pruebas unitarias y de UI (Snapshots).

## Instalación

Para ejecutar la app en tu entorno local, sigue estos pasos:

1. **Clona este repositorio** en tu máquina:

    ```bash
    git clone https://github.com/tu-usuario/weathy.git
    ```

2. **Navega a la carpeta del proyecto**:

    ```bash
    cd weathy
    ```

3. **Instala las dependencias de CocoaPods**:

    ```bash
    pod install
    ```

4. **Abre el proyecto utilizando el archivo `.xcworkspace`**:

    ```bash
    open Weathy.xcworkspace
    ```

5. **Corre la aplicación** en tu simulador o dispositivo.

## Pruebas

Se implementaron pruebas unitarias y de UI para asegurar el funcionamiento correcto de la aplicación. Sin embargo, las pruebas funcionales con **Quick** y **Nimble** no se completaron por limitaciones de tiempo.

Para ejecutar las pruebas, abre el proyecto y corre las pruebas con **XCTest** en Xcode.

## Convivencia entre SwiftUI y UIKit

En este proyecto, se ha demostrado cómo **SwiftUI** y **UIKit** pueden convivir de manera eficiente dentro de una misma aplicación, utilizando **UIViewControllerRepresentable** para integrar componentes de SwiftUI en vistas de UIKit y viceversa.
