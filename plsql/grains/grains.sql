WITH grain_count(square, grains) AS (
    SELECT 1 AS square, 1 AS grains
    FROM dual
    UNION ALL
    SELECT square + 1, grains * 2
    FROM grain_count
    WHERE square < 64
)
SELECT square, grains
FROM grain_count;

WITH grain_count(square, grains) AS (
    SELECT 1 AS square, 1 AS grains
    FROM dual
    UNION ALL
    SELECT square + 1, grains * 2
    FROM grain_count
    WHERE square < 64
)
SELECT SUM(grains) AS total_grains
FROM grain_count;
