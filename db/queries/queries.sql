--sacar todas las reservas de un puerto
select b.start_date,b.end_date from booking b
        inner join mooring_booking mb on b.id = mb.booking_id
        inner join mooring m on m.id = mb.mooring_id
        inner join mooring_categories mc on mc.id = m.mooring_category_id
        inner join zone z on z.id = mc.zone_id
        inner join port p on p.id = z.port_id
where p.id = 1  ;