INSERT INTO `addon_account` (name, label, shared) VALUES
    ('society_taxi', 'Taxi', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
    ('society_taxi', 'Taxi', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
    ('society_taxi', 'Taxi', 1)
;

INSERT INTO `jobs` (name, label) VALUES
    ('taxi', 'Taxi')
;

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
    ('taxi',0,'recrue','Recrue',12, 'null', 'null'),
    ('taxi',1,'novice','Novice',24, 'null', 'null'),
    ('taxi',2,'experimente','Experimente',36, 'null', 'null'),
    ('taxi',3,'uber','Uber',48, 'null', 'null'),
    ('taxi',4,'boss','Patron',0, 'null', 'null')
;