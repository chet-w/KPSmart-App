/**
 * Created by rongjiwang on 5/06/17.
 */

var pgp = require("pg-promise")();

var cn = process.env.DATABASE_URL || "postgres://localhost:5432/cameronmclachlan";

//pgp.pg.defaults.ssl = true; //cloud connection

var db = pgp(cn);

module.exports = db;
