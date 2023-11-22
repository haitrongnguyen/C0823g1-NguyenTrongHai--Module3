SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.';
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.';

alter table customers add index ind_customer(customerName);
alter table customers add index ind_customer_full_name(contactFirstName,contactLastName);
EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' or contactFirstName = 'King';

alter table customers drop index ind_customer;

alter table customers drop index ind_customer_full_name;

DELIMITER //

CREATE PROCEDURE findAllCustomers()

BEGIN

  SELECT * FROM customers;

END //

DELIMITER ;

call findAllCustomers();

DELIMITER //

DROP PROCEDURE IF EXISTS findAllCustomers //

CREATE PROCEDURE findAllCustomers()

BEGIN

SELECT * FROM customers where customerNumber = 175;

END //

