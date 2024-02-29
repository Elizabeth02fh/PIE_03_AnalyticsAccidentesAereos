## **Contexto del proyecto individual**

En este proyecto hemos trabajado con un conjunto de datos sobre accidentes aéreos, los datos provienen de
la **Organización de Aviación Civil Internacional (OACI)**, en este proyecto se investigaron en profundidad los accidentes producidos desde principios del siglo XX. Para ello se desarrolló un tablero interactivo que recopila dicha información, además, se ha cruzado la información con otras fuentes según el objetivo de obtener mayor claridad y consistencia en los fundamentos del estudio.

![avion_fondo_transparente](https://user-images.githubusercontent.com/103965538/201096411-b6387bc3-5006-448b-8733-bce89ddbc073.png)


​
1.637 / 5.000
Resultados de traducción
Resultado de traducción
## **Proceso de proyecto individual**
Se han llevado a cabo los siguientes pasos:

+ 1 - **Rendimiento del Análisis Exploratorio de Datos (EDA), Transformación de Datos**

     - En este paso se realizó el EDA: con módulos de Python como head(), sample(), info() y entre otros.
     - Transformación de datos: en cada columna se realizaron varias transformaciones como:

     - En la columna Fecha, utilicé un diccionario de datos para poner los meses numéricamente, también cambié el tipo de datos a datetime64[ns].

     - Ingreso de datos con el módulo de reemplazo, reemplacé muchos "?", con nan para poder usar el comando isna que me ayudó a visualizar mejor los valores nulos, luego muchos "-" que reemplacé por el valor más repetido ( mode ) en cada columna que requiere entrada de datos.

     - Eliminando valores atípicos con el módulo apply, lambda y entre otros, por ejemplo cuando las horas no estaban en formato 24 hr, sino que aparecían como 94 horas :) que en realidad no existe, eliminé algunos símbolos o letras("," " c" "Z" "c:" ";" " ") con el módulo de reemplazo.

     - Normalización de datos: Normalicé los nombres de las columnas ya que no mantenían un estándar adecuado entre letras mayúsculas y minúsculas asignándolos a una nueva columna con drop() y eliminándolos.

     - Por otro lado, creé una nueva columna llamada país tomando de la columna ruta_de_accident, con la ayuda de leer un dataset de ciudades.csv con datos de ciudades y países de todo el mundo, para que según la ciudad de la ruta del accidente le asigné el país que le corresponde con algunas funciones en python.
    - ![prepro](https://user-images.githubusercontent.com/103965538/201096469-1200b5f8-f09b-488a-8fb6-2d6099de0bf0.PNG)

Finalmente, el conjunto de datos se exportó a csv.

+ 2 - **Buscar información relevante, relacionada con eventos del proyecto**
         - Se buscó en un conjunto de datos adicional relacionado con el proyecto en la página siguiente:<br> https://www.baaa-acro.com/crash-archives?created=1900-01-01&created_1=2022-11-09&field_crash_region_target_id=All&field_crash_country_target_id&field_crash_registration_target_id&field_crash_aircraft_target_id&field_crash_operator_target_id&field_crash_cause_target_id=12990&field_crash_zone_target_id&field_crash_site_type_target_id=All&field_crash_phase_type_target_id=All&field_crash_flight_type_target_id=All&field_crash_survivors_value=All&field_crash_city_target_id&page=511

- Para esto se realizó web scraping para obtener el conjunto de datos adicional, el conjunto de datos es <br>
           Sobre el Factor Humano (Factor Humano), qué tuvieron que ver los factores humanos con los accidentes aéreos entre los años 1900 y 2022.
            
![scraping](https://user-images.githubusercontent.com/103965538/201096838-98820d9a-ecc7-4226-9e2f-117ecab86b28.png)
             
- El conjunto de datos obtenido era crudo, por lo que se realizaron los mismos pasos de EDA, transformación y preprocesamiento que se explican con mayor detalle en el **paso 1**.

+ 3 - **Creación de la base de datos con el motor SQL de Worbench e ingesta del csv procesado**

     - Usé la librería SQLAlchemy en Python para poder conectarme a la base de datos que previamente la creó en MySQL "avionesdb", de allí cargué el dataset "AccidentesAviones_ok", luego hice alter tablas, para renombrar el índice a "id_aviones_ok" para luego asignarla como CLAVE PRIMARIA. Finalmente se realizó una consulta para comprobar si la base de datos funciona:

- #MUÉSTRAME EL MAYOR NÚMERO DE FALLECIDOS la fecha, el recorrido y entre otros:
     select max(cantidad_de_fallecidos), fecha, ruta como ruta_antes_del_vuelo, ruta como ruta_del_accidente, resumen
     from accidentes_ok donde cantidad_de_fallecidos;

     - A continuación, exporté la base de datos mostrando su Diagrama Entidad-Relación, extensión .bd y .sql para luego subirla directamente a Power BI con un complemento "mysql_connector".
       
    - ![Diagrama_Entidad_Relación](https://user-images.githubusercontent.com/103965538/201099327-de74866c-5c05-44cf-bb92-339fc6c6dd2a.png)

+ 4 - **Desarrollo de un tablero y storytelling**

     - Bajo ambos conjuntos de datos ya cargados y analizados, se realizaron gráficos estadísticos en Power BI como: la comparación de cuántas muertes y accidentes hubo por factor humano en accidentes aéreos entre los años 1900 y 2022, y qué países tuvieron más muertes y entre otros.
    
![Dashboard](https://user-images.githubusercontent.com/103965538/201099519-1bc18e7f-a398-45fc-a5d3-eafa39a3ef90.PNG)
![Dashboard_p2](https://user-images.githubusercontent.com/103965538/201099546-c6736d8d-e12d-4f57-8abb-a118a4dd478a.PNG)

Technological tools:

+ `Python`: EDA + transformations + Preprocessing + Scraping + connection to Mysql
+ `SQL`: database, Entity Relationship Diagram
+ `Power BI`: Dashboard




