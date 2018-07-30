#!/bin/bash

ps -arcwwwxo "command %mem %cpu" | grep -v grep | head -10
