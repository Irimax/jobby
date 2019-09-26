const express = require("express");
const users = express.Router();
const cors = require("cors");
const jwtUtils = require("../assets/utils/jwt.utils");
const bcrypt = require("bcrypt");
const asyncLib = require("async");

require("../assets/utils/jwt.utils");
const passport = require("passport");
const requireToken = passport.authenticate('jwt', { session: false });


const models = require("../../models/");

users.use(cors());

function GetTokenForUser(userData) {
    const timeStamp = new Date().getTime();
    return jwt.encodeURI(
        {
            sub: userData.id,
            iat: timeStamp
        },
        config.secret
    );
}



// Constants
const EMAIL_REGEX = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
const PASSWORD_REGEX = /^(?=.*\d)(?=[A-Z].*)(?=.*[`~!@#$%^&*()_\-+={}[\]\\|:;"'<>,\.\?\/]$).{8,30}$/;


/*=============================================
=            Section Regiter            =
=============================================*/

users.post("/signup", (req, res) => {
    const userData = {
        email: req.body.email,
        password: req.body.password,
        username: req.body.username,
        bio: req.body.bio,
        isAdmin: 0
    };

    if (req.body.email == null || req.body.username == null || req.body.password == null) {
        return res.status(400).json({ error: "missing parameters" });
    }

    if (req.body.username.length >= 13 || req.body.username.length <= 4) {
        return res
            .status(400)
            .json({ error: "wrong username (must be length 5 - 12)" });
    }

    if (!EMAIL_REGEX.test(req.body.email)) {
        return res.status(400).json({ error: "email is not valid" });
    }

    if (!PASSWORD_REGEX.test(req.body.password)) {
        return res.status(400).json({
            error:
                "password invalid (must length  - 30 and include 1 number at least)"
        });
    }

    models.User.findOne({
        attributes: ["email"],
        where: {
            email: req.body.email
        }
    })
        .then(userFound => {
            if (!userFound) {
                bcrypt.hash(req.body.password, 10, (err, bcryptedPassword) => {
                    userData.password = bcryptedPassword
                    let newUser = models.User.create(userData)
                        .then(newUser => {
                            return res.status(201).json({ token: GetTokenForUser(newUser) })
                        })
                })
                    .catch((err) => {
                        return res.status(500).json({ error: "cannot add user" });
                    })
            } else {
                return res.status(409).json({ error: "user already exist" });
            }
        })
})


/*=====  End of Section Regiter  ======*/






/*=============================================
=            Section Login            =
=============================================*/

users.post("/signin", (req, res) => {
    if (req.body.email == null || req.body.password == null) {
        return res.status(400).json({ error: "missing parameters" });
    }

    asyncLib.waterfall(
        [
            function (done) {
                models.User.findOne({
                    where: {
                        email: req.body.email
                    }
                })
                    .then(function (userFound) {
                        done(null, userFound);
                    })
                    .catch(function (err) {
                        return res.status(500).json({ error: "unable to verify user" });
                    });
            },
            function (userFound, done) {
                if (userFound) {
                    bcrypt.compare(req.body.password, userFound.password, function (
                        errBycrypt,
                        resBycrypt
                    ) {
                        done(null, userFound, resBycrypt);
                    });
                } else {
                    return res.status(404).json({ error: "user not exist in DB" });
                }
            },
            function (userFound, resBycrypt, done) {
                if (resBycrypt) {
                    done(userFound);
                } else {
                    return res.status(403).json({ error: "invalid password" });
                }
            }
        ],
        function (userFound) {
            if (userFound) {
                const token = jwtUtils.generateTokenForUser(userFound)
                return res.status(200).json({
                    'userName': userFound.username,
                    token
                });
            } else {
                return res.status(500).json({ error: "cannot log on user" });
            }
        }
    );
}),


    /*=====  End of Section Login  ======*/



    /*=============================================
    =            Section Profile            =
    =============================================*/
    users.get("/profile", (req, res) => {

        // Getting auth header
        var headerAuth = req.headers["authorization"];
        var userId = jwtUtils.getUserId(headerAuth);

        if (userId < 0) return res.status(400).json({ error: "wrong token" });

        models.User.findOne({
            attributes: ["id", "email", "username", "bio"],
            where: { id: userId }
        })
            .then(user => {
                if (user) {
                    res.status(201).json(user);
                } else {
                    res.status(404).json({ error: "user not found" });
                }
            })
            .catch(err => {
                res.status(500).json({ error: "cannot fetch user" });
            });

    });
/*=====  End of Section Profile  ======*/


/*=============================================
=            Section Update profile            =
=============================================*/
users.put("/update_profile", (req, res) => {

    // Getting auth header
    var headerAuth = req.headers["authorization"];
    var userId = jwtUtils.getUserId(headerAuth);

    // Params
    var bio = req.body.bio;

    asyncLib.waterfall(
        [
            function (done) {
                models.User.findOne({
                    attributes: ["id", "bio", "username"],
                    where: { id: userId }
                })
                    .then(function (userFound) {
                        done(null, userFound);
                    })
                    .catch(function (err) {
                        return res.status(500).json({ error: "unable to verify user" });
                    });
            },
            function (userFound, done) {
                if (userFound) {
                    userFound
                        .update({
                            bio: bio ? bio : userFound.bio,

                        })
                        .then(function (userFound) {
                            done(userFound);
                        })
                        .catch(function (err) {
                            res.status(500).json({ error: "cannot update user" });
                        });
                } else {
                    res.status(404).json({ error: "user not found" });
                }
            }
        ],
        function (userFound) {
            if (userFound) {
                return res.status(201).json(userFound);
            } else {
                return res.status(500).json({ error: "cannot update user profile" });
            }
        }
    );

});

/*=====  End of Section Update profile  ======*/



/*=============================================
 =            Section Token Secure            =
 =============================================*/
users.get("/tokensecure", requireToken, (req, res) => {
    res.send({ result: "Security Page Token" })

});
/*=====  End of  Section Token Secure    ======*/

module.exports = users;