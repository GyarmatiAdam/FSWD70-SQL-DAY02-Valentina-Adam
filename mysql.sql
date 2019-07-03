SELECT customer.name, book.name 
FROM `customer_to_books` 
INNER JOIN `book` 
INNER JOIN `customer` 
ON customer.id = customer_to_books.fk_customer 
AND book.id = customer_to_books.fk_book;
/*get customer name and book 
name via customer_to_book table
result: customers whos have a book*/

SELECT customer.name, customer.id, book.id, book.name, store.name, store.address 
FROM `customer_to_books`, `customers_to_store`, `books_to_store`
INNER JOIN `book`, `customer`, `store`
WHERE customer.id = customer_to_books.fk_customer = customers_to_store.fk_customer
AND book.id = customer_to_books.fk_book = books_to_store.fk_book;
/*all the data which common in customer,
 book and store tables*/
 /*with WHERE we can set up multiple search condition*/

SELECT customer.name, book.name 
FROM `customer_to_books` 
INNER JOIN `book` 
LEFT JOIN `customer` 
ON customer.id = customer_to_books.fk_customer 
AND book.id = customer_to_books.fk_book;
/*LEFT JOIN finds all customers and the matching books
//but we got strange result*/

/*////////////////////////////////////////////////////////////////////////////////////////////*/

SELECT unit.name, unit.floor, doctor.name, doctor.speciality
FROM `unit`
LEFT JOIN `doctor`
ON doctor.dr_id = unit.dr_id;
/*LEFT JOIN on other database*/

SELECT patient.age AS "Patient Age", history.symptom AS "Patient History"
FROM history
RIGHT JOIN patient
ON patient.patient_sv = history.patient_sv;
/*RIGHT JOIN throws all the patients eighter they have or not history
where is no history, the value is NULL
// with AS we can rename the collumns*/

SELECT patient.age AS "Patient Age", history.symptom AS "Patient History"
FROM patient
LEFT JOIN history
ON patient.patient_sv = history.patient_sv
UNION
SELECT patient.age AS "Patient Age", history.symptom AS "Patient History"
FROM patient
RIGHT JOIN history
ON patient.patient_sv = history.patient_sv;
/*full outer join gives us all age and symptom from both tables*/

SELECT history.patient_sv AS "Patient SV Number", history.symptom AS "Symptom"
FROM history
WHERE history.patient_sv = 985632 
AND history.history_id = 3; /*OR history.history_id = 4;--- gives two results*/
/* WHERE gets an exact data with two search condition*/

SELECT history.patient_sv AS "Patient SV Number", history.symptom AS "Symptom"
FROM history
WHERE history.history_id BETWEEN 4 AND 7;
/* BETWEEN gives opportunity to target datas between range*/

SELECT history.patient_sv AS "Patient SV Number", history.symptom AS "Symptom"
FROM history
WHERE history.history_id BETWEEN 4 AND 7
ORDER BY history.history_id DESC;
/*organise collumn by descending ID*/

/*///////////////////////////////////////////////////////////////////////////////////////////////*/

SELECT DISTINCT car_data.car_model, loc_data.loc_name, offices.office_name 
FROM loc_data, car_data, offices 
WHERE loc_data.loc_id OR offices.fk_loc_id OR car_data.fk_loc_id;
/*get all datas from specified collumns in 3 different tables DISTINCT no repeat*/

SELECT DISTINCT car_data.car_model, loc_data.loc_name, offices.office_name 
FROM  car_data
INNER JOIN loc_data
ON car_data.fk_loc_id = loc_data.loc_id
INNER JOIN offices
ON loc_data.loc_id = offices.fk_loc_id;
/*get all matching datas from specified collumns in 3 different tables DISTINCT no repeat*/

SELECT DISTINCT car_data.car_model, loc_data.loc_name, offices.office_name 
FROM  car_data
INNER JOIN loc_data
ON car_data.fk_loc_id = loc_data.loc_id
INNER JOIN offices
ON loc_data.loc_id = offices.fk_loc_id
WHERE (car_data.car_model = "Swift")
OR (car_data.car_model = "Pilot");
/*to get different specified datas*/

ALTER TABLE booking_data
DROP
FOREIGN KEY fk_car_id;

ALTER TABLE
ADD 
FOREIGN KEY fk_car_id REFERENCES car_data.car_id;
/*to reassighn an existed foreign key*/