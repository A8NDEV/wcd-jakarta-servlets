CREATE TABLE brands (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    contact VARCHAR(200),
    website VARCHAR(200),
    PRIMARY KEY (id)
);

INSERT INTO
    brands (name, contact, website)
VALUES (
        'Nike',
        'contact@nike.com',
        'https://www.nike.com'
    ),
    (
        'Apple',
        'support@apple.com',
        'https://www.apple.com'
    ),
    (
        'Samsung',
        'info@samsung.com',
        'https://www.samsung.com'
    ),
    (
        'Sony',
        'contact@sony.com',
        'https://www.sony.com'
    ),
    (
        'Adidas',
        'hello@adidas.com',
        'https://www.adidas.com'
    );