-- 1
SELECT cust_name
FROM restBill
WHERE bill_total > 450.00 AND waiter_no IN (
    SELECT staff_no
    FROM restStaff
    WHERE headwaiter = (SELECT staff_no
                        FROM restStaff
                        WHERE first_name = 'Charles' AND surname = 'Watson')
);

-- 2
SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no = (SELECT headwaiter
                    FROM restStaff
                    WHERE staff_no = (SELECT waiter_no
                                      FROM restBill
                                      WHERE cust_name = 'Nerida Smith'
                                      AND bill_date = 160111));

-- 3
SELECT cust_name
FROM restBill
WHERE bill_total = (SELECT MIN(bill_total) FROM restBill);

-- 4
SELECT first_name, surname
FROM restStaff
WHERE staff_no NOT IN (SELECT waiter_no FROM restBill);

-- 5
SELECT b.cust_name, h.first_name, h.surname, rm.room_name
FROM restBill b
JOIN restRest_table rt ON b.table_no = rt.table_no
JOIN restRoom_management rm ON rt.room_name = rm.room_name AND b.bill_date = rm.room_date
JOIN restStaff s ON b.waiter_no = s.staff_no
JOIN restStaff h ON s.headwaiter = h.staff_no
WHERE b.bill_total = (SELECT MAX(bill_total) FROM restBill);

