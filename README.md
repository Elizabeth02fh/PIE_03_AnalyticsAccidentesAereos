# **PROYECTO INDIVIDUAL**

# **Data Analyst -**  tema: Accidentes de Aviones y Dashboard
## **Contexto del Proyecto Individual**

En estre proyecto se ha trabajado con un dataset sobre datos de accidentes de aviones, la data proviene de 
la **Organización de Aviación Civil Internacional (OACI)**, en esta proyecto se investigó en profundidad los accidentes producidos desde inicios del siglo XX. Para ello, se elaboró dashboard interactivo que recopile tal información, ademas se ha cruzado información con otras fuentes de acuerdo al objetivo de obtener mayor claridad y consistencia en los fundamentos del estudio.

![avion_fondo_transparente](https://user-images.githubusercontent.com/103965538/201096411-b6387bc3-5006-448b-8733-bce89ddbc073.png)

## **Proceso del Proyecto Individual**
Se ha realizado los siguientes pasos: 

+ 1 - **Realización del Análisis Exploratorio de Datos (EDA), Transformación de datos**

    - En este paso se realizó el EDA: con módulos de Python como head(), sample(), info() y entre otros.
    - Transformación de datos: en cada columna como se hizo varias transformaciones como:

        - En la columna Fecha, utilicé un diccionario de datos para poner los meses de forma numérica, también cambié al tipo de dato a datetime64[ns].

        - Inputación de datos con el módulo replace,  reemplacé muchos "?", con nan para poder usar el comando isna que me ayudo en visualizar mejor los valores nulos, luego muchos "-" lo cual reemplacé por el valor que más se repite (moda) en cada columna que sea necesario la inputación de datos.

        - Quitando outliers con el módulo apply, lambda y entre otros, por ejemplo cuando las horas no estaban en formato de 24 hr, sino aparecían como 94 horas :) lo cual en la realidad no existe, quité algunos símbolos o letras("," "c" "Z" "c:" ";" " ") con el módulo replace.

        - Normalización de datos: normalicé los nombres de las columnas ya que no mantenían un estandar adecuado entre mayúsculas y minúsculas asignando a una nueva columnacon drop() y eliminándolas. 

        - Por otro lado, creé una nueva columna llamada pais sacando de la columna ruta_de_accidente, con la ayuda de la lectura de un dataset cities.csv con datos de de ciudades y países del todo el mundo, para que de acuerdo a la ciudad de la ruta del accidente le asigne al pais que le corresponde con algunas funciones en python. 
        - ![prepro](https://user-images.githubusercontent.com/103965538/201096469-1200b5f8-f09b-488a-8fb6-2d6099de0bf0.PNG)

    Por último, se exportó a csv el dataset.

+ 2 - **Búsqueda de información rrelevante, relación con los eventos del proyecto**
        - Se buscó un dataset adicional relacionado al proyecto de la siguiente página:<br> https://www.baaa-acro.com/crash-archives?created=1900-01-01&created_1=2022-11-09&field_crash_region_target_id=All&field_crash_country_target_id&field_crash_registration_target_id&field_crash_aircraft_target_id&field_crash_operator_target_id&field_crash_cause_target_id=12990&field_crash_zone_target_id&field_crash_site_type_target_id=All&field_crash_phase_type_target_id=All&field_crash_flight_type_target_id=All&field_crash_survivors_value=All&field_crash_city_target_id&page=511

        - Para esto se realizó web scraping para obtener el dataset adicional, el dataset es <br>
            acerca del Factor humano (Human factor), qué factores humanos tuvieron que ver con los accidentes de las aeronaves entre los años 1900 a 2022.
            
![scraping](https://user-images.githubusercontent.com/103965538/201096838-98820d9a-ecc7-4226-9e2f-117ecab86b28.png)
             
        - El dataset obtenido estaba en bruto así que se hisieron los mismos pasos de EDA, Transformación, preprocesamiento que se explica a mayor detalle en el **paso 1**. 

+ 3 - **Creación de la base de datos con el motor SQL de Worbench y se ingestó el csv procesado**

    - Utilicé la librería de SQLAlchemy en Python para poder conectar a la base de datos que previamente lo cree en MySQL "avionesdb", de ahí cargué el dataset "AccidentesAviones_ok", luego hice alter tables, para renombrar el index por "id_aviones_ok" para luego asignarlo como PRIMARY KEY. Finalmente, se hizo una consulta para contrastar si la base de datos funciona:

    - #QUE ME MUESTRE LA MAYOR CANTIDAD DE FALLECIDOS la fecha, la route y entre otros:
    select  max(cantidad_de_fallecidos), fecha, route as ruta_antes_del_vuelo, ruta as ruta_del_accidente, summary 
    from accidentes_ok where cantidad_de_fallecidos;

    - A continuación, exporté la base de datos mostrando su Diagrama Entidad Relación, extensión .bd y .sql para luego cargar directamente al Power BI con un plugin "mysql_connector".
    - ![Diagrama_Entidad_Relación](https://user-images.githubusercontent.com/103965538/201099327-de74866c-5c05-44cf-bb92-339fc6c6dd2a.png)
   
+ 4 - **Elaboración de un dashboard y un storytelling**

    - Bajo ambos dataset ya cargados y análizados se realizaron gráficos estadísticos en Power BI como: la comparación de cuantas muertes y accidentes hubieron por causa del factor humano en los accidentes de aeronaves entre los años 1900 hasta el año 2022, e que países hubieron más muertes y entre otross.
![Dashboard](https://user-images.githubusercontent.com/103965538/201099519-1bc18e7f-a398-45fc-a5d3-eafa39a3ef90.PNG)
![Dashboard_p2](https://user-images.githubusercontent.com/103965538/201099546-c6736d8d-e12d-4f57-8abb-a118a4dd478a.PNG)

Herramientas tecnológicas:

+ `Python`: EDA + transformaciones + Preprocesamiento + Sraping + concexion a Mysql
+ `SQL`: base de datos, Diagrama Entidad Relación
+ `Power BI`: Dashboard




