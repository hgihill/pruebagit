CREATE TABLE provincia 
(id_provincia NUMBER 
 , nombre 	  varchar2 (30) 
 , CONSTRAINT pk_prov   PRIMARY KEY (id_provincia)
 , CONSTRAINT uq_nombre UNIQUE (nombre)
 );
 
CREATE TABLE departamento
(id_departamento NUMBER 
 , id_provincia  NUMBER
 , nombre        VARCHAR2(30)DEFAULT 'Nuevo'
 , presupuesto   NUMBER(6,2)  
 , CONSTRAINT pk_depart      PRIMARY KEY (id_departamento)
 , CONSTRAINT fk_depart_prov FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia)
 , CONSTRAINT ck_pres        CHECK (presupuesto BETWEEN 1000 AND 5000)
 );
    
CREATE TABLE trabajador
(id_trabajador     NUMBER 
 , id_provincia    NUMBER 
 , id_departamento NUMBER 
 , nombre          varchar2(30) 
 , salario         NUMBER(6,2) 
 , comision        NUMBER(6,2) 
 , CONSTRAINT pk_trab        PRIMARY KEY (id_trabajador)
 , CONSTRAINT fk_trab_prov   FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia)
 , CONSTRAINT fk_trab_depart FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
 , CONSTRAINT ck_sal         CHECK (salario >= 0)
 , CONSTRAINT ck_com         CHECK (comision <= salario/2)
 );

.
.
.
.
