/*
[DESCRIPTION]
This script will take ann object that is on a path (using a path controller) and make X copies of it along the spline.
[USAGE]
Select the object then run the script. The listener will come up and ask for the number of copies. Enter the number and hit enter.
[CREATION INFO]
Author:Paul Hormis
Last Updated: January 23, 2005
[VERSION HISTORY]
v1.00 Created
v2.00 Initial Public Posting
Copyright (C) 2004, 2005 Paul Hormis
This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
paul@time-in-motion.com
*/


OCLink = selection as array
OldLink = OCLink[1]
n = 1590

clearListener()

actionMan.executeAction 0 "40472"
NumberCopies = getKBValue prompt:"Enter the number of copies you want:"

for i in 1 to NumberCopies do
    (
        NewLink = copy OldLink
        newLink.pos.controller.percent = (newLink.pos.controller.percent - (100.0/n * (NumberCopies as float)))
        OldLink = NewLink
    )
clearListener()
