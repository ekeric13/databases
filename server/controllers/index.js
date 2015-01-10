var models = require('../models');
var bluebird = require('bluebird');



module.exports = {
  messages: {
    get: function (req, res) {
      // models.messages.get(function(error, results){
      //   do something with response
      // })
    }, // a function which handles a get request for all messages
    post: function (req, res) {} // a function which handles posting a message to the database
  },

  users: {
    // Ditto as above
    get: function (req, res) {
      models.users.get();
    },
    post: function (req, res) {
      console.log(models.users.post(req.body.user_id));
      res.writeHead(201, {"Content-Type": "application/json"});
      res.end("ended");
    }
  }
};

