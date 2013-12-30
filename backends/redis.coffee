###

    Friendly Dragon Backends - Redis

                    __                  __
                   ( _)                ( _)
                  / / \\              / /\_\_
                 / /   \\            / / | \ \
                / /     \\          / /  |\ \ \
               /  /   ,  \ ,       / /   /|  \ \
              /  /    |\_ /|      / /   / \   \_\
             /  /  |\/ _ '_| \   / /   /   \    \\
            |  /   |/  0 \0\    / |    |    \    \\
            |    |\|      \_\_ /  /    |     \    \\
            |  | |/    \.\ o\o)  /      \     |    \\
            \    |     /\\`v-v  /        |    |     \\
             | \/    /_| \\_|  /         |    | \    \\
             | |    /__/_     /   _____  |    |  \    \\
             \|    [__]  \_/  |_________  \   |   \    ()
              /    [___] (    \         \  |\ |   |   //
             |    [___]                  |\| \|   /  |/
            /|    [____]                  \  |/\ / / ||
           (  \   [____ /     ) _\      \  \    \| | ||
            \  \  [_____|    / /     __/    \   / / //
            |   \ [_____/   / /        \    |   \/ //
            |   /  '----|   /=\____   _/    |   / //
         __ /  /        |  /   ___/  _/\    \  | ||
        (/-(/-\)       /   \  (/\/\)/  |    /  | /
                      (/\/\)           /   /   //
                             _________/   /    /
                            \____________/    (

###
'use strict'

_ = require 'lodash'
debug = require 'debug'
logger = debug 'FD-Backends-Redis'

url = require 'url'
redis = require 'redis'

redisBackend = (app, options = {}) ->
	logger 'redisBackend %s %s', app, options

	app.backends.redis = { }
	verbose = options.get 'verbose' or true
	namespace = options.get('namespace') or 'friendlydragon'
	redisURL = url.parse options.get('uri') or 'localhost:6379'
	redisClient = redis.createClient redisURL.port, redisURL.hostname
	redisClient.on 'error', (err) -> logger 'Redis Client Error %s', err
	namespacedRedisClient = app.backends.redis = new RedisNS namespace, redisClient
	namespacedRedisClient.on 'ready', (ready) -> logger 'Redis Client Ready %s', namespacedRedisClient

module.exports = redisBackend
