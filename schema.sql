
create database Venta;
USE Venta;
CREATE TABLE CURSO (
    CODCUR char(3) NOT NULL COMMENT 'Contiene el código único para cada curso ofertado.',
    DESCUR varchar(30) NULL COMMENT 'Descripción corta del curso.',
    CATCUR char(3) NULL COMMENT 'Categoría de curso (GEN = General, DEV = Desarrollo y ADS = Análisis y Diseño de Sistemas).',
    DURCUR int NULL COMMENT 'Duración del curso en número de días.',
    CONSTRAINT CURSO_pk PRIMARY KEY (CODCUR)
) COMMENT 'contiene toda la información referente a los cursos que se ofertan';

-- Table: DEPARTAMENTO
CREATE TABLE DEPARTAMENTO (
    IDDEP int NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada departamento.',
    NOMDEP varchar(50) NULL COMMENT 'Nombre descriptivo de departamento.',
    CONSTRAINT DEPARTAMENTO_pk PRIMARY KEY (IDDEP)
) COMMENT 'contiene toda la información de los departamentos en los que trabajan los empleados.';

-- Table: EMPLEADO
CREATE TABLE EMPLEADO (
    IDEMP int NOT NULL AUTO_INCREMENT COMMENT 'Es el dato identificador de todo empleado.',
    FECINGEMP date NULL COMMENT 'Fecha de ingreso del empleado.',
    CARGEMP varchar(40) NULL COMMENT 'Descripción del cargo del empleado.',
    SALEMP decimal(6,2) NULL COMMENT 'Monto de salario del empleado (no incluye bonos).',
    ESTEMP char(1) NULL COMMENT 'Determina si es A activo o I inactivo. Si está trabajando actualmente o no. Por default será A.',
    IDPER int NOT NULL COMMENT 'Identificador de los datos de la persona que es registrado como empleado.',
    IDDEP int NOT NULL COMMENT 'Identificador de departamento en que trabaja el empleado.',
    NIVSUE int NOT NULL COMMENT 'Identificador que determinal el grado o nivel de sueldo.',
    JEFE_IDEMP int NOT NULL COMMENT 'Identificador del jefe del empleado.',
    CONSTRAINT EMPLEADO_pk PRIMARY KEY (IDEMP)
) COMMENT 'contiene la información necesaria del empleado.';

-- Table: HISTORICO
CREATE TABLE HISTORICO (
    IDHIS int NOT NULL AUTO_INCREMENT COMMENT 'Identificador de Histórico.',
    FECFINHIST date NULL COMMENT 'Fin de fecha de intervalo de trabajo, ya sea por despido o por cambios de cargo.',
    TIPHIS char(3) NULL COMMENT 'Tipo de Histórico: CAMB cambio de departamento ó FIN término de labores en la empresa.',
    COMEHIST varchar(100) NOT NULL COMMENT 'Comentarios del motivo de cambio y/o finalización de labores en la empresa.',
    IDEMP int NOT NULL COMMENT 'Identificador del empleado.',
    CONSTRAINT HISTORICO_pk PRIMARY KEY (IDHIS)
) COMMENT ' contiene la información histórica de los años trabajados de un empleado dentro de la empresa.';

-- Table: INSCRIPCION
CREATE TABLE INSCRIPCION (
    IDINSC int NOT NULL COMMENT 'Identificador de la inscripción realizada.',
    `IDPER.` int NULL COMMENT 'Identificador de la persona de tipo estudiante que se registra en un curso.',
    FECINS date NULL COMMENT 'Fecha en que se realiza la inscripción.',
    EVALINSC int NOT NULL COMMENT 'Opinión sobre la persona que lo atendió (escala del 1 - 5)',
    IDEMP int NOT NULL COMMENT 'Identificador del empleado del departamento de ventas que realiza la inscripción.',
    IDPER int NOT NULL,
    IDOFER int NOT NULL COMMENT 'Identificador de la oferta en la que se basa la inscripción.',
    CONSTRAINT INSCRIPCION_pk PRIMARY KEY (IDINSC)
) COMMENT 'contiene todas las inscripciones realizadas a los cursos ofertados y que son atendidos por los empleados del departamento de ventas.';

-- Table: NIVEL_SUELDO
CREATE TABLE NIVEL_SUELDO (
    NIVSUE int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del grado o nivel de venta que puede alcanzar el vendedor.',
    MONMINNIVSUE decimal(6,2) NULL COMMENT 'Monto mínimo de venta realizada.',
    MONMAXNIVSUE decimal(6,2) NULL COMMENT 'Monto máximo de venta realizada.',
    BONUSNIVSUE decimal(6,2) NULL COMMENT 'Bonificación neta adicional a su salario mensual.',
    CONSTRAINT NIVEL_SUELDO_pk PRIMARY KEY (NIVSUE)
) COMMENT 'contiene los niveles o grados de sueldo que puede alcanzar el empleado de acuerdo a su productividad.';

-- Table: OFERTA
CREATE TABLE OFERTA (
    IDOFER int NOT NULL AUTO_INCREMENT COMMENT 'Identificador de oferta.',
    FECOFER date NULL COMMENT 'Fecha de inicio de oferta de curso.',
    FECINICCUROFER date NULL COMMENT 'Fecha de inicio de curso ofertado.',
    CODCUR char(3) NOT NULL COMMENT 'Identificador de curso que se está ofertando.',
    IDEMP int NOT NULL COMMENT 'Identificador de empleado que sería el profesor del curso ofertado.',
    CONSTRAINT OFERTA_pk PRIMARY KEY (IDOFER)
) COMMENT ' contiene las ofertas de cursos con su respectiva fecha de inicio y profesor. asignado. ';

-- Table: PERSONA
CREATE TABLE PERSONA (
    IDPER int NOT NULL AUTO_INCREMENT COMMENT 'Es el dato identificador de la persona',
    DNIPER char(8) NULL COMMENT 'Número de DNI(Documento Nacional de Identificación)',
    NOMPER varchar(50) NULL COMMENT 'Contiene los nombres de la persona.',
    APEPER varchar(80) NULL COMMENT 'Contiene los apellidos de la persona.',
    FECNACPER date NULL COMMENT 'Contiene la fecha de nacimiento de la persona.',
    CELPER char(9) NOT NULL COMMENT 'Contiene el númer de celular de la persona.',
    EMAPER varchar(100) NOT NULL COMMENT 'Contiene el correo electrónico de la persona.',
    SEXPER char(1) NULL COMMENT 'Contiene el identificador de sexo de la persona (M) Masculino y (F) para Femenino.',
    TIPER char(3) NULL COMMENT 'Determina si la persona es un EMP Empleado o un EST Estudiante.',
    DISTPER varchar(80) NOT NULL COMMENT 'Contiene el nombre del distrito de procedencia de la persona. Sólo se admite distritos de la provincia de Cañete.',
    CONSTRAINT PERSONA_pk PRIMARY KEY (IDPER)
) COMMENT 'Contiene los datos generales de toda persona, además especifica si es estudiante o empleado.';

-- foreign keys
-- Reference: EMPLEADO_DEPARTAMENTO (table: EMPLEADO)
ALTER TABLE EMPLEADO ADD CONSTRAINT EMPLEADO_DEPARTAMENTO FOREIGN KEY EMPLEADO_DEPARTAMENTO (IDDEP)
    REFERENCES DEPARTAMENTO (IDDEP);

-- Reference: EMPLEADO_EMPLEADO (table: EMPLEADO)
ALTER TABLE EMPLEADO ADD CONSTRAINT EMPLEADO_EMPLEADO FOREIGN KEY EMPLEADO_EMPLEADO (JEFE_IDEMP)
    REFERENCES EMPLEADO (IDEMP);

-- Reference: EMPLEADO_NIVEL_SUELDO (table: EMPLEADO)
ALTER TABLE EMPLEADO ADD CONSTRAINT EMPLEADO_NIVEL_SUELDO FOREIGN KEY EMPLEADO_NIVEL_SUELDO (NIVSUE)
    REFERENCES NIVEL_SUELDO (NIVSUE);

-- Reference: EMPLEADO_PERSONA (table: EMPLEADO)
ALTER TABLE EMPLEADO ADD CONSTRAINT EMPLEADO_PERSONA FOREIGN KEY EMPLEADO_PERSONA (IDPER)
    REFERENCES PERSONA (IDPER);

-- Reference: HISTORICO_EMPLEADO (table: HISTORICO)
ALTER TABLE HISTORICO ADD CONSTRAINT HISTORICO_EMPLEADO FOREIGN KEY HISTORICO_EMPLEADO (IDEMP)
    REFERENCES EMPLEADO (IDEMP);

-- Reference: INSCRIPCION_EMPLEADO (table: INSCRIPCION)
ALTER TABLE INSCRIPCION ADD CONSTRAINT INSCRIPCION_EMPLEADO FOREIGN KEY INSCRIPCION_EMPLEADO (IDEMP)
    REFERENCES EMPLEADO (IDEMP);

-- Reference: INSCRIPCION_OFERTA (table: INSCRIPCION)
ALTER TABLE INSCRIPCION ADD CONSTRAINT INSCRIPCION_OFERTA FOREIGN KEY INSCRIPCION_OFERTA (IDOFER)
    REFERENCES OFERTA (IDOFER);

-- Reference: INSCRIPCION_PERSONA (table: INSCRIPCION)
ALTER TABLE INSCRIPCION ADD CONSTRAINT INSCRIPCION_PERSONA FOREIGN KEY INSCRIPCION_PERSONA (IDPER)
    REFERENCES PERSONA (IDPER);

-- Reference: OFERTA_CURSO (table: OFERTA)
ALTER TABLE OFERTA ADD CONSTRAINT OFERTA_CURSO FOREIGN KEY OFERTA_CURSO (CODCUR)
    REFERENCES CURSO (CODCUR);

-- Reference: OFERTA_EMPLEADO (table: OFERTA)
ALTER TABLE OFERTA ADD CONSTRAINT OFERTA_EMPLEADO FOREIGN KEY OFERTA_EMPLEADO (IDEMP)
    REFERENCES EMPLEADO (IDEMP);

-- End of file.

