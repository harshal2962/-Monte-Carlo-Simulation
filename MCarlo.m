function output = MCarlo(mcinput)
ldc= mcinput.LDC;
sample_year = mcinput.sampleyr;
generation_data= mcinput.gdata;
lgt = length(ldc);
 generator_MegaWatts= generation_data(:,1);
 generator_number= generation_data(:,2);
 mean_time_to_failure= generation_data(:,3);
 mean_time_to_repair= generation_data(:,4);
 gencapin=0;
 nf= length(generator_MegaWatts);
     for i= 1:nf
         gencapin= gencapin + generator_MegaWatts(i,1)* generator_number(i,1);
         
     end
     
disp([ ' Installed generation capacity : ' num2str(gencapin)]);   
       
jjj = (1:length(ldc))';        
number_of_possible_scenarios = length(generation_data(:,1));
  %%
  LOLE_yearly = zeros(1,sample_year);
  EENS_yearly = zeros(1,sample_year);
  
  for year = 1:sample_year
      u = jjj;
          for a= 1:number_of_possible_scenarios
              for b= 1:generator_number(a)          
                  t1 = 1;
                  while (1)              
                      tnext = -mean_time_to_failure(a)*log(rand);
                      tnext = ceil(tnext);              
                      t2 = t1 + tnext;
                      if t2 < lgt
                          mw(t1:t2) = generator_MegaWatts(a);                  
                      else
                          t2 = lgt;
                          mw(t1:t2) = generator_MegaWatts(a);                  
                      end
                      
                      t1 = t2;                    
                      tnext1  = -mean_time_to_repair(a)*log(rand);
                      tnext1  =  ceil(tnext1);    
                      
                      if t1>= lgt
                              break;
                      else
                          t2 = t1 + tnext1;
                          if t2 < lgt
                              mw(t1:t2) = 0;
                              t1 = t2;
                          else
                              t2 = lgt;
                              mw(t1:t2) = 0;
                              t1 = t2;
                          end
                      end

                  end
                  u= [u,mw'];
                  
              end
          end
 
     MWoutput =u;
     MWoutput(:,1)=[];
     sumofallunits = sum(MWoutput,2);
     margin = sumofallunits - ldc;
     r = length(find(margin<0));
     q = sum(margin(find(margin<0)));
     LOLE = r;
     EENS =abs(q);
     %disp(['Year: ' num2str(hh) '  LOLE : ' num2str(LOLE) ' hrs/year, and EENS : ' num2str(EENS) ' kWh/year.' ]);
    LOLE_yearly(1,year) = LOLE;
    EENS_yearly(1,year) = EENS;
  end
  
  
  LOLE_final = sum(LOLE_yearly) / sample_year;
  EENS_final = sum(EENS_yearly) / sample_year;
  LOLE_cm    = cumsum(LOLE_yearly);
  EENS_cm    = cumsum(EENS_yearly);
  length_L   = length(LOLE_yearly);
  LOLE_C     = LOLE_cm ./ [1:length_L];
  EENS_C     = EENS_cm ./ [1:length_L];
  
  figure(1)
  plot(LOLE_C)
  title('Loss Of Load Expectation hrs/year')
  axis([1 length_L 0 max(LOLE_C)])
  ylabel('LOLE')
  xlabel('Sample size(Number of years')
  
  figure(2)
  plot(EENS_C)
  title('Expected Energy Not Supplied kWh/year')
  axis([1 length_L 0 max(EENS_C)])
  ylabel('EENS')
  xlabel('Sample size(Number of years)')
  
  figure(3)
  % frequency(years)vs number of days of trouble
  histogram(LOLE_yearly)
 
  output.LOLE = LOLE_final;
  output.EENS = EENS_final;
  output.LOLEYr = LOLE_yearly;
  
end