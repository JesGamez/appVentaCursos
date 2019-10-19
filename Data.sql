use Venta;
INSERT INTO CURSO
(CODCUR, DESCUR, CATCUR, DURCUR)
VALUES
("JAV", "curso de programacion", "BUI", 50),
("PYT", "curso de python", "inf", 100),
("Com", "curso de Comunicacion", "Exp", 70),
("Mat", "curso de matematica", "inv", 80),
("log", "curso de Logica", "REa", 90);

SELECT * FROM CURSO;

INSERT INTO DEPARTAMENTO
(IDDEP,NOMDEP)
VALUES
(1, "Juan"),
(2, "Juana"),
(3, "Pepito"),
(4, "Rosalia"),
(5, "Karen");

SELECT * FROM DEPARTAMENTO;

INSERT INTO EMPLEADO
(IDEMP,FECINGEMP,CARGEMP,JEFE_IDEMP,SALEMP,ESTEMP,IDPER,IDDEP,NIVSUE)
VALUES
(1,"12-9-17","Secretario",1,15.5,"A",1,1,1),
(2,"15-10-17","Administrador",2,25.5,"I",2,2,2),
(3,"20-11-17","Practicante",3,0.0,"A",3,3,3),
(4,"29-12-17","Secretario",4,31.9,"A",4,4,4),
(5,"10-1-18","Administrador",5,41.5,"A",5,5,5);

SELECT * FROM EMPLEADO;

INSERT INTO HISTORICO
(IDHIS, FECFINHIST,TIPHIS,COMEHIST,IDEMP)
VALUES
(01,"21-03-20","cam","Intercambio mi turno dia por noche",11),
(02,"30-5-20","fin","Finalizo mi trabajo aqui",12),
(03,"24-6-20","cam","Viajo por tema de salud",13),
(04,"27-8-21","fin","Me cambio de empresa",14),
(05,"12-4-22","fin","Me jubilo",15);
SELECT *FROM HISTORICO;

INSERT INTO INSCRIPCION
(IDINSC,FECINS,EVALINSC,IDOFER,IDPER,IDEMP)
VALUES
(1,"12-3.12",3,1,1,11),
(2,"10-4-19",5,2,2,12),
(3,"12-3-14",4,3,3,13),
(4,"10-4-19",3,4,4,14),
(5,"12-3-13",2,5,5,15);
SELECT * FROM INSCRIPCION;

INSERT INTO NIVEL_SUELDO
(NIVSUE,MONMINNIVSUE,MONMAXNIVSUE,BONUSNIVSUE)
VALUES
(1,10.2,21.9,12),
(2,9.3,17.4,7),
(3,7.5,15.8,9),
(4,4.5,17.6,3),
(5,9.4,12.3,7);
SELECT * FROM NIVEL_SUELDO;

INSERT INTO OFERTA
(IDOFER,FECOFER,FECINICCUROFER,CODCUR,IDEMP)
VALUES
(1,"12-9-16","20-10-16","JAV",1),
(2,"21-12-16","10-1-17","PYT",2),
(3,"5-2-17","15-3-17","COM",3),
(4,"24-4-17","21-5-17","MAT",4),
(5,"19-6-17","26-7-17","LOG",5);
SELECT * FROM OFERTA;

INSERT INTO PERSONA
(IDPER,DNIPER,NOMPER,APEPER,FECNACPER,CELPER,EMAPER,SEXPER,TIPER,DISTPER)
VALUES
(1,15613435,"Jesus Arturo","Sanchez Gamez","9-2-2",982794689,"jesus.sanchez@vallegrande.edu.pe","M","EMP","Imperial"),
(2,70278913,"Carla Camila","Vicuña Tirado","28-5-6",984563632,"carla.vicuña@gmail.com","F","EMP","Imperial"),
(3,14897409,"Veronica Zavala","Hinostroza Huamani","19-5-8","983783093","veronica.hinostroza@gmail.coom","F","EMP","San Vicente"),
(4,79878914,"Roberto Carlos","Condori Aviles","20-7-2","928128031","carlos.condori@gmail.com","M","EMP","San Luis"),
(5,16746744,"Heydi Gabriela","Vicente Hurtado","13-7-1","982681982","heydi.hurtado@gmail.com","F","EMP","San Vicente");
SELECT * FROM PERSONA;
