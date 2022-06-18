#!/bin/bash
#//////////////////////////////////////////////////////////////
#//   ____                                                   //
#//  | __ )  ___ _ __  ___ _   _ _ __   ___ _ __ _ __   ___  //
#//  |  _ \ / _ \ '_ \/ __| | | | '_ \ / _ \ '__| '_ \ / __| //
#//  | |_) |  __/ | | \__ \ |_| | |_) |  __/ |  | |_) | (__  //
#//  |____/ \___|_| |_|___/\__,_| .__/ \___|_|  | .__/ \___| //
#//                             |_|             |_|          //
#//////////////////////////////////////////////////////////////
#//                                                          //
#//  Script, 2021                                            //
#//  Created: 27, May, 2021                                  //
#//  Modified: 05, January, 2022                             //
#//  file: -                                                 //
#//  -                                                       //
#//  Source: https://unix.stackexchange.com/a/39341/359833                                               //
#//          https://stackoverflow.com/a/42876846/10152334                                               //
#//          https://stackoverflow.com/a/3837487/10152334
#//  OS: ALL                                                 //
#//  CPU: ALL                                                //
#//                                                          //
#//////////////////////////////////////////////////////////////

docker-compose -f docker-compose.yml \
    --profile mc-proxy \
    --profile mc-server \
    --profile mc-server-waitroom \
    --profile mc-backup \
    --profile mc-web \
    down
