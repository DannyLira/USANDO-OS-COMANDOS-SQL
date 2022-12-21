CREATE TABLE aluno (
  cd_aluno NUMBER NOT NULL,
  nm_aluno VARCHAR2(50) NOT NULL,
  idade NUMBER(4,0)  NOT NULL
);

ALTER TABLE aluno
  ADD CONSTRAINT cnt_aluno_pk PRIMARY KEY (cd_aluno );
  
CREATE SEQUENCE SEQUENCE_ALUNO INCREMENT BY 1 START WITH 1;

CREATE OR REPLACE TRIGGER TRIGGER_ALUNO
BEFORE INSERT ON ALUNO
FOR EACH ROW
BEGIN
SELECT SEQUENCE_ALUNO.NEXTVAL INTO:NEW.cd_aluno FROM DUAL;
END;


 SELECT cd_aluno, nm_aluno, idade  FROM aluno;
 
 INSERT INTO aluno VALUES (01, 'KELLY OLIVEIRA', 18);
 INSERT INTO aluno VALUES (02, 'MARCOS VERÍSSIMO', 21);
 INSERT INTO aluno VALUES (03, 'JOÃO PEDRO', 19);
 
  
  
  
  
  
  
  
  
 CREATE TABLE curso (
  cd_curso  NUMBER NOT NULL,
  nm_curso VARCHAR2(50) NOT NULL,
  carga_horaria NUMBER(4,0)  NOT NULL
);

ALTER TABLE curso
  ADD CONSTRAINT cnt_curso_pk PRIMARY KEY (
    cd_curso
  ); 

SELECT cd_curso, nm_curso, carga_horaria  FROM curso;

 INSERT INTO curso VALUES (10, 'DIGITAÇÃO', 40);
 INSERT INTO curso VALUES (11, 'T.I.', 100);
 INSERT INTO curso VALUES (12, 'WEB', 50);
 
 CREATE SEQUENCE SEQUENCE_CURSO INCREMENT BY 1 START WITH 1;
 
 CREATE OR REPLACE TRIGGER TRIGGER_CURSO
 BEFORE INSERT ON CURSO
 FOR EACH ROW
 BEGIN
 SELECT SEQUENCE_CURSO.NEXTVAL INTO:NEW.cd_curso FROM DUAL;
 END;









CREATE TABLE turma (
  cd_turma NUMBER NOT NULL,
  turno VARCHAR2(50) NOT NULL,
  cd_aluno NUMBER NOT NULL,
  cd_curso NUMBER NOT NULL
);


ALTER TABLE turma
  ADD CONSTRAINT cnt_turma_pk PRIMARY KEY (
    cd_turma
  );
  
  SELECT Cd_Turma, Turno, Cd_Aluno, Cd_Curso  FROM turma;
  
  
INSERT INTO turma VALUES (20, 'MANHÃ',1,18 );
INSERT INTO turma VALUES (30, 'TARDE', 2, 15);
INSERT INTO turma VALUES (40, 'NOITE',3, 13);

 CREATE SEQUENCE SEQUENCE_TURMA INCREMENT BY 1 START WITH 1;
 
 CREATE OR REPLACE TRIGGER TRIGGER_TURMA
  BEFORE INSERT ON TURMA
  FOR EACH ROW
  BEGIN
  SELECT SEQUENCE_TURMA.NEXTVAL INTO:NEW.cd_turma FROM DUAL;
 END;

  
  
  
  
ALTER TABLE turma
  ADD CONSTRAINT cnt_turma_aluno_fk FOREIGN KEY (cd_aluno) REFERENCES aluno (cd_aluno);

ALTER TABLE curso
  ADD CONSTRAINT cnt_turma_curso_fk FOREIGN KEY (cd_curso ) REFERENCES curso (cd_curso );
  
  
  select a.nm_aluno, t.turno from aluno a inner join turma t on (a.cd_aluno = t.cd_aluno) where a.cd_aluno = 1
  
  
  
  