CREATE TABLE USUARIO (
  ID SERIAL,
  NOMBRE VARCHAR(20) DEFAULT NULL,
  EMAIL VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE TURISTA (
  ID INT NOT NULL,
  EDAD INT(11) DEFAULT NULL,
  PRIMARY KEY (ID),
  CONSTRAINT TURISTA_IBFK_1 FOREIGN KEY (ID) REFERENCES USUARIO (ID)
);


CREATE TABLE EMPRESARIO (
  ID INT NOT NULL,
  RUT VARCHAR(12) DEFAULT NULL,
  TELEFONO VARCHAR(20) DEFAULT NULL,
  DIRECCION VARCHAR(50) NOT NULL,
  PRIMARY KEY (ID),
  CONSTRAINT EMPRESARIO_IBFK_1 FOREIGN KEY (ID) REFERENCES USUARIO (ID)
);

CREATE TABLE EMPRESA (
  ID SERIAL,
  NOMBRE VARCHAR(20) DEFAULT NULL,
  RUT_EMPRESA VARCHAR(20) DEFAULT NULL,
  ID_EMPRESARIO INT DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY ID_EMPRESARIO (ID_EMPRESARIO),
  CONSTRAINT EMPRESA_IBFK_1 FOREIGN KEY (ID_EMPRESARIO) REFERENCES EMPRESARIO (ID)
);

CREATE TABLE SUCURSAL (
  ID SERIAL ,
  NOMBRE VARCHAR(30) DEFAULT NULL,
  SELLO_DE_TURISMO INT DEFAULT NULL,
  ID_EMPRESA INT DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY ID_EMPRESA (ID_EMPRESA),
  ID_POI INT DEFAULT NULL,
  CONSTRAINT SUCURSAL_IBFK_1 FOREIGN KEY (ID_EMPRESA) REFERENCES EMPRESA (ID)
);

CREATE TABLE SERVICIO (
  ID SERIAL,
  NOMBRE_SERVICIO VARCHAR(20) NOT NULL,
  ID_SUCURSAL INT,
  PRIMARY KEY (ID),
  KEY ID_SUCURSAL (ID_SUCURSAL),
  CONSTRAINT SERVICIO_IBFK_1 FOREIGN KEY (ID_SUCURSAL) REFERENCES SUCURSAL (ID_SUCURSAL)
);

CREATE TABLE CATEGORIA (
  NOMBRE_CATEGORIA VARCHAR(20) NOT NULL,
  DESCRIPCION VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (NOMBRE_CATEGORIA)
) ;

CREATE TABLE SERVICIO_CATEGORIA (
  ID_SERVICIO INT,
  NOMBRE_CATEGORIA VARCHAR(20) NOT NULL,
  PRIMARY KEY (NOMBRE_CATEGORIA,ID_SERVICIO),
  CONSTRAIN SERVICIO_CATEGORIA_IBFK_1 FOREIGN KEY (ID_SERVICIO) REFERENCES SERVICIO(ID),
  CONSTRAIN SERVICIO_CATEGORIA_IBFK_2 FOREIGN KEY (NOMBRE_CATEGORIA) REFERENCES CATEGORIA(NOMBRE_CATEGORIA)
) ;

CREATE TABLE ITINERARIO (
  ID SERIAL,
  NOMBRE VARCHAR(20) DEFAULT NULL,
  DURACION VARCHAR(10) DEFAULT NULL,
  ID_USUARIO INT DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY ID_USUARIO (ID_USUARIO),
  CONSTRAINT ITINERARIO_IBFK_1 FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO (ID)
);

CREATE TABLE ORDEN(
 ID_ITINERARIO INT,
 ID_SERVICIO INT,
 ORDEN INT,
 PRIMARY KEY(ID_ITINERARIO,ID_SERVICIO),
  CONSTRAIN ORDEN_IBFK_1 FOREIGN KEY (ID_ITINERARIO) REFERENCES ITINERARIO(ID),
  CONSTRAIN ORDEN_IBFK_2 FOREIGN KEY (ID_SERVICIO) REFERENCES SERVICIO(ID)
);

CREATE TABLE VALORACION(
ID_TURISTA INT,
NOTA INT,
ID_SERVICIO INT,
PRIMARY KEY(ID_TURISTA,ID_SERVICIO),
  CONSTRAIN ORDEN_IBFK_1 FOREIGN KEY (ID_TURISTA) REFERENCES TURISTA(ID),
  CONSTRAIN ORDEN_IBFK_2 FOREIGN KEY (ID_SERVICIO) REFERENCES SERVICIO(ID)
);

