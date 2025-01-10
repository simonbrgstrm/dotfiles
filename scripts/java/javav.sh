#!/usr/bin/env bash

# List available Java versions
javaversion=$(update-java-alternatives --list | fzf)

# Set the JAVA_HOME and PATH variables
export JAVA_HOME=/usr/lib/jvm/$javaversion/
export PATH=$PATH:$JAVA_HOME/bin

# Update the default Java version
sudo update-alternatives --config java
