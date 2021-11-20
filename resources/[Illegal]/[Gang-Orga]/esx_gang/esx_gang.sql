INSERT INTO `addon_account` (name, label, shared) VALUES
  ("society_vagos", "Vagos", 1),
  ("society_ballas", "Ballas", 1),
  ("society_marabunta", "marabunta", 1),
  ("society_families", "families", 1);

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ("society_vagos", "Vagos", 1),
  ("society_ballas", "Ballas", 1),
  ("society_marabunta", "marabunta", 1),
  ("society_families", "families", 1);

INSERT INTO `datastore` (name, label, shared) VALUES
  ("society_vagos", "Vagos", 1),
  ("society_ballas", "Ballas", 1),
  ("society_marabunta", "marabunta", 1),
  ("society_families", "families", 1);

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ("vagos", 0, "habitants", "Habitants", 0, "{}", "{}"),
  ("vagos", 1, "dealers", "Dealers", 0, "{}", "{}"),
  ("vagos", 2, "bras", "Bras Droit", 0, "{}", "{}"),
  ("vagos", 3, "boss", "OG", 0, "{}", "{}"),

  ("ballas", 0, "habitants", "Habitants", 0, "{}", "{}"),
  ("ballas", 1, "dealers", "Dealers", 0, "{}", "{}"),
  ("ballas", 2, "bras", "Bras Droit", 0, "{}", "{}"),
  ("ballas", 3, "boss", "OG", 0, "{}", "{}"),

  ("marabunta", 0, "habitants", "Habitants", 0, "{}", "{}"),
  ("marabunta", 1, "dealers", "Dealers", 0, "{}", "{}"),
  ("marabunta", 2, "bras", "Bras Droit", 0, "{}", "{}"),
  ("marabunta", 3, "boss", "OG", 0, "{}", "{}"),
  
  ("families", 0, "habitants", "Habitants", 0, "{}", "{}"),
  ("families", 1, "dealers", "Dealers", 0, "{}", "{}"),
  ("families", 2, "bras", "Bras Droit", 0, "{}", "{}"),
  ("families", 3, "boss", "OG", 0, "{}", "{}");

  INSERT INTO `jobs` (`name`, `label`, `whitelisted`, `SecondaryJob`) VALUES 
    ("vagos", "Vagos", '0', '1'),
  ("ballas", "Ballas", '0', '1'),
  ("marabunta", "marabunta", '0', '1'),
  ("families", "families", '0', '1');