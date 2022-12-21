# **INDIVIDUAL PROJECT_03**, **Data Analyst -** subject: Plane Accidents and Dashboard
## **PROYECTO INDIVIDUAL_03**, **Data Analyst -**  tema: Accidentes de Aviones y Dashboard

## **Individual Project Context**

In this project we have worked with a dataset on aircraft accident data, the data comes from
the **International Civil Aviation Organization (ICAO)**, in this project the accidents produced since the beginning of the 20th century were investigated in depth. For this, an interactive dashboard was developed that compiles such information, in addition, information has been crossed with other sources according to the objective of obtaining greater clarity and consistency in the fundamentals of the study.

![avion_fondo_transparente](https://user-images.githubusercontent.com/103965538/201096411-b6387bc3-5006-448b-8733-bce89ddbc073.png)

## **Individual Project Process**
The following steps have been carried out:

+ 1 - **Performance of Exploratory Data Analysis (EDA), Data transformation**

    - In this step the EDA was carried out: with Python modules such as head(), sample(), info() and among others.
    - Data transformation: in each column as several transformations were made such as:

    - In the Date column, I used a data dictionary to put the months numerically, I also changed the data type to datetime64[ns].

    - Input of data with the replace module, I replaced many "?", with nan to be able to use the isna command that helped me to better visualize the             null values, then many "-" which I replaced by the most repeated value (mode ) in each column that requires data input.

    - Removing outliers with the module apply, lambda and among others, for example when the hours were not in 24 hr format, but appeared as 94 hours           :) which in reality does not exist, I removed some symbols or letters("," "c" "Z" "c:" ";" " ") with the replace module.

    - Data normalization: I normalized the names of the columns since they did not maintain a proper standard between upper and lower case letters by           assigning to a new column with drop() and removing them.

    - On the other hand, I created a new column called country taking from the column ruta_de_accident, with the help of reading a cities.csv dataset           with data from cities and countries around the world, so that according to the city of the route of the accident I assigned the country that               corresponds to it with some functions in python.
    - ![prepro](https://user-images.githubusercontent.com/103965538/201096469-1200b5f8-f09b-488a-8fb6-2d6099de0bf0.PNG)

Finally, the dataset was exported to csv.

+ 2 - **Search for relevant information, related to project events**
        - An additional dataset related to the project on the following page was searched:<br> https://www.baaa-acro.com/crash-archives?created=1900-01-01&created_1=2022-11-09&field_crash_region_target_id=All&field_crash_country_target_id&field_crash_registration_target_id&field_crash_aircraft_target_id&field_crash_operator_target_id&field_crash_cause_target_id=12990&field_crash_zone_target_id&field_crash_site_type_target_id=All&field_crash_phase_type_target_id=All&field_crash_flight_type_target_id=All&field_crash_survivors_value=All&field_crash_city_target_id&page=511

        - For this, web scraping was performed to obtain the additional dataset, the dataset is <br>
          About the Human Factor (Human factor), what human factors had to do with aircraft accidents between the years 1900 and 2022.
            
![scraping](https://user-images.githubusercontent.com/103965538/201096838-98820d9a-ecc7-4226-9e2f-117ecab86b28.png)
             
    - The dataset obtained was raw, so the same EDA, transformation, and preprocessing steps were performed, which are explained in greater detail in **step 1**.

+ 3 - **Creation of the database with the Worbench SQL engine and ingested the processed csv**

    - I used the SQLAlchemy library in Python to be able to connect to the database that previously created it in MySQL "avionesdb", from there I loaded         the dataset "AccidentesAviones_ok", then I made alter tables, to rename the index to "id_aviones_ok" for later assign it as PRIMARY KEY. Finally, a       query was made to check if the database works:


    - #SHOW ME THE GREATEST NUMBER OF DECEASED the date, the route and among others:
    select  max(cantidad_de_fallecidos), fecha, route as ruta_antes_del_vuelo, ruta as ruta_del_accidente, summary 
    from accidentes_ok where cantidad_de_fallecidos;

    - Next, I exported the database showing its Entity Relationship Diagram, extension .bd and .sql to then upload directly to Power BI with a                   "mysql_connector" plugin.
    - ![Diagrama_Entidad_Relación](https://user-images.githubusercontent.com/103965538/201099327-de74866c-5c05-44cf-bb92-339fc6c6dd2a.png)

+ 4 - **Development of a dashboard and storytelling**

    - Under both datasets already loaded and analyzed, statistical graphs were made in Power BI such as: the comparison of how many deaths and accidents there were due to the human factor in aircraft accidents between the years 1900 and 2022, and which countries had the most deaths and among others.
    
![Dashboard](https://user-images.githubusercontent.com/103965538/201099519-1bc18e7f-a398-45fc-a5d3-eafa39a3ef90.PNG)
![Dashboard_p2](https://user-images.githubusercontent.com/103965538/201099546-c6736d8d-e12d-4f57-8abb-a118a4dd478a.PNG)

Technological tools:

+ `Python`: EDA + transformations + Preprocessing + Scraping + connection to Mysql
+ `SQL`: database, Entity Relationship Diagram
+ `Power BI`: Dashboard




