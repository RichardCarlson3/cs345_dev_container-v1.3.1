CREATE VIEW PublicSupplier AS
SELECT DISTINCT name
FROM supplier;

GRANT SELECT ON PublicSupplier to Public;