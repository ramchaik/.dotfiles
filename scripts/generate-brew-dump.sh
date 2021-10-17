#!/bin/bash
echo "*** start [generate brew dump] ***"

rm Brewfile &> /dev/null
brew bundle dump --describe                                                                                                  
echo "*** done [generate brew dump] ***"