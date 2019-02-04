# foldingathome
Folding@home (FAH or F@h) is a distributed computing project for disease research that simulates protein folding, computational drug design, and other types of molecular dynamics. As of today, the project is using the idle resources of personal computers owned by volunteers from all over the world. Thousands of people contribute to the success of this project.

Learn more at https://foldingathome.org.

## Usage

To run the continer with default values:
``docker run robertnetz/foldingathome:7.5.1_amd64``

You can also pass some environment variables using:
``docker run -e USERNAME=johndoe -e TEAM=45700 -e POWER=FULL robertnetz/foldingathome:7.5.1_amd64``

The following environment variables are available:

|Environment Variable|Description|Default Value|Available Values|
| ------------- |:-------------|:-------------|:-----|
|USERNAME|your donor id|1437|*(any donor id)*|
|TEAM|the team to contribute to|0|*(any team id)*|
|PASSKEY|a passkey if you like to use one|*(empty)*|*(passkey)*|
|POWER|power utilization|FULL|LIGHT, MEDIUM, FULL|
|CPUS|number of cpus to use|*(all)*|*(integer)*|
|CAUSE|project category to contribute to|ANY|ANY, ALZHEIMERS, CANCER, HUNTINGTONS, PARKINSONS|
