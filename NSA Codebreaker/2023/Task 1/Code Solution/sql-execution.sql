SELECT ld.id, ld.latitude, ld.longitude, td.recTime, td.recDate
FROM location AS ld
INNER JOIN timestamp AS td ON ld.id = td.id
WHERE (ld.latitude LIKE '28.35%' OR ld.latitude LIKE '28.36%' OR ld.latitude LIKE '28.37%')
AND (ld.longitude LIKE '-84.75%' OR ld.longitude LIKE '-84.77%' OR ld.longitude LIKE '-84.78%');
