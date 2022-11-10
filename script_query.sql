#create database Avionesdb;
use avionesdb;
ALTER TABLE accidentes_ok RENAME COLUMN `index` TO `id_accidentes_ok`;
ALTER TABLE humanfactor_ok RENAME COLUMN `index` TO `id_accidentes_ok_fk`;
select * from accidentes_ok;
select * from humanfactor_ok;

ALTER TABLE accidentes_ok MODIFY COLUMN fecha DATE;
ALTER TABLE humanfactor_ok MODIFY COLUMN date_hf DATE;
#APLICANDO LOS PRIMARY KEYS 1ERO
ALTER TABLE `accidentes_ok` ADD PRIMARY KEY(`id_accidentes_ok`);
#APLICANDO LOS FOREIGN KEY
#si no se puede desahabilitar 
SET FOREIGN_KEY_CHECKS = 0;
ALTER TABLE `humanfactor_ok` ADD FOREIGN KEY (`id_accidentes_ok_fk`) REFERENCES accidentes_ok(id_accidentes_ok);
#luego dejarlo en habilitado 
SET FOREIGN_KEY_CHECKS = 1;

#QUE ME MUESTRE LA MAYOR CANTIDAD DE FALLECIDOS la fecha, route, ruta y entre otros datos.
select  max(cantidad_de_fallecidos), fecha, ruta_completa, ruta_del_accidente, summary 
from accidentes_ok where cantidad_de_fallecidos;
