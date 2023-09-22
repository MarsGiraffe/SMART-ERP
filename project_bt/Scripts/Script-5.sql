		select ORDER_ID ,to_char(start_date,'YYYY-MM-DD') AS start_date, to_char(end_date,'YYYY-MM-DD') AS end_date, e.employee_name 
		,s.store_name,oe.product_num ,bb.ITEM_NAME AS brand, b.ITEM_NAME, pp.COLOR AS color, p.COLOR AS prd_size, order_count ,order_status
		from order_erp oe
		JOIN employee e ON oe.EMPLOYEE_NUM = e.EMPLOYEE_NUM 
		JOIN store s ON e.STORE_NUM = s.STORE_NUM
		JOIN HEAD_OFFICE_PRODUCT hop ON oe.PRODUCT_NUM = hop.PRODUCT_NUM
		JOIN BRAND_ITEM b ON hop.ITEM_NUM = b.ITEM_NUM 
		JOIN PRODUCT_PROPERTIES p ON hop.PROPERTIES_NUM = p.PROPERTIES_NUM
		LEFT JOIN BRAND_ITEM bb ON b.REF_NUM = bb.ITEM_NUM  
		LEFT JOIN PRODUCT_PROPERTIES pp ON p.REF_NUM = pp.PROPERTIES_NUM
		order by start_date;O 

		SELECT order_id
		FROM ORDER_ERP oe 
		WHERE ORDER_STATUS = 0
		ORDER BY order_id desc;
	
		SELECT e.EMPLOYEE_NAME 
		FROM employee e
		WHERE JOB_LEVEL = '팀장';

SELECT * FROM ORDER_ERP oe ;

ALTER TABLE HIMAN.ORDER_ERP MODIFY ORDER_STATUS NUMBER;
ALTER TABLE HIMAN.ORDER_ERP DROP COLUMN BACKGROUNDCOLOR;
ALTER TABLE HIMAN.ORDER_ERP DROP COLUMN TEXTCOLOR;
ALTER TABLE HIMAN.ORDER_ERP ADD PROGRESS NUMBER;



		SELECT 
		    h.PRODUCT_NUM,
		    bb.ITEM_NAME AS brand,
		    b.ITEM_NAME,
		    pp.COLOR AS color,
		    p.COLOR AS prd_size,
		    h.COST,
		    h.REG_DATE,
		    h.PRODUCT_COUNT
		FROM HEAD_OFFICE_PRODUCT h
		JOIN BRAND_ITEM b ON h.ITEM_NUM = b.ITEM_NUM
		JOIN PRODUCT_PROPERTIES p ON h.PROPERTIES_NUM = p.PROPERTIES_NUM
		LEFT JOIN PRODUCT_PROPERTIES pp ON p.REF_NUM = pp.PROPERTIES_NUM
		LEFT JOIN BRAND_ITEM bb ON b.REF_NUM = bb.ITEM_NUM 
		WHERE b.ITEM_NAME like '%'||#{item_name}||'%'
		
		ALTER TABLE HIMAN.APPROVAL MODIFY CONTENTS VARCHAR2(2400);

SELECT oe.PRODUCT_NUM,s.STORE_NUM, oe.ORDER_COUNT 
FROM ORDER_ERP oe 
JOIN EMPLOYEE e ON oe.EMPLOYEE_NUM = e.EMPLOYEE_NUM
JOIN STORE s ON e.STORE_NUM = s.STORE_NUM 
WHERE ORDER_ID = '2023/08/22-29';

CREATE SEQUENCE store_str START WITH 19;

INSERT into store_storage (store_product_id,product_num,store_num,storage_count)
SELECT store_str.nextval,oe.PRODUCT_NUM,s.STORE_NUM, oe.ORDER_COUNT 
FROM ORDER_ERP oe 
JOIN EMPLOYEE e ON oe.EMPLOYEE_NUM = e.EMPLOYEE_NUM
JOIN STORE s ON e.STORE_NUM = s.STORE_NUM 
WHERE ORDER_ID = '2023/08/22-29';


SELECT oe.product_num, s.STORE_NUM 
FROM ORDER_ERP oe 
JOIN EMPLOYEE e ON oe.EMPLOYEE_NUM = e.EMPLOYEE_NUM 
JOIN STORE s ON e.STORE_NUM = s.STORE_NUM 
WHERE order_id = '2023/08/22-29'
INTERSECT 
SELECT ss.PRODUCT_NUM , ss.STORE_NUM 
FROM STORE_STORAGE ss; 


SELECT * FROM STORE_STORAGE ss ;	

SELECT order_count 
FROM ORDER_ERP oe 
WHERE order_id = #{ORDER_ID}; 
	

		SELECT storage_count
		FROM STORE_STORAGE ss2 
		WHERE ss2.PRODUCT_NUM =
		(SELECT oe.product_num 
		FROM ORDER_ERP oe 
		JOIN EMPLOYEE e ON oe.EMPLOYEE_NUM = e.EMPLOYEE_NUM 
		JOIN STORE s ON e.STORE_NUM = s.STORE_NUM 
		WHERE order_id = '2023/08/22-29'
		INTERSECT 
		SELECT ss.PRODUCT_NUM 
		FROM STORE_STORAGE ss)
		AND ss2.STORE_NUM = (
			SELECT s.STORE_NUM 
			FROM ORDER_ERP oe 
			JOIN EMPLOYEE e ON oe.EMPLOYEE_NUM = e.EMPLOYEE_NUM 
			JOIN STORE s ON e.STORE_NUM = s.STORE_NUM 
			WHERE order_id = '2023/08/22-29'
			INTERSECT 
			SELECT ss.STORE_NUM 
			FROM STORE_STORAGE ss
		);

	UPDATE STORE_STORAGE ss2
		SET STORAGE_COUNT = 20
	WHERE ss2.PRODUCT_NUM =
		(SELECT oe.product_num 
		FROM ORDER_ERP oe 
		JOIN EMPLOYEE e ON oe.EMPLOYEE_NUM = e.EMPLOYEE_NUM 
		JOIN STORE s ON e.STORE_NUM = s.STORE_NUM 
		WHERE order_id = '2023/08/22-29'
		INTERSECT 
		SELECT ss.PRODUCT_NUM 
		FROM STORE_STORAGE ss)
		AND ss2.STORE_NUM = (
			SELECT s.STORE_NUM 
			FROM ORDER_ERP oe 
			JOIN EMPLOYEE e ON oe.EMPLOYEE_NUM = e.EMPLOYEE_NUM 
			JOIN STORE s ON e.STORE_NUM = s.STORE_NUM 
			WHERE order_id = '2023/08/22-29'
			INTERSECT 
			SELECT ss.STORE_NUM 
			FROM STORE_STORAGE ss
		);
		
	SELECT hop.PRODUCT_COUNT 
	FROM HEAD_OFFICE_PRODUCT hop 
	JOIN ORDER_ERP oe ON hop.PRODUCT_NUM = oe.PRODUCT_NUM 
	WHERE oe.ORDER_ID = '2023/08/25-53';
	
	UPDATE HEAD_OFFICE_PRODUCT hop
		SET hop.PRODUCT_COUNT = 80
	WHERE hop.PRODUCT_NUM = (
		SELECT oe.PRODUCT_NUM  
		FROM ORDER_ERP oe
		WHERE oe.ORDER_ID = '2023/08/22-29'
	);

	SELECT * FROM HEAD_OFFICE_PRODUCT hop ;
	