#!/bin/bash
# Gapertium - CLI Front-end for Apertium
# Copyright (C) 2018  Iván Ávalos <ivan.avalos.diaz@hotmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

SRC=$(pwd)/gapertium.sh
DEST=/usr/local/bin/gapertium

chmod +x gapertium.sh
sudo ln -s $SRC $DEST
