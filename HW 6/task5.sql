-- 1
SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS number_of_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(b.bill_no) >= 2;

-- 2
SELECT room_name, COUNT(*) AS number_of_tables
FROM restRest_table
WHERE no_of_seats > 6
GROUP BY room_name;

-- 3
SELECT rm.room_name, SUM(b.bill_total) AS total_bills_amount
FROM restBill b
JOIN restRest_table rt ON b.table_no = rt.table_no
JOIN restRoom_management rm ON rt.room_name = rm.room_name
GROUP BY rm.room_name;

-- 4
SELECT h.first_name, h.surname, SUM(b.bill_total) AS total_bill_amount
FROM restBill b
JOIN restStaff w ON b.waiter_no = w.staff_no
JOIN restStaff h ON w.headwaiter = h.staff_no
GROUP BY h.first_name, h.surname
ORDER BY total_bill_amount DESC;

-- 5
SELECT cust_name
FROM restBill
GROUP BY cust_name
HAVING AVG(bill_total) > 400.00;

-- 6
SELECT s.first_name, s.surname, COUNT(b.bill_no) AS number_of_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(b.bill_no) >= 3;
