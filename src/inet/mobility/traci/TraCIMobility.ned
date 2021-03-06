//
// Copyright (C) 2006-2012 Christoph Sommer <christoph.sommer@uibk.ac.at>
//
// Documentation for these modules is at http://veins.car2x.org/
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
//

package inet.mobility.traci;

import inet.mobility.base.MovingMobilityBase;

//
// Used in modules created by the TraCIScenarioManager.
//
// This module relies on the TraCIScenarioManager for state updates
// and can not be used on its own.
//
// See the Veins website <a href="http://veins.car2x.org/"> for a tutorial, documentation, and publications </a>.
//
// @author Christoph Sommer, David Eckhoff, Luca Bedogni, Bastian Halmos, Stefan Joerer
//
// @see TraCIScenarioManager
// @see TraCIScenarioManagerLaunchd
//
simple TraCIMobility extends MovingMobilityBase
{
    parameters:
        @class(TraCIMobility);
        @display("i=block/cogwheel");
        double initialX @unit(m) = default(uniform(constraintAreaMinX, constraintAreaMaxX));
        double initialY @unit(m) = default(uniform(constraintAreaMinY, constraintAreaMaxY));
        double initialZ @unit(m) = default(nanToZero(uniform(constraintAreaMinZ, constraintAreaMaxZ)));
        bool initFromDisplayString = default(false);
        
        bool debug = default(false);  // debug switch
        double antennaPositionOffset @unit("m") = default(0.0m);  // position offset of the antenna of the front of the car
        int accidentCount = default(0);  // number of accidents
        double accidentStart @unit("s") = default(uniform(30s,60s));  // time until first accident, relative to departure time
        volatile double accidentDuration @unit("s") = default(uniform(30s,60s));  // duration of accident
        volatile double accidentInterval @unit("s") = default(uniform(30s,60s));  // time between accidents
}

