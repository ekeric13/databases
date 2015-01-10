var db = require('../db');
var util = require("util")




module.exports = {
  messages: {
    get: function () {
      // var query = "select"
      // db.query()

    }, // a function which produces all the messages
    post: function () {} // a function which can be used to insert a message into the database
  },

  users: {
    // Ditto as above.
    get: function (callback) {
      var query = "select * from users;"
      var result;
      db.query(query, function(error, users){
        // callback(users);
        // console.log(this, users);
        return users;
      })
    },
    post: function (params, res) {
      var query = "insert into users (username) values ('"+params+"')";
      return db.query(query, function(error, rows, fields){
        // console.log('rows: '+util.inspect(rows)+" fields: "+util.inspect(fields));
        if (error) {
          console.error('error connecting: ' + error.stack);
          return;
        }
      });
    }
  }
};

