create user 'baluroot'@'%' identified by 's2nd0b4lur0ot';
grant all privileges on *.* to 'baluroot'@'%';

create user 'baluconsulta'@'%' identified by 's2nd0b4luconsult';
grant select on refugio_balu.* to 'consulta'@'%';

create user 'baluprod'@'%' identified by 's2nd0b4lupr0d';
grant select, insert, update, delete on refugio_balu.* to 'baluprod'@'%';

set global time_zone = 'America/Mexico_City';

flush privileges;

