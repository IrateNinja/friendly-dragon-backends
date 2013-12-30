###

    Friendly Dragon Backends

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
logger = debug 'FD-Backends'

backends = (app, options = {}) ->
	logger 'backends %s %s', app, options

	require('./backends/redis.coffee')(app,options.redis)

	return


module.exports = backends
