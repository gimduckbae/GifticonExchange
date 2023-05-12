--------------------------------------------------------
--  ������ ������ - ������-5��-10-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BOARD_TEXT
--------------------------------------------------------

  CREATE TABLE "SCOTT"."BOARD_TEXT" 
   (	"NO" NUMBER, 
	"CONTENT" VARCHAR2(4000 BYTE), 
	"WRITER" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
REM INSERTING into SCOTT.BOARD_TEXT
SET DEFINE OFF;
Insert into SCOTT.BOARD_TEXT (NO,CONTENT,WRITER) values (4,'�� �Ǵϱ� ¥������.
����� �����
���� �� ó�� ���ִ°�              ?





<h1>�̷��� �ȵɰǵ�</h1>
�Ϥ�������','testid');
Insert into SCOTT.BOARD_TEXT (NO,CONTENT,WRITER) values (1,'�� ���� ���̽ó���?','testid');
Insert into SCOTT.BOARD_TEXT (NO,CONTENT,WRITER) values (2,'�װ� �� �ܻ��Դϴٸ�.','testid');
Insert into SCOTT.BOARD_TEXT (NO,CONTENT,WRITER) values (3,'������Ʈ ���� ������','testid');
--------------------------------------------------------
--  Ref Constraints for Table BOARD_TEXT
--------------------------------------------------------

  ALTER TABLE "SCOTT"."BOARD_TEXT" ADD CONSTRAINT "BOARD_TEXT_FK1" FOREIGN KEY ("NO")
	  REFERENCES "SCOTT"."BOARD_INFO" ("NO") ENABLE;
  ALTER TABLE "SCOTT"."BOARD_TEXT" ADD CONSTRAINT "BOARD_TEXT_FK2" FOREIGN KEY ("WRITER")
	  REFERENCES "SCOTT"."MEMBER_TB" ("LOGIN_ID") ENABLE;
