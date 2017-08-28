var express = require('express');
var router = express.Router();
var queries = require('../queries');


/* GET users listing. */
router.get('/', function (req, res, next) {
    queries.getRevenueAndExpenditure(function (err, resultA) {
        if (err) {
            console.log(err);
        } else {
            queries.getAverageDays(function (err, resultB) {
                if (err) {
                    console.log(err);
                } else {
                    queries.getMailDeliveries(function (err, resultC) {
                        if (err) {
                            console.log(err);
                        } else {
                            res.render('business-monitoring', {
                                signedInUser: queries.getSignedInUser(), manager: queries.isManager(),
                                routes: resultA, avgDays: resultB, mailDeliveries: resultC, queries: queries
                            });

                        }
                    });
                }

            });
        }
    });
});


module.exports = router;