# JHANU EXAMPLES

These examples are the ones which are showed in the tutorial videos. These are its source code, however these examples are already included into the jhanu database

In order to execute the examples, you need to install the rmm database which is included into the sql folder

### SOFTWARE REQUIREMENTS

The database is a postgreslq backup, so you need the postgresql client installed in your os.

### CREATE AND RESTORE THE RMMM DATABASE

After installing the postgresql client, download or clone this repository. Then, go into the sql folder and run the following command (you need docker running and Jhanu database already installed)

    createdb -U jnuser -E=UTF-8 -h localhost rmm

When the password is requested, then set it as `1a2b3c4d` which is the one used buy Jhanu in its rmm connection configuration.

Then, use the following command to create the tables and load the initial data

    psql -U jnuser -h localhost rmm < rmm_22-12-2022.sql

