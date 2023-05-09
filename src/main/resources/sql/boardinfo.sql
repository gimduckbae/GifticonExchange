--------------------------------------------------------
--  ������ ������ - ȭ����-5��-09-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BOARD_INFO
--------------------------------------------------------

  CREATE TABLE "SCOTT"."BOARD_INFO" 
   (	"CREATE_DATE" DATE DEFAULT SYSDATE, 
	"NO" NUMBER, 
	"CATEGORY" NUMBER, 
	"TITLE" VARCHAR2(20 BYTE), 
	"WRITER" VARCHAR2(30 BYTE), 
	"NICKNAME" VARCHAR2(30 BYTE), 
	"STATUS" NUMBER(1,0) DEFAULT 0
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "EXAMPLE" ;

   COMMENT ON COLUMN "SCOTT"."BOARD_INFO"."CREATE_DATE" IS '�ۼ���¥';
   COMMENT ON COLUMN "SCOTT"."BOARD_INFO"."NO" IS '�۹�ȣ';
   COMMENT ON COLUMN "SCOTT"."BOARD_INFO"."CATEGORY" IS 'ī�װ�';
   COMMENT ON COLUMN "SCOTT"."BOARD_INFO"."TITLE" IS '������';
   COMMENT ON COLUMN "SCOTT"."BOARD_INFO"."WRITER" IS '�ۼ��� ���̵�';
   COMMENT ON COLUMN "SCOTT"."BOARD_INFO"."NICKNAME" IS '�ۼ��� �г���';
   COMMENT ON COLUMN "SCOTT"."BOARD_INFO"."STATUS" IS '�亯����';
REM INSERTING into SCOTT.BOARD_INFO
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index BOARD_INFO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."BOARD_INFO_PK" ON "SCOTT"."BOARD_INFO" ("NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "EXAMPLE" ;
--------------------------------------------------------
--  Constraints for Table BOARD_INFO
--------------------------------------------------------

  ALTER TABLE "SCOTT"."BOARD_INFO" MODIFY ("CREATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."BOARD_INFO" MODIFY ("NO" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."BOARD_INFO" MODIFY ("CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."BOARD_INFO" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."BOARD_INFO" MODIFY ("WRITER" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."BOARD_INFO" MODIFY ("NICKNAME" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."BOARD_INFO" ADD CONSTRAINT "BOARD_INFO_PK" PRIMARY KEY ("NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "EXAMPLE"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARD_INFO
--------------------------------------------------------

  ALTER TABLE "SCOTT"."BOARD_INFO" ADD CONSTRAINT "BOARD_INFO_FK1" FOREIGN KEY ("WRITER")
	  REFERENCES "SCOTT"."MEMBER_TB" ("LOGIN_ID") ENABLE;
