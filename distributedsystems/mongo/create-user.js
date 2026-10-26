db.getSiblingDB("admin").createUser({user:"store_admin",pwd:"change-this-mongodb-password",roles:[{role:"root",db:"admin"}]})
