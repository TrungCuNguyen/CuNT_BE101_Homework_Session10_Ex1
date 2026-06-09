--- bt1-ss10
CREATE TABLE products
(
    id            SERIAL PRIMARY KEY,
    name          VARCHAR(255),
    price         NUMERIC(10, 2),
    last_modified DATE
);

CREATE OR REPLACE FUNCTION update_last_modified()
    RETURNS TRIGGER AS
$$
BEGIN
    NEW.last_modified := CURRENT_DATE;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_last_modified
    BEFORE UPDATE
    ON products
    FOR EACH ROW
EXECUTE FUNCTION update_last_modified();

INSERT INTO products (name, price, last_modified)
VALUES ('Laptop Dell XPS 13', 1200.00, '2026-05-02'),
       ('iPhone 15 Pro', 999.99, '2026-05-02'),
       ('Samsung Galaxy S24', 899.50, '2026-05-02'),
       ('Tai nghe Sony WH-1000XM5', 349.99, '2026-05-02'),
       ('Chuột Logitech MX Master 3S', 99.99, '2026-05-02'),
       ('Bàn phím cơ Keychron K2', 89.00, '2026-05-02'),
       ('Màn hình LG UltraFine 4K', 599.00, '2026-05-02'),
       ('Ổ cứng SSD Samsung 1TB', 129.00, '2026-05-02'),
       ('Máy ảnh Canon EOS R6', 2499.00, '2026-05-02'),
       ('Loa JBL Charge 5', 179.99, '2026-05-02');

UPDATE products
SET price = 1500
WHERE id = 1;