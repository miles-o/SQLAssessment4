DROP TABLE ORDERS CASCADE CONSTRAINTS;
DROP TABLE ITEMS CASCADE CONSTRAINTS;

CREATE TABLE ORDERS (
    ORDER_NUMBER    NUMBER(4)
        CONSTRAINT orders_order_number_pk PRIMARY KEY,
    ORDER_DATE      DATE
        CONSTRAINT orders_order_date_nn NOT NULL,
    FIRST_NAME      VARCHAR(10)
        CONSTRAINT orders_first_name_nn NOT NULL,
    LAST_NAME       VARCHAR(15)
        CONSTRAINT orders_last_name_nn NOT NULL,
    POSTAGE         NUMBER(5,2)
        CONSTRAINT orders_postage_ck CHECK (POSTAGE >= 0)
        CONSTRAINT orders_postage_nn NOT NULL,
    TOTAL           NUMBER(5,2)
        CONSTRAINT orders_total_ck CHECK (TOTAL >= 0)
        CONSTRAINT orders_total_nn NOT NULL
    );

CREATE TABLE ORDER_ITEMS (
    ITEM_NUMBER         NUMBER(5)
        CONSTRAINT items_item_number_pk PRIMARY KEY,
    ORDER_NUMBER        NUMBER(4)
        CONSTRAINT items_order_number_fk REFERENCES ORDERS(ORDER_NUMBER)
        CONSTRAINT items_order_number_nn NOT NULL,
    ITEM_DESCRIPTION    VARCHAR(20)
        CONSTRAINT items_item_description_nn NOT NULL,
    SIZE                VARCHAR(10),
    COST                NUMBER(6,2)
        CONSTRAINT items_cost_nn NOT NULL,
    QUANTITY            NUMBER(4)
        CONSTRAINT items_quantity_nn NOT NULL,
    TOTAL               NUMBER(10,2)
        CONSTRAINT items_total_nn NOT NULL
    );