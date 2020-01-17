//MySQL

CREATE TABLE provincia 
(id_provincia int 
 , nombre 	  varchar (30) 
 , CONSTRAINT pk_prov      PRIMARY KEY (id_provincia)
 , CONSTRAINT uq_nombre    UNIQUE (nombre)
 );
 
CREATE TABLE departamento
(id_departamento int 
 , id_prov       int
 , nombre        varchar (30) DEFAULT "Nuevo"
 , presupuesto  float         CHECK (presupuesto BETWEEN 1000 AND 5000)
 , CONSTRAINT pk_depart       PRIMARY KEY (id_departamento)
 , CONSTRAINT fk_depart_prov  FOREIGN KEY (id_prov) REFERENCES provincia(id_provincia)
 );
    
CREATE TABLE trabajador
(id_trabajador int 
 , id_prov     int 
 , id_depart   int 
 , nombre      varchar (30)    DEFAULT "Nuevo"
 , salario     float           CHECK (salario >= 0)
 , comision    float           CHECK (comision <= salario/2)
 , CONSTRAINT pk_trab          PRIMARY KEY (id_trabajador)
 , CONSTRAINT fk_trab_prov     FOREIGN KEY (id_prov) REFERENCES provincia(id_provincia)
 , CONSTRAINT fk_trab_depart   FOREIGN KEY (id_depart) REFERENCES departamento(id_departamento)
 );

.
.
.
.

