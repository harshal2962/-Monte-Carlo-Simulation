% Daily peak demand over a year

%Table 1 presents the annual load model in terms of the weekly peak loads
%as a percentage of the annual peak load. If Week 1 is taken as the first week in
%January then the load model represents a winter peaking system. A summer peaking
%system can be created by taking a suitable time for Week 1.

%Table 2 presents the daily peak load cycle, as a percentage of the weekly
%peak. The same weekly peak load cycle is assumed to apply for all times of the year.
%The data in Tables 1 and 2 defines a daily peak load model of 364 days with
%Monday as the first day of the year.

%Table 3 gives weekday hourly load data for winter season instead 
%data of weekday and weekend hourly load data for each of three seasons can also be used. 
%The output combines the data given in Tables 1- 3 defines an hourly load model
%of 8736 hours

function output = LDC(peak)
%table 1 Weekly peak load as a percentage of annual peak
yload=[
    1 86.2
    2 90.0
    3 87.8
    4 83.4
    5 88.0
    6 84.1
    7 83.2
    8 80.6
    9 74.0
    10 73.7
    11 71.5
    12 72.7
    13 70.4
    14 75.0
    15 72.1
    16 80.0
    17 75.4
    18 83.7
    19 87.0
    20 88.0
    21 85.6
    22 81.1
    23 90.0
    24 88.7
    25 89.6
    26 86.1
    27 75.5
    28 81.6
    29 80.1
    30 88.0
    31 72.2
    32 77.6
    33 80.0
    34 72.9
    35 72.6
    36 70.5
    37 78.0
    38 69.5
    39 72.4
    40 72.4
    41 74.3
    42 74.4
    43 80.0
    44 88.1
    45 88.5
    46 90.9
    47 94.0
    48 89.0
    49 94.2
    50 97.0
    51 100.0
    52 95.2
    ];
%table 2 Daily peak load as a percentage of weekly peak
wload=[
    1 93
    2 100
    3 98
    4 96
    5 94
    6 77
    7 75
    ];
%table 3 Hourly peak load as a percentage of daily peak
dload=[
    1 67
    2 63
    3 60
    4 59
    5 59
    6 60
    7 74
    8 86
    9 95
    10 96
    11 96
    12 95
    13 95
    14 95
    15 93
    16 94
    17 99
    18 100
    19 100
    20 96
    21 91
    22 83
    23 73
    24 63
    ];
ny=size(yload,1);
nw=size(wload,1);
nd=size(dload,1);
yload(:,2)=yload(:,2)/100;
wload(:,2)=wload(:,2)/100;
dload(:,2)=dload(:,2)/100;
t=0;
%%
x=zeros(ny*nw*nd,1);LDCload=zeros(ny*nw*nd,1);
for i=1:ny(1)
    for j=1:nw(1)
        for k=1:nd(1)
            t=t+1;
            x(t,1)=t;
            LDCload(t,1)=yload(i,2)*wload(j,2)*dload(k,2);
        end
    end
end

ldc= LDCload*peak;
output = ldc;
end