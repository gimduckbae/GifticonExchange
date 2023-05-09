--------------------------------------------------------
--  파일이 생성됨 - 화요일-5월-09-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BOARD_TEXT
--------------------------------------------------------

  CREATE TABLE "SCOTT"."BOARD_TEXT" 
   (	"NO" NUMBER, 
	"CONTENT" VARCHAR2(4000 BYTE), 
	"WRITER" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "EXAMPLE" ;
REM INSERTING into SCOTT.BOARD_TEXT
SET DEFINE OFF;
--------------------------------------------------------
--  Ref Constraints for Table BOARD_TEXT
--------------------------------------------------------

  ALTER TABLE "SCOTT"."BOARD_TEXT" ADD CONSTRAINT "BOARD_TEXT_FK1" FOREIGN KEY ("NO")
	  REFERENCES "SCOTT"."BOARD_INFO" ("NO") ENABLE;
  ALTER TABLE "SCOTT"."BOARD_TEXT" ADD CONSTRAINT "BOARD_TEXT_FK2" FOREIGN KEY ("WRITER")
	  REFERENCES "SCOTT"."MEMBER_TB" ("LOGIN_ID") ENABLE;
