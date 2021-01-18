clc
clear all

%peak = input('Peak demand = ');
peak = 2850;
gdata = gendata();
ldc = LDC(peak);
sampleyr = input(' sample years = ');


mcinput.LDC = ldc;
mcinput.gdata = gdata;
mcinput.sampleyr = sampleyr;

MCarlo(mcinput)