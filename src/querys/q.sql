/* 
Luego nombrare este archivo a algo mas especifico,
solo lo hice para guardar las consultas que validan
los domicilios de los usuarios
*/


-- Usuarios sin domicilio
SELECT u.id, u.nombre
FROM public.usuarios u
LEFT JOIN public.domicilios d ON d.usuarios_id = u.id
WHERE d.id IS NULL;

-- Domicilios por usuario
SELECT u.nombre, count(*) AS total
FROM public.usuarios u
JOIN public.domicilios d ON d.usuarios_id = u.id
GROUP BY u.nombre
ORDER BY total DESC;