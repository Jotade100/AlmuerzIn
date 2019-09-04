use almuerzin;

insert into usuario(idUsuario, tipo, nombre, correo, password, username) 
values(4, 1, "Juan Pérez", "jperez@gmail.com", "1523", "jperez"),
(5, 1, "Lola Dominguez", "ld@gmail.com", "9871", "lodo"),
(6, 1, "Perengano López", "pglopez@yahoo.es", "sapito", "sapito"),
(7, 2, "Fulano Hernández", "fulano@outlook.com", "fu1@n0", "Fulano"),
(8, 1, "Suntano Aquímides", "matepura@ufm.edu", "leydeboyle", "Newton2");

insert into comedor(idComedor, nombre, direccion, promedio, idDueño, trayectoria) 
values(10, "La bendición", "Ciudad Capital, Zona 4", 4.5, 5, "El comedor que vio crecer a muchos negocios de zona 4"),
(11, "La olla del diablo", "San Juan Sacatepéquez, KM 12", 3, 8, "La comida típica de la región");

insert into categoria(idCategoria, nombre, especificacion) 
values(4, "Asiática", "Comida con estilo e ingredientes propios de Asia"),
(5, "Postres", "Para endulzar tu día"),
(6, "Guatemalteca", "Gastronomía típica de Guatemala"),
(7, "Española", "Gastronomía típica de España");

