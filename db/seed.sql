INSERT INTO borrowers (first_name, last_name, phone, zip, ssn_last4, language_pref) VALUES
('Maria',  'Delgado',  '+14075550101', '32703', '4821', 'es'),
('Robert', 'Chen',     '+14075550102', '32801', '7730', 'en'),
('Tanya',  'Whitfield','+14075550103', '34786', '1255', 'en');

INSERT INTO loans (borrower_id, loan_number, principal, interest_rate, term_months, status, next_due_date, monthly_payment) VALUES
(1, 'LN-100441', 285000.00, 6.125, 360, 'current', '2026-11-01', 1731.45),
(2, 'LN-100512', 412500.00, 5.875, 360, 'late',    '2026-10-01', 2440.12),
(3, 'LN-100587', 198000.00, 6.500, 180, 'current', '2026-11-01', 1724.80);

INSERT INTO payments (loan_id, paid_on, amount, method) VALUES
(1, '2026-09-01', 1731.45, 'ach'),
(1, '2026-10-01', 1731.45, 'ach'),
(2, '2026-08-28', 2440.12, 'card'),
(3, '2026-09-30', 1724.80, 'check');
