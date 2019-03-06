# Run init script that deletes existing database and creates a new database
mysql --protocol=tcp -h$1 -u$2 -p$3 < $4/dbscripts/00_fluidiam_init.sql

# Run base script of compact identity
mysql --protocol=tcp -h$1 -u$2 -p$3 < $4/dbscripts/01_fluidiam.sql

# Run delta script of compact identity
mysql --protocol=tcp -h$1 -u$2 -p$3 < $4/dbscripts/02_fluidiam_delta_11Jan2019.sql