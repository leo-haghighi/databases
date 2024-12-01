-- 1
SELECT DISTINCT first_name, surname
FROM restStaff s
JOIN restBill b ON s.staff_no = b.waiter_no
WHERE b.cust_name = 'Tanya Singh';

-- 2
SELECT room_date
FROM restRoom_management rm
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE s.first_name = 'Charles' AND s.surname = 'Watson'
  AND rm.room_name = 'Green'
  AND rm.room_date BETWEEN 160201 AND 160229;

-- 3
SELECT first_name, surname
FROM restStaff
WHERE headwaiter = (SELECT headwaiter
                    FROM restStaff
                    WHERE first_name = 'Zoe' AND surname = 'Ball');

-- 4
SELECT b.cust_name, b.bill_total, s.first_name, s.surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

-- 5
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
JOIN restBill b1 ON s.staff_no = b1.waiter_no
JOIN restBill b2 ON b1.table_no = b2.table_no
WHERE b2.bill_no IN (00014, 00017);

-- 6
SELECT s.first_name, s.surname
FROM restStaff s
JOIN restBill b ON s.staff_no = b.waiter_no
JOIN restRest_table rt ON b.table_no = rt.table_no
JOIN restRoom_management rm ON rt.room_name = rm.room_name
WHERE rm.room_name = 'Blue' AND rm.room_date = 160312
UNION
SELECT first_name, surname
FROM restStaff
WHERE staff_no = (SELECT headwaiter
                  FROM restRoom_management
                  WHERE room_name = 'Blue' AND room_date = 160312);

              
