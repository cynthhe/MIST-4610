USE ns_ch88958;

CREATE TABLE sale (
	saleno INTEGER,
    saledate DATE NOT NULL,
    saletext VARCHAR (50),
    PRIMARY KEY(saleno));
    
CREATE TABLE item (
	itemno INTEGER,
    itemname VARCHAR(30) NOT NULL,
    itemtype CHAR(1) NOT NULL,
    itemcolor VARCHAR(10),
    PRIMARY KEY(itemno));
    
CREATE TABLE lineitem (
	lineno INTEGER,
    lineqty INTEGER NOT NULL,
    lineprice DECIMAL(7,2) NOT NULL,
    saleno INTEGER,
    itemno INTEGER,
    PRIMARY KEY(lineno,saleno),
	CONSTRAINT fk_has_sale FOREIGN KEY(saleno) REFERENCES sale(saleno),
	CONSTRAINT fk_has_item FOREIGN KEY(itemno) REFERENCES item(itemno));
    
SELECT * FROM saleno;

#Three table join
SELECT * FROM sale JOIN lineitem
ON sale.saleno = lineitem.saleno
JOIN item ON item.itemno = lineitem.itemno;

#EXISTS: existential qualifier; returns true or false; returns true if the table contains at least one row satisfying the specified condition
    