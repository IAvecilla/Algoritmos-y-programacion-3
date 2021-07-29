<h1> Algoritmos y Programación III de la Facultad de Ingeniería de la Universidad de Buenos Aires. </h1>

<h2 align="center">
  Curso Leveroni
</h2>

Desarrolladores: 
- Ignacio Avecilla - [@IAvecilla](https://github.com/IAvecilla)
- Stephanie Castillo - [@Stephaanie](https://github.com/Stephaaniie)

# Ejercicios 1º cuatrimestre 2021
Ejercicios para entregar no obligatorios propuestos por la catedra

#### 01. Factorio:
Modelo de extractores de carbón, hierro, cintas transportadoras y cajas. 
El objetivo es iniciar a aprender el entorno Smalltalk y plantear un modelo con tres escenarios: Extractor-Caja, Extractor-Cinta-Caja,Extractor-Extractor-Cinta-Cinta-Caja.

- **[Resolución](https://github.com/IAvecilla/Algoritmos-y-programacion-III/blob/main/01-Factorio/FactorioParte2%20-%20Entregable.st)**

---

#### 02. Codigo Repetido:
El objetivo del ejercicio era quitar codigo repetido de todo el modelo programado y tambien de sus tests.

- **[Resolución](https://github.com/IAvecilla/Algoritmos-y-programacion-III/blob/main/02-CodigoRepetido/CodigoRepetido-Entregable.st)**

---

#### 03. Numeros:
El objetivo del ejercicio era implementar la suma, la resta, la multiplicación y la división entre números enteros y fraccionarios sin utilizar if en todo el modelo y favoreciendo el polimorfismo de los mensajes de cada objeto, a su vez se crearon los tests para el correcto funcionamiento.
Al modelo terminado se le agregaron cosas para cumplir con la parte extra del ejercicio que tenia como utilidad comprobar cuando es favorable quitar if y cuando no.

- **[Resolución](https://github.com/IAvecilla/Algoritmos-y-programacion-III/blob/main/03-Numeros/Numeros-Parte2-Entregable.st)**

---

#### 04. Stack:
El objetivo del ejercicio era seguir practicando polimorfismo implementando un Stack (pila) que no tiene if. 
También implementamos el mensaje find de SentenceFinderByPrefix que dado un prefijo se encarga de devolver todas las oraciones almacenadas en el Stack que contengan dicho prefijo.

- **[Resolución](https://github.com/IAvecilla/Algoritmos-y-programacion-III/blob/main/04-Stack/Stack-Exercise-Entregable.st)**

#### 05. MarsRover:
El objetivo del ejercicio era comenzar a practicar TDD (Test Driven Development) implementando un MarsRover que procesa comandos para moverse hacia adelante y hacia atras
y cambiar su orientacion a un punto cardinal.

- **[Resolución](https://github.com/IAvecilla/Algoritmos-y-programacion-III/blob/main/05-MarsRover/MarsRover%20-%20Entregable.st)**

---

#### 07. ServiciosFinancieros:
El objetivo del ejercicio era seguir practicando TDD y comenzar a utilizar algunos patrones de diseño para la resolucion del ejercicio.
En este caso se utilizo el patron composite, ya que el modelo se trataba de cuentas bancarias y portfolios que tienen cuentas bancarias dentro u otros portfolios.
La idea era poder realizar transacciones entre estas entidades y transferencias entre las cuentas.

- **[Resolución](https://github.com/IAvecilla/Algoritmos-y-programacion-III/blob/main/07-ServiciosFinancieros/ServiciosFinancieros-Entregable.st)**

---

#### 08. ServiciosFinancieros2:
El objetivo del ejercicio era ampliar la funcionalidad de Servicios financieros y poder generar distintos reportes de las diferentes entidades.
En este caso se implemento con el patron de diseño Visitor y mediante TDD

- **[Resolución](https://github.com/IAvecilla/Algoritmos-y-programacion-III/blob/main/08-ServiciosFinancieros2/ServiciosFinancieros-Solucion.st)**

---

#### 09. MarsRover - El Regreso:
El objetivo del ejercicio era ampliar la funcionalidad de MarsRover para que modelar un sistema de loggeo en los cambios de posicion y orientacion del MarsRover 
y una ventana que se encarga de mostrar unicamente la posicion y orientacion actual, la idea del logger era implementarlo de manera tal que se pudiera loggear
unicamente los cambios de posicion, unicamente los cambios de orientacion o ambas al mismo tiempo.
Se utilizaron los patrones de diseño Observer y Proxy para el desarrollo del ejercicio.

- **[Resolución](https://github.com/IAvecilla/Algoritmos-y-programacion-III/blob/main/09-MarsRover-ElRegreso/MarsRoverRegreso-Solucion.st)**

