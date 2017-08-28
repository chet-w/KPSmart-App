var express = require('express');
var router = express.Router();
var queries = require('../queries');
var db = require('../db/config');

/* global vars */
var id;
/* GET users listing. */
router.get('/:id', function (req, res, next) {
    id = req.params.id;
    db.any('select * from route where id=$1', [id])
        .then(data => {
            // console.log(data);
            res.render('route-cost-update', {
                signedInUser: queries.getSignedInUser(),
                manager: queries.isManager(),
                data: data
            });
        })
        .catch(error => {
            console.log('Error: ' + error);
        });
});

router.post('/', function (req, res, next) {
    console.log(req.body.newPriceKg + ' ' + req.body.newPriceVolume);
    db.any('update route set cost_per_kg_business=$1, cost_per_volume_business=$2 where id=$3'
        , [req.body.newPriceKg, req.body.newPriceVolume, id])
        .then(() => {
            db.any('select * from route where id=$1', [id])
                .then(data => {
                    res.render('route-cost-update', {
                        signedInUser: queries.getSignedInUser(),
                        manager: queries.isManager(),
                        data: data,
                        message: 'Cost Price update successful!'
                    });
                })
                .catch(error => {
                    console.log('Error: (Inner) ' + error);
                });


        })
        .catch(error => {
            console.log('Error: (Outer) ' + error);
        });
});
module.exports = router;
