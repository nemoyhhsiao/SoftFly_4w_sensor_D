function lut = gen_lut

    voltage = [700 1000 1150 1300 1450 1530 ];
    thrust  = [0   50   120 200  300  400 ];
    
    lut.T1 = thrust;
    lut.v1 = voltage;
    
    lut.T2 = thrust;
    lut.v2 = voltage;
    
    lut.T3 = thrust;
    lut.v3 = voltage;
    
    lut.T4 = thrust;
    lut.v4 = voltage;

end