# foldingathome
Folding@home (FAH or F@h) is a distributed computing project for disease research that simulates protein folding, computational drug design, and other types of molecular dynamics. As of today, the project is using the idle resources of personal computers owned by volunteers from all over the world. Thousands of people contribute to the success of this project.

Learn more at https://foldingathome.org.

## Usage

To run the continer with default values:
``docker run robertnetz/foldingathome:7.4.4_amd64``

You can also pass some environment variables using:
``docker run -e USERNAME=johndoe -e TEAM=45700 -e POWER=FULL robertnetz/foldingathome:7.4.4_amd64``

## Supported environment parameters

* USERNAME
* TEAM
* PASSKEY
* POWER
  * LIGHT
  * MEDIUM
  * FULL
* CPUS
* CAUSE
  * ANY *(default)*
  * ALZHEIMERS
  * CANCER
  * HUNTINGTONS
  * PARKINSONS

