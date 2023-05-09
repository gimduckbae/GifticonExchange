CREATE TABLE GIFTICON 
(
  COUPONNUMBER VARCHAR2(30 BYTE) NOT NULL 
, VIRTUALCOUPONNAME VARCHAR2(50 BYTE) NOT NULL 
, BRANDCODE VARCHAR2(30 BYTE) NOT NULL 
, BRANDNAME VARCHAR2(30 BYTE) NOT NULL 
, CONSUMERPRICE NUMBER(8, 0) NOT NULL 
, SALEPRICE NUMBER(8, 0) NOT NULL 
, USABLEAMOUNT NUMBER(8, 0) NOT NULL 
, VALIDITYSTARTDATE DATE NOT NULL 
, VALIDITYENDDATE DATE NOT NULL 
, OWNER VARCHAR2(30 BYTE) DEFAULT NULL 
, CONSTRAINT SYS_C007569 PRIMARY KEY 
  (
    COUPONNUMBER 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX SYS_C007569 ON GIFTICON (COUPONNUMBER ASC) 
      LOGGING 
      TABLESPACE EXAMPLE 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE EXAMPLE 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NO INMEMORY 
NOPARALLEL;

COMMENT ON COLUMN GIFTICON.COUPONNUMBER IS '���� ��ȣ';

COMMENT ON COLUMN GIFTICON.VIRTUALCOUPONNAME IS '���� Ǯ����';

COMMENT ON COLUMN GIFTICON.BRANDCODE IS '�귣���ڵ�';

COMMENT ON COLUMN GIFTICON.BRANDNAME IS '�귣���̸�';

COMMENT ON COLUMN GIFTICON.CONSUMERPRICE IS '�Һ��ڰ���';

COMMENT ON COLUMN GIFTICON.SALEPRICE IS '�ǰŷ�����';

COMMENT ON COLUMN GIFTICON.USABLEAMOUNT IS '��밡�� �ܾ�';

COMMENT ON COLUMN GIFTICON.VALIDITYSTARTDATE IS '���� �߱���';

COMMENT ON COLUMN GIFTICON.VALIDITYENDDATE IS '���� ������';

COMMENT ON COLUMN GIFTICON.OWNER IS '������ ���̵�';