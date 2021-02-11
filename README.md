<p align="center">
    <a href="https://github.com/kimrojas/COARE-utility" >
        <img src="https://asti.dost.gov.ph/wp-content/uploads/2018/07/1955073207.png">
    </a>
    <h1 align="center" >COARE Utility functions</h1>
    <h3 align="center"> Written by Kurt Irvin M. Rojas </h3>
</br>

</p>
  

## Introduction
<br>

This is a set of utilities functions that I have made and compiled for use in the COARE cluster of   
DOST PHILIPPINES. 

As of now, there is only the **local-util** directory, that is composed of the function to be used  
in the local machine. 

</br>  

## Installation:
</br>

1. Download the repository  
*Assume you have `git` package installed, else just manually download from the link.*
```bash
git clone https://github.com/kimrojas/COARE-utility.git
```

2. Setup the login credentials  
*In `/<path_to_file>/COARE-utility/local-util/SETUP_local-util.sh`*,  
Edit the needed credentials, i.e.
```bash
## SSH id location [typical: $HOME/.ssh/id_rsa]
c_SSHDIR=$HOME/.ssh/coare

## COARE username
c_USERNAME=<user.name>

## COARE hostname
c_HOSTNAME=saliksik.asti.dost.gov.ph

## Mount location of COARE directory
c_MNTLOC=$HOME/COARE-DIR
```

3. Register the library    
*Add the following line in the last line of your startup script (.bashrc or .bash_profile)
```bash
source /<path_to_files>/COARE-util/local-util/SETUP_local-util.sh
```

4. Configure ssh properties  
*For easy configuration, use:
```bash
echo """
host *
    ServerAliveInterval 60
""" >> $HOME/.ssh/config
```
*If you have an existing config, please edit it manually with the proper hostname. 

*The library should be properly set up on terminal restart*

<br>

## Usage: 
<br>
When the Installation procedures are finished successfully, using the functions should be   
straightforward. Use:   

```bash
<function> [option | use 'help' for more info]
c_login help
```
<br> 

## Contents
<br>

### Local utility  
1. `c_login` - Simplified login command to COARE.
2. `c_transfer` - Command to migrate files between local and server machine via `rsync`.
3. `c_mount` - Mount and unmount the server directory to the local directory.

<br>

## Copyright
<br>

   Copyright 2021 Kurt Irvin M. Rojas

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
