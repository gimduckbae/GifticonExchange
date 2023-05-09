--------------------------------------------------------
--  파일이 생성됨 - 수요일-5월-10-2023   
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
Insert into SCOTT.BOARD_TEXT (NO,CONTENT,WRITER) values (4,'잘 되니까 짜증나요.
만들게 산더미
공백 잘 처리 해주는가              ?





<h1>이런건 안될건데</h1>
하ㅏㅏㅏㅏ','testid');
Insert into SCOTT.BOARD_TEXT (NO,CONTENT,WRITER) values (1,'제 글이 보이시나요?','testid');
Insert into SCOTT.BOARD_TEXT (NO,CONTENT,WRITER) values (2,'그건 제 잔상입니다만.','testid');
Insert into SCOTT.BOARD_TEXT (NO,CONTENT,WRITER) values (3,'프로젝트 언제 다하지','testid');
--------------------------------------------------------
--  Ref Constraints for Table BOARD_TEXT
--------------------------------------------------------

  ALTER TABLE "SCOTT"."BOARD_TEXT" ADD CONSTRAINT "BOARD_TEXT_FK1" FOREIGN KEY ("NO")
	  REFERENCES "SCOTT"."BOARD_INFO" ("NO") ENABLE;
  ALTER TABLE "SCOTT"."BOARD_TEXT" ADD CONSTRAINT "BOARD_TEXT_FK2" FOREIGN KEY ("WRITER")
	  REFERENCES "SCOTT"."MEMBER_TB" ("LOGIN_ID") ENABLE;
