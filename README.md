# Algoritmos-y-programacion-III

FACTORIO.

En esta ocasión vamos a modelar extractores de carbón, hierro, cintas transportadoras y cajas contenedoras. Los extractores extraen menas, las cintas transportan lo que le pongas encima y las cajas simplemente contienen lo que le depositan.

* **Los tres escenarios a implementar:**

 	```
        1) En este escenario queremos conectar un extractor de carbón a una caja, extraer una mena y que la misma sea depositada en la caja. Para lograr esto el extractor debe tener energía suficiente (en este caso para la única mena que queremos extraer necesitamos 5 joules) y debe estar conectado a la caja. 
		Una vez armado el circuito debemos indicarle al extractor que extraiga.   
		Finalmente debemos asegurarnos que efectivamente haya quedado una mena en la caja. 

        2) Ahora queremos conectar el extractor y la caja a través de una cinta. Para lograrlo debemos conectar el extractor (con energía suficiente) a la cinta y la cinta a la caja.
		Una vez que esté todo conectado y preparado deberemos indicarle al extractor que extraiga y a la cinta que transporte lo extraído.
		Finalmente debemos asegurarnos nuevamente que efectivamente haya quedado una mena en la caja y que la cinta esté vacía.

		3) Para este último escenario, queremos agregar un nuevo extractor, pero esta vez de hierro, conectado al circuito anterior a través de una nueva cinta. Para lograrlo debemos conectar el extractor de carbón a la cinta A, el de hierro a la cinta B, la cinta B a la cinta A y la cinta A a la caja.
		Luego de conectar todo el sistema, le indicaremos a cada extractor que extraiga y a ambas cintas que transporten su contenido.
		Finalmente, debemos asegurarnos que la caja contenga una mena de hierro y una de carbón y que ambas cintas estén vacías.
    ```

### Enunciado:

Para leer el enunciado completp ingresar
<a href="htttps://github.com/IAvecilla/Algoritmos-y-programacion-III/blob/main/01-Factorio/Consigna.md" target="_blank">AQUÍ<a>