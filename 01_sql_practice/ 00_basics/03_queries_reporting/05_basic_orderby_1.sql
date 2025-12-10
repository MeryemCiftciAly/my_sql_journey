SELECT
    COUNT(cupcake_name) AS cupcake_count,
    flavor,
    in_stock
FROM
    cupcake
WHERE
    unit_price < 2
GROUP BY
    flavor,
    in_stock;
