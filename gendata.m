% Common terminology

%Forced outage. An outage that results from emergency conditions
%directly associated with a component requiring that it be taken out of
%service immediately, either automatically or as soon as switching
%operations can be performed, or an outage caused by improper operation of 
%equipment or human error.

%Mean time to failure (MTTF) is the length of time a device or other product
%is expected to last in operation.

%Mean Time to Repair (MTTR) is an important failure metric that measures the
%time it takes to troubleshoot and fix failed equipment or systems. 
%By tracking MTTR, organizations can see how well they are responding to 
%unplanned maintenance events and identify areas for improvement.

function gdata = gendata(  )

%Column wise data:
%Unit size(MW)No. of units  MTTF(hours) MTTR(hours)Forced outage rate

gdata = [

12	5	2940	60	0.0200
20	4	450     50	0.1000
50	6	1980	20	0.0100
76	4	1960	40	0.0200
100	3	1200	50	0.0400
155	4	960     40	0.0400
197	3	950     50	0.0500
350	1	1150	100	0.0800
400	2	1100	150	0.1200];

end
