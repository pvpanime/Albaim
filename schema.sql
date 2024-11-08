--------------------------------------------------------
--  파일이 생성됨 - 월요일-11월-04-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ALBA_ENT
--------------------------------------------------------

  CREATE TABLE "SCOTT"."ALBA_ENT" 
   (	"USERID" VARCHAR2(100) NOT NULL ENABLE, 
	"BUSINESSID" VARCHAR2(100) NOT NULL ENABLE, 
	"CONTACT" VARCHAR2(100) NOT NULL ENABLE, 
	 CONSTRAINT "ALBA_ENT_PK" PRIMARY KEY ("USERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE, 
	 CONSTRAINT "ALBA_ENT_UNIQUE" UNIQUE ("BUSINESSID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE, 
	 CONSTRAINT "ALBA_ENT_USER_FK" FOREIGN KEY ("USERID")
	  REFERENCES "SCOTT"."ALBA_USER" ("USERID") ON DELETE CASCADE ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"
--------------------------------------------------------
--  DDL for Table ALBA_OPEN
--------------------------------------------------------

  CREATE TABLE "SCOTT"."ALBA_OPEN" 
   (	"ORDINAL" NUMBER NOT NULL ENABLE, 
	"WORKPLACE_ORD" NUMBER NOT NULL ENABLE, 
	"TITLE" VARCHAR2(100) NOT NULL ENABLE, 
	"DES" VARCHAR2(1024) DEFAULT '' NOT NULL ENABLE, 
	"PAY" NUMBER(9,0) DEFAULT 10300 NOT NULL ENABLE, 
	"OPEN_FROM" VARCHAR2(32) DEFAULT TO_CHAR(CURRENT_TIMESTAMP, 'YYYY-MM-DD HH24:MI:SS TZH:TZM') NOT NULL ENABLE, 
	"OPEN_UNTIL" VARCHAR2(32) DEFAULT TO_CHAR(CURRENT_TIMESTAMP + INTERVAL '7' DAY, 'YYYY-MM-DD HH24:MI:SS TZH:TZM') NOT NULL ENABLE, 
	"STATUS" NUMBER(2,0) DEFAULT 0 NOT NULL ENABLE, 
	"NPEER" NUMBER(4,0) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "ALBA_OPEN_PK" PRIMARY KEY ("ORDINAL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE, 
	 CONSTRAINT "ALBA_OPEN_WORKPLACE_FK" FOREIGN KEY ("WORKPLACE_ORD")
	  REFERENCES "SCOTT"."ALBA_WORKPLACE" ("ORDINAL") ON DELETE CASCADE ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"
--------------------------------------------------------
--  DDL for Table ALBA_USER
--------------------------------------------------------

  CREATE TABLE "SCOTT"."ALBA_USER" 
   (	"USERID" VARCHAR2(100) NOT NULL ENABLE, 
	"EMAIL" VARCHAR2(100) NOT NULL ENABLE, 
	"PASSWD_RAW" VARCHAR2(100) NOT NULL ENABLE, 
	"EXPRNAME" VARCHAR2(100) NOT NULL ENABLE, 
	"USERTYPE" NUMBER(2,0) NOT NULL ENABLE, 
	"CREATED_AT" VARCHAR2(32) DEFAULT TO_CHAR(CURRENT_TIMESTAMP, 'YYYY-MM-DD HH24:MI:SS TZH:TZM') NOT NULL ENABLE, 
	 CONSTRAINT "USER_PK" PRIMARY KEY ("USERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE, 
	 CONSTRAINT "USER_EMAIL_UNIQUE" UNIQUE ("EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"
--------------------------------------------------------
--  DDL for Table ALBA_WORKPLACE
--------------------------------------------------------

  CREATE TABLE "SCOTT"."ALBA_WORKPLACE" 
   (	"ORDINAL" NUMBER NOT NULL ENABLE, 
	"ENT_ID" VARCHAR2(100) NOT NULL ENABLE, 
	"REGISTER_ID" VARCHAR2(100) NOT NULL ENABLE, 
	"NAME" VARCHAR2(100) NOT NULL ENABLE, 
	 CONSTRAINT "ALBA_WORKPLACE_PK" PRIMARY KEY ("ENT_ID", "REGISTER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE, 
	 CONSTRAINT "ALBA_WORKPLACE_ORD_UNIQUE" UNIQUE ("ORDINAL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE, 
	 CONSTRAINT "ALBA_WORKPLACE_ENT_FK" FOREIGN KEY ("ENT_ID")
	  REFERENCES "SCOTT"."ALBA_ENT" ("USERID") ON DELETE CASCADE ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"
--------------------------------------------------------
--  DDL for Index ALBA_EMPLOYER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."ALBA_EMPLOYER_PK" ON "SCOTT"."ALBA_ENT" ("USERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"
--------------------------------------------------------
--  DDL for Index ALBA_EMPLOYER_UNIQUE
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."ALBA_EMPLOYER_UNIQUE" ON "SCOTT"."ALBA_ENT" ("BUSINESSID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"
--------------------------------------------------------
--  DDL for Index ALBA_OPEN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."ALBA_OPEN_PK" ON "SCOTT"."ALBA_OPEN" ("ORDINAL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"
--------------------------------------------------------
--  DDL for Index USER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."USER_PK" ON "SCOTT"."ALBA_USER" ("USERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"
--------------------------------------------------------
--  DDL for Index USER_EMAIL_UNIQUE
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."USER_EMAIL_UNIQUE" ON "SCOTT"."ALBA_USER" ("EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"
--------------------------------------------------------
--  DDL for Index ALBA_WORKFIELD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."ALBA_WORKFIELD_PK" ON "SCOTT"."ALBA_WORKPLACE" ("ENT_ID", "REGISTER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"
--------------------------------------------------------
--  DDL for Index ALBA_WORKFIELD_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."ALBA_WORKFIELD_UK1" ON "SCOTT"."ALBA_WORKPLACE" ("ORDINAL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"
--------------------------------------------------------
--  Constraints for Table ALBA_ENT
--------------------------------------------------------

  ALTER TABLE "SCOTT"."ALBA_ENT" ADD CONSTRAINT "ALBA_ENT_UNIQUE" UNIQUE ("BUSINESSID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
  ALTER TABLE "SCOTT"."ALBA_ENT" ADD CONSTRAINT "ALBA_ENT_PK" PRIMARY KEY ("USERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
  ALTER TABLE "SCOTT"."ALBA_ENT" MODIFY ("CONTACT" NOT NULL ENABLE)
  ALTER TABLE "SCOTT"."ALBA_ENT" MODIFY ("BUSINESSID" NOT NULL ENABLE)
  ALTER TABLE "SCOTT"."ALBA_ENT" MODIFY ("USERID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table ALBA_OPEN
--------------------------------------------------------

  ALTER TABLE "SCOTT"."ALBA_OPEN" MODIFY ("NPEER" NOT NULL ENABLE)
  ALTER TABLE "SCOTT"."ALBA_OPEN" ADD CONSTRAINT "ALBA_OPEN_PK" PRIMARY KEY ("ORDINAL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
  ALTER TABLE "SCOTT"."ALBA_OPEN" MODIFY ("STATUS" NOT NULL ENABLE)
  ALTER TABLE "SCOTT"."ALBA_OPEN" MODIFY ("OPEN_UNTIL" NOT NULL ENABLE)
  ALTER TABLE "SCOTT"."ALBA_OPEN" MODIFY ("OPEN_FROM" NOT NULL ENABLE)
  ALTER TABLE "SCOTT"."ALBA_OPEN" MODIFY ("PAY" NOT NULL ENABLE)
  ALTER TABLE "SCOTT"."ALBA_OPEN" MODIFY ("DES" NOT NULL ENABLE)
  ALTER TABLE "SCOTT"."ALBA_OPEN" MODIFY ("TITLE" NOT NULL ENABLE)
  ALTER TABLE "SCOTT"."ALBA_OPEN" MODIFY ("WORKPLACE_ORD" NOT NULL ENABLE)
  ALTER TABLE "SCOTT"."ALBA_OPEN" MODIFY ("ORDINAL" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table ALBA_USER
--------------------------------------------------------

  ALTER TABLE "SCOTT"."ALBA_USER" ADD CONSTRAINT "USER_EMAIL_UNIQUE" UNIQUE ("EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
  ALTER TABLE "SCOTT"."ALBA_USER" ADD CONSTRAINT "USER_PK" PRIMARY KEY ("USERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
  ALTER TABLE "SCOTT"."ALBA_USER" MODIFY ("USERTYPE" NOT NULL ENABLE)
  ALTER TABLE "SCOTT"."ALBA_USER" MODIFY ("CREATED_AT" NOT NULL ENABLE)
  ALTER TABLE "SCOTT"."ALBA_USER" MODIFY ("EXPRNAME" NOT NULL ENABLE)
  ALTER TABLE "SCOTT"."ALBA_USER" MODIFY ("PASSWD_RAW" NOT NULL ENABLE)
  ALTER TABLE "SCOTT"."ALBA_USER" MODIFY ("EMAIL" NOT NULL ENABLE)
  ALTER TABLE "SCOTT"."ALBA_USER" MODIFY ("USERID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table ALBA_WORKPLACE
--------------------------------------------------------

  ALTER TABLE "SCOTT"."ALBA_WORKPLACE" ADD CONSTRAINT "ALBA_WORKPLACE_ORD_UNIQUE" UNIQUE ("ORDINAL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
  ALTER TABLE "SCOTT"."ALBA_WORKPLACE" ADD CONSTRAINT "ALBA_WORKPLACE_PK" PRIMARY KEY ("ENT_ID", "REGISTER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
  ALTER TABLE "SCOTT"."ALBA_WORKPLACE" MODIFY ("NAME" NOT NULL ENABLE)
  ALTER TABLE "SCOTT"."ALBA_WORKPLACE" MODIFY ("REGISTER_ID" NOT NULL ENABLE)
  ALTER TABLE "SCOTT"."ALBA_WORKPLACE" MODIFY ("ENT_ID" NOT NULL ENABLE)
  ALTER TABLE "SCOTT"."ALBA_WORKPLACE" MODIFY ("ORDINAL" NOT NULL ENABLE)
--------------------------------------------------------
--  Ref Constraints for Table ALBA_ENT
--------------------------------------------------------

  ALTER TABLE "SCOTT"."ALBA_ENT" ADD CONSTRAINT "ALBA_ENT_USER_FK" FOREIGN KEY ("USERID")
	  REFERENCES "SCOTT"."ALBA_USER" ("USERID") ON DELETE CASCADE ENABLE
--------------------------------------------------------
--  Ref Constraints for Table ALBA_OPEN
--------------------------------------------------------

  ALTER TABLE "SCOTT"."ALBA_OPEN" ADD CONSTRAINT "ALBA_OPEN_WORKPLACE_FK" FOREIGN KEY ("WORKPLACE_ORD")
	  REFERENCES "SCOTT"."ALBA_WORKPLACE" ("ORDINAL") ON DELETE CASCADE ENABLE
--------------------------------------------------------
--  Ref Constraints for Table ALBA_WORKPLACE
--------------------------------------------------------

  ALTER TABLE "SCOTT"."ALBA_WORKPLACE" ADD CONSTRAINT "ALBA_WORKPLACE_ENT_FK" FOREIGN KEY ("ENT_ID")
	  REFERENCES "SCOTT"."ALBA_ENT" ("USERID") ON DELETE CASCADE ENABLE
