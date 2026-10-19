DROP TABLE IF EXISTS INSCRIPCION;
DROP TABLE IF EXISTS ALUMNO;
DROP TABLE IF EXISTS CURSO;

CREATE TABLE ALUMNO (
    IdAlumno INT ,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Correo VARCHAR(100),
    Edad INT,
    FechaRegistro DATETIME DEFAULT GETDATE(),
    CONSTRAINT id_Alumno PRIMARY KEY(IdAlumno), 
    CONSTRAINT CHK_Edad CHECK (Edad>=15 AND Edad<=100),
    CONSTRAINT UQ_Correo UNIQUE(Correo)
);


CREATE TABLE CURSO(
   IdCurso INT, 
   NombreCurso VARCHAR(50) NOT NULL, 
   Cupo INT NOT NULL, 
   Costo DECIMAL(10,2),
   Activo BIT, 
   CONSTRAINT id_Curso PRIMARY KEY(IdCurso),
   CONSTRAINT UQ_NombreCurso UNIQUE(NombreCurso),
   CONSTRAINT CHK_Cupo CHECK (Cupo>0),
   CONSTRAINT CHK_Costo CHECK (Costo>=0), 
   CONSTRAINT CHK_Activo CHECK (Activo=1)
);


CREATE TABLE INSCRIPCION(
   IdInscripcion INT, 
   FechaInscripcion DATETIME DEFAULT GETDATE(), 
   Calificacion DECIMAL(5,2),
   idAlumno_FK INT,
   idCurso_FK INT,
   CONSTRAINT id_Inscripcion PRIMARY KEY(IdInscripcion),
   CONSTRAINT id_Alumno_fk FOREIGN KEY(idAlumno_FK) REFERENCES ALUMNO (IdAlumno),
   CONSTRAINT id_Curso_fk FOREIGN KEY(idCurso_FK) REFERENCES CURSO (IdCurso),
   CONSTRAINT UQ_Inscripcion_Unica UNIQUE (idAlumno_FK, idCurso_FK),
   CONSTRAINT CHK_Calificacion CHECK (Calificacion>=0 AND Calificacion<=10)
);

INSERT INTO ALUMNO (IdAlumno, Nombre, Apellido, Correo, Edad)
                    VALUES 
                    (1, 'Sebastian', 'Sosa', 'sosa.sebastian@email.com', 20),
                    (2, 'Carlos', 'Lopez', 'carlos.l@email.com',25), 
                    (3, 'Sofia', 'Martinez', 'sofia.m@email.com',19);

INSERT INTO CURSO  (IdCurso, NombreCurso, Cupo, Costo, Activo)
                    VALUES 
                    (1, 'Bases de Datos', 30, 1500.00,1),
                    (2, 'Programacion Python', 25, 2000.00, 1);

INSERT INTO INSCRIPCION  (IdInscripcion, Calificacion, idAlumno_FK, idCurso_FK)
                        VALUES 
                        (1, 9.50, 1, 1),
                        (2, 8.00, 1, 2),
                        (3, 10.00, 2, 1),
                        (4, 8.50, 3, 2);


