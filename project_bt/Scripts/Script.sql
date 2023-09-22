CREATE TABLE STORE_LOCATION(
	LOC_NUM NUMBER PRIMARY KEY,
	CITY VARCHAR2(50),
	REGION VARCHAR2(50),
	DETAIL_ADDRESS VARCHAR2(100),
	LATITUDE NUMBER,
	LONGITUDE NUMBER
);

CREATE TABLE STORE(
	STORE_NUM NUMBER PRIMARY KEY,
	LOC_NUM NUMBER,
	STORE_NAME VARCHAR2(50),
	CONTACT VARCHAR2(20),
	STORE_AREA NUMBER,
	REG_DATE DATE,
	FOREIGN KEY (LOC_NUM) REFERENCES STORE_LOCATION(LOC_NUM) ON DELETE CASCADE
);

CREATE TABLE BRAND_ITEM (
	ITEM_NUM NUMBER PRIMARY KEY,
	ITEM_NAME VARCHAR2(30),
	REF_NUM NUMBER
);

CREATE TABLE PRODUCT_PROPERTIES (
	PROPERTIES_NUM NUMBER PRIMARY KEY,
	COLOR VARCHAR2(30),
	REF_NUM NUMBER
);

CREATE TABLE HEAD_OFFICE_PRODUCT (
	PRODUCT_NUM NUMBER PRIMARY KEY,
	PROPERTIES_NUM NUMBER,
	ITEM_NUM NUMBER,
	COST NUMBER,
	REG_DATE DATE,
	PRODUCT_COUNT NUMBER,
	FOREIGN KEY (PROPERTIES_NUM) REFERENCES PRODUCT_PROPERTIES(PROPERTIES_NUM) ON DELETE CASCADE,
	FOREIGN KEY (ITEM_NUM) REFERENCES BRAND_ITEM(ITEM_NUM) ON DELETE CASCADE
);

CREATE TABLE STORE_STORAGE (
	STORE_PRODUCT_ID VARCHAR2(50) PRIMARY KEY,
	PRODUCT_NUM NUMBER,
	STORE_NUM NUMBER,
	STORAGE_COUNT NUMBER,
	FOREIGN KEY (PRODUCT_NUM) REFERENCES HEAD_OFFICE_PRODUCT(PRODUCT_NUM) ON DELETE CASCADE,
	FOREIGN KEY (STORE_NUM) REFERENCES STORE(STORE_NUM) ON DELETE CASCADE
);

CREATE TABLE SALE (
	SALE_ID VARCHAR2(50) PRIMARY KEY,
	STORE_PRODUCT_ID VARCHAR2(50),
	SALE_DATE DATE,
	SALE_COUNT NUMBER,
	TOTAL_PRICE NUMBER,
	FOREIGN KEY (STORE_PRODUCT_ID) REFERENCES STORE_STORAGE(STORE_PRODUCT_ID) ON DELETE CASCADE
);

CREATE TABLE EMPLOYEE (
	EMPLOYEE_NUM NUMBER PRIMARY KEY,
	STORE_NUM NUMBER,
	EMPLOYEE_NAME VARCHAR2(30),
	ID VARCHAR2(30),
	PASSWORD NUMBER,
	EMAIL VARCHAR2(50),
	PHONE_NUM VARCHAR2(20),
	JOB_LEVEL VARCHAR2(20),
	HIRE_DATE DATE,
	HIRE_TYPE VARCHAR2(10),
	RESIGNATION_DAY DATE,
	EMPLOYEE_PHOTO VARCHAR2(100),
	AUTH NUMBER,
	FOREIGN KEY (STORE_NUM) REFERENCES STORE(STORE_NUM) ON DELETE CASCADE	 
);

CREATE SEQUENCE emp_seq;

INSERT INTO employee values(emp_seq.nextval,1,'홍길동','홍길동','1234','gggg@gmail.com','010-1234-1234','점주',sysdate,'경력직',sysdate,'/',2);
INSERT INTO employee values(emp_seq.nextval,1,'마길동','마길동','1234','gggg@gmail.com','010-1234-1234','매니저',sysdate,'경력직',sysdate,'/',3);
INSERT INTO employee values(emp_seq.nextval,1,'오길동','오길동','1234','gggg@gmail.com','010-1234-1234','직원',sysdate,'신입',sysdate,'/',4);

CREATE TABLE ORDER_ERP (
	ORDER_ID VARCHAR2(50) PRIMARY KEY,
	PRODUCT_NUM NUMBER,
	EMPLOYEE_NUM NUMBER,
	START_DATE DATE,
	END_DATE DATE,
	ORDER_COUNT NUMBER,
	ORDER_STATUS NUMBER(1),
	FOREIGN KEY (PRODUCT_NUM) REFERENCES HEAD_OFFICE_PRODUCT(PRODUCT_NUM) ON DELETE CASCADE,
	FOREIGN KEY (EMPLOYEE_NUM) REFERENCES EMPLOYEE(EMPLOYEE_NUM) ON DELETE CASCADE
);

CREATE TABLE APPROVAL (
	APPROVAL_ID VARCHAR2(50) PRIMARY KEY,
	ORDER_ID VARCHAR2(50),
	APPROVAL_DATE DATE,
	APPROVAL_TYPE VARCHAR2(20),
	DRAFTER VARCHAR2(30),
	APPROVER VARCHAR2(30),
	SUBJECT VARCHAR2(100),
	CONTENTS VARCHAR2(200),
	APPROVAL_STATUS NUMBER(1),
	FOREIGN KEY (ORDER_ID) REFERENCES ORDER_ERP(ORDER_ID) ON DELETE CASCADE
);

