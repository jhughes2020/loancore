CREATE TABLE borrowers (
    borrower_id   SERIAL PRIMARY KEY,
    first_name    TEXT NOT NULL,
    last_name     TEXT NOT NULL,
    phone         TEXT UNIQUE NOT NULL,
    zip           TEXT NOT NULL,
    ssn_last4     CHAR(4) NOT NULL,
    language_pref TEXT NOT NULL DEFAULT 'en' CHECK (language_pref IN ('en','es')),
    created_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE loans (
    loan_id        SERIAL PRIMARY KEY,
    borrower_id    INT NOT NULL REFERENCES borrowers(borrower_id),
    loan_number    TEXT UNIQUE NOT NULL,
    principal      NUMERIC(12,2) NOT NULL CHECK (principal > 0),
    interest_rate  NUMERIC(5,3)  NOT NULL CHECK (interest_rate >= 0),
    term_months    INT NOT NULL,
    status         TEXT NOT NULL DEFAULT 'current'
                   CHECK (status IN ('current','late','paid_off','in_escrow_review')),
    next_due_date  DATE,
    monthly_payment NUMERIC(10,2) NOT NULL,
    created_at     TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE payments (
    payment_id  SERIAL PRIMARY KEY,
    loan_id     INT NOT NULL REFERENCES loans(loan_id),
    paid_on     DATE NOT NULL,
    amount      NUMERIC(10,2) NOT NULL CHECK (amount > 0),
    method      TEXT NOT NULL CHECK (method IN ('ach','card','check','phone')),
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_loans_borrower  ON loans(borrower_id);
CREATE INDEX idx_payments_loan   ON payments(loan_id, paid_on DESC);
CREATE INDEX idx_borrowers_phone ON borrowers(phone);
