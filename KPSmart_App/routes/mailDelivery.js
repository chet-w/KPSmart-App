var express = require('express');
var router = express.Router();
var queries = require('../queries');
var db = require('../db/config');
var eventlogger = require('../eventlogger');


/* Global vars */
var total_cost = 0, _weight = 0, _volume = 0, days = 0,
    route_id = -1, _origin = '', _dest = '', _freight = '',
    _company = '';

/* GET users listing. */
router.get('/', function (req, res, next) {
    db.any('select Distinct route.origin from route where is_active=$1'
        , [true])
        .then(data => {
            res.render('mail-delivery', {
                signedInUser: queries.getSignedInUser(),
                manager: queries.isManager(),
                data: data
            });
        })
        .catch(error => {
            console.log('Error: ' + error);
        });
});


//---------Add a new mail-----------
router.post('/', function (req, res) {

    _origin = req.body.origin;
    _dest = req.body.destination;
    _freight = req.body.type_freight;
    _weight = req.body.weight;
    _volume = req.body.volume;

    //incompleted form
    if (_origin == '' || _dest == '' || _freight == '' || _weight == '' || _volume == '') {

        res.render('mail-delivery',
            {
                signedInUser: queries.getSignedInUser(),
                manager: queries.isManager(),
                message: 'Please make sure all fields are entered and try again'
            });
        //duplicate location
    } else if (_origin == _dest) {
        res.render('mail-delivery',
            {
                signedInUser: queries.getSignedInUser(),
                manager: queries.isManager(),
                message: 'Parcel cannot have the same Origin and Destination!'
            });
        //negitive numbers
    } else if (Number(_weight) <= 0 || Number(_volume) <= 0) {
        res.render('mail-delivery',
            {
                signedInUser: queries.getSignedInUser(),
                manager: queries.isManager(),
                message: 'Please, weight or volume only accept positive value.'
            });
        //undefined freight
    } else if (_freight != 'Low' && _freight != 'High') {
        res.render('mail-delivery',
            {
                signedInUser: queries.getSignedInUser(),
                manager: queries.isManager(),
                message: 'Please, choose one of the available freight.'
            });
    } else {
        //database search for that route with same origin and destination
        db.any('select * from route where origin=$1 and destination=$2 and priority=$3',
            [_origin, _dest, _freight])
            .then(data => {
                // total cost
                total_cost = data[0].cost_per_kg_customer * data[0].cost_per_volume_customer * _weight * _volume;
                var random_day = Math.floor(Math.random() * 3);

                days = data[0].travel_time + random_day;
                route_id = data[0].id;
                _freight = data[0].deliverytype;
                _company = data[0].transportfirm;

                res.render('mail-delivery-confirm', {
                    signedInUser: queries.getSignedInUser(),
                    manager: queries.isManager(),
                    origin: _origin,
                    dest: _dest,
                    freight: _freight,
                    company: _company,
                    weight: _weight,
                    volume: _volume,
                    send_date: new Date(),
                    travel_date: days,
                    cost: total_cost
                });

            })
            .catch(error => {
                console.log('Error:', error);
                res.render('mail-delivery',
                    {message: 'Please, Choose the locations from options, try again.'});
            });
    }
});



router.post('/confirm', function (req, res) {
    db.one('insert into mail values(default,$1,$2,$3,current_date,current_date+$4,$5,$6) returning *',
        [total_cost, _weight, _volume, days, false, route_id])
        .then(data => {
            res.render('receipt', {
                message: 'Mail has been processed!',
                signedInUser: queries.getSignedInUser(),
                manager: queries.isManager(),
                _id: data.id,
                origin: _origin,
                dest: _dest,
                freight: _freight,
                company: _company,
                weight: _weight,
                volume: _volume,
                send_date: new Date(),
                arrive_date: data.arrive_date,
                routeid: route_id,
                cost: total_cost
            });
        var mail = {id:data.id, cost: total_cost, weight: _weight, volume: _volume, send_date: new Date().toDateString(),
        arrive_date: data.arrive_date.toDateString(), is_arrived: false, route_id: route_id };
        eventlogger.logEvent(mail, 'mail');
        })
        .catch(error => {
            console.error('Error:', error);

        });




});

module.exports = router;
