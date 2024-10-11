    function targMap = targDataMap(),

    ;%***********************
    ;% Create Parameter Map *
    ;%***********************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 3;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc paramMap
        ;%
        paramMap.nSections           = nTotSects;
        paramMap.sectIdxOffset       = sectIdxOffset;
            paramMap.sections(nTotSects) = dumSection; %prealloc
        paramMap.nTotData            = -1;

        ;%
        ;% Auto data (SLDRT_UDP_P)
        ;%
            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% SLDRT_UDP_P.PacketInput3_MaxMissedTicks
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% SLDRT_UDP_P.PacketInput4_MaxMissedTicks
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

                    ;% SLDRT_UDP_P.PacketInput3_YieldWhenWaiting
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 2;

                    ;% SLDRT_UDP_P.PacketInput4_YieldWhenWaiting
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            paramMap.sections(1) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% SLDRT_UDP_P.PacketInput3_PacketID
                    section.data(1).logicalSrcIdx = 4;
                    section.data(1).dtTransOffset = 0;

                    ;% SLDRT_UDP_P.PacketInput4_PacketID
                    section.data(2).logicalSrcIdx = 5;
                    section.data(2).dtTransOffset = 1;

            nTotData = nTotData + section.nData;
            paramMap.sections(2) = section;
            clear section

            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% SLDRT_UDP_P.Gain5_Gain
                    section.data(1).logicalSrcIdx = 6;
                    section.data(1).dtTransOffset = 0;

                    ;% SLDRT_UDP_P.converttoradian_Gain
                    section.data(2).logicalSrcIdx = 7;
                    section.data(2).dtTransOffset = 1;

                    ;% SLDRT_UDP_P.Constant3_Value
                    section.data(3).logicalSrcIdx = 8;
                    section.data(3).dtTransOffset = 2;

            nTotData = nTotData + section.nData;
            paramMap.sections(3) = section;
            clear section


            ;%
            ;% Non-auto Data (parameter)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        paramMap.nTotData = nTotData;



    ;%**************************
    ;% Create Block Output Map *
    ;%**************************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 4;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc sigMap
        ;%
        sigMap.nSections           = nTotSects;
        sigMap.sectIdxOffset       = sectIdxOffset;
            sigMap.sections(nTotSects) = dumSection; %prealloc
        sigMap.nTotData            = -1;

        ;%
        ;% Auto data (SLDRT_UDP_B)
        ;%
            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% SLDRT_UDP_B.Gain5
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% SLDRT_UDP_B.DataTypeConversion2
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 12;

                    ;% SLDRT_UDP_B.sensor_EulXYZ
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 15;

            nTotData = nTotData + section.nData;
            sigMap.sections(1) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% SLDRT_UDP_B.PacketInput3_o1
                    section.data(1).logicalSrcIdx = 3;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(2) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% SLDRT_UDP_B.PacketInput4_o1
                    section.data(1).logicalSrcIdx = 4;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(3) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% SLDRT_UDP_B.dataready
                    section.data(1).logicalSrcIdx = 5;
                    section.data(1).dtTransOffset = 0;

                    ;% SLDRT_UDP_B.PacketInput4_o2
                    section.data(2).logicalSrcIdx = 6;
                    section.data(2).dtTransOffset = 1;

            nTotData = nTotData + section.nData;
            sigMap.sections(4) = section;
            clear section


            ;%
            ;% Non-auto Data (signal)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        sigMap.nTotData = nTotData;



    ;%*******************
    ;% Create DWork Map *
    ;%*******************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 1;
        sectIdxOffset = 4;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc dworkMap
        ;%
        dworkMap.nSections           = nTotSects;
        dworkMap.sectIdxOffset       = sectIdxOffset;
            dworkMap.sections(nTotSects) = dumSection; %prealloc
        dworkMap.nTotData            = -1;

        ;%
        ;% Auto data (SLDRT_UDP_DW)
        ;%
            section.nData     = 9;
            section.data(9)  = dumData; %prealloc

                    ;% SLDRT_UDP_DW.PacketInput3_PWORK
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% SLDRT_UDP_DW.PacketInput4_PWORK
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

                    ;% SLDRT_UDP_DW.Scope10_PWORK.LoggedData
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 2;

                    ;% SLDRT_UDP_DW.Scope11_PWORK.LoggedData
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 3;

                    ;% SLDRT_UDP_DW.Scope12_PWORK.LoggedData
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 5;

                    ;% SLDRT_UDP_DW.Scope8_PWORK.LoggedData
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 7;

                    ;% SLDRT_UDP_DW.Scope9_PWORK.LoggedData
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 8;

                    ;% SLDRT_UDP_DW.TAQOutportLogging_InsertedFor_PacketInput3_at_outport_1_PWORK.AQHandles
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 9;

                    ;% SLDRT_UDP_DW.Vicon2bodiesdataready_PWORK.LoggedData
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 10;

            nTotData = nTotData + section.nData;
            dworkMap.sections(1) = section;
            clear section


            ;%
            ;% Non-auto Data (dwork)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        dworkMap.nTotData = nTotData;



    ;%
    ;% Add individual maps to base struct.
    ;%

    targMap.paramMap  = paramMap;
    targMap.signalMap = sigMap;
    targMap.dworkMap  = dworkMap;

    ;%
    ;% Add checksums to base struct.
    ;%


    targMap.checksum0 = 3344807711;
    targMap.checksum1 = 4029903531;
    targMap.checksum2 = 3934981957;
    targMap.checksum3 = 2396835587;

