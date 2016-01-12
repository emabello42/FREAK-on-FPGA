<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex5" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_6(10:0)" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8(28:0)" />
        <signal name="XLXN_9" />
        <signal name="CLK" />
        <signal name="XLXN_11" />
        <signal name="ENABLE_IN" />
        <signal name="INPUT_DATA(28:0)" />
        <signal name="XLXN_15(134:0)" />
        <signal name="XLXN_16(134:0)" />
        <signal name="XLXN_17" />
        <signal name="RST" />
        <signal name="XLXN_20" />
        <signal name="XLXN_21" />
        <signal name="GAUSS_KERNEL_ID(3:0)" />
        <signal name="OUTPUT_DATA(16:0)" />
        <signal name="ENABLE_OUT" />
        <signal name="XLXN_25" />
        <port polarity="Input" name="CLK" />
        <port polarity="Input" name="ENABLE_IN" />
        <port polarity="Input" name="INPUT_DATA(28:0)" />
        <port polarity="Input" name="RST" />
        <port polarity="Input" name="GAUSS_KERNEL_ID(3:0)" />
        <port polarity="Output" name="OUTPUT_DATA(16:0)" />
        <port polarity="Output" name="ENABLE_OUT" />
        <blockdef name="VerticalConvolution">
            <timestamp>2014-5-18T14:11:20</timestamp>
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="528" y1="-224" y2="-224" x1="464" />
            <rect width="64" x="464" y="-236" height="24" />
            <line x2="528" y1="-160" y2="-160" x1="464" />
            <rect width="400" x="64" y="-256" height="320" />
        </blockdef>
        <blockdef name="HorizontalConvolution">
            <timestamp>2014-5-18T14:10:29</timestamp>
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="528" y1="-224" y2="-224" x1="464" />
            <rect width="64" x="464" y="-236" height="24" />
            <line x2="528" y1="-160" y2="-160" x1="464" />
            <rect width="400" x="64" y="-256" height="320" />
        </blockdef>
        <blockdef name="IntermediateBufferConv">
            <timestamp>2014-5-18T14:11:7</timestamp>
            <rect width="352" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="480" y1="-224" y2="-224" x1="416" />
            <rect width="64" x="416" y="-44" height="24" />
            <line x2="480" y1="-32" y2="-32" x1="416" />
        </blockdef>
        <blockdef name="rom_coe">
            <timestamp>2014-5-18T14:11:28</timestamp>
            <rect width="320" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="384" y="-108" height="24" />
            <line x2="448" y1="-96" y2="-96" x1="384" />
        </blockdef>
        <block symbolname="VerticalConvolution" name="XLXI_6">
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="ENABLE_IN" name="enableIn" />
            <blockpin signalname="XLXN_15(134:0)" name="gaussianKernel(134:0)" />
            <blockpin signalname="INPUT_DATA(28:0)" name="inputArray(28:0)" />
            <blockpin signalname="XLXN_7" name="enableOut" />
            <blockpin signalname="XLXN_6(10:0)" name="outputData(10:0)" />
            <blockpin signalname="RST" name="rst" />
        </block>
        <block symbolname="IntermediateBufferConv" name="XLXI_7">
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="XLXN_7" name="enableIn" />
            <blockpin signalname="RST" name="rst" />
            <blockpin signalname="XLXN_6(10:0)" name="inputValue(10:0)" />
            <blockpin signalname="XLXN_9" name="enableOut" />
            <blockpin signalname="XLXN_8(28:0)" name="outputData(28:0)" />
        </block>
        <block symbolname="HorizontalConvolution" name="XLXI_8">
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="XLXN_9" name="enableIn" />
            <blockpin signalname="XLXN_15(134:0)" name="gaussianKernel(134:0)" />
            <blockpin signalname="XLXN_8(28:0)" name="inputData(28:0)" />
            <blockpin signalname="ENABLE_OUT" name="enableOut" />
            <blockpin signalname="OUTPUT_DATA(16:0)" name="outputData(16:0)" />
            <blockpin signalname="RST" name="rst" />
        </block>
        <block symbolname="rom_coe" name="XLXI_9">
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="GAUSS_KERNEL_ID(3:0)" name="address(3:0)" />
            <blockpin signalname="XLXN_15(134:0)" name="data_out(134:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="592" y="928" name="XLXI_6" orien="R0">
        </instance>
        <instance x="2304" y="960" name="XLXI_8" orien="R0">
        </instance>
        <instance x="1408" y="928" name="XLXI_7" orien="R0">
        </instance>
        <branch name="XLXN_6(10:0)">
            <wire x2="1264" y1="704" y2="704" x1="1120" />
            <wire x2="1264" y1="704" y2="896" x1="1264" />
            <wire x2="1408" y1="896" y2="896" x1="1264" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="1408" y1="768" y2="768" x1="1120" />
        </branch>
        <branch name="XLXN_8(28:0)">
            <wire x2="2096" y1="896" y2="896" x1="1888" />
            <wire x2="2096" y1="864" y2="896" x1="2096" />
            <wire x2="2304" y1="864" y2="864" x1="2096" />
        </branch>
        <branch name="XLXN_9">
            <wire x2="2096" y1="704" y2="704" x1="1888" />
            <wire x2="2096" y1="704" y2="800" x1="2096" />
            <wire x2="2304" y1="800" y2="800" x1="2096" />
        </branch>
        <branch name="CLK">
            <wire x2="352" y1="560" y2="560" x1="208" />
            <wire x2="528" y1="560" y2="560" x1="352" />
            <wire x2="1344" y1="560" y2="560" x1="528" />
            <wire x2="1344" y1="560" y2="704" x1="1344" />
            <wire x2="1408" y1="704" y2="704" x1="1344" />
            <wire x2="2176" y1="560" y2="560" x1="1344" />
            <wire x2="2176" y1="560" y2="736" x1="2176" />
            <wire x2="2304" y1="736" y2="736" x1="2176" />
            <wire x2="528" y1="560" y2="704" x1="528" />
            <wire x2="592" y1="704" y2="704" x1="528" />
            <wire x2="352" y1="560" y2="1328" x1="352" />
            <wire x2="1312" y1="1328" y2="1328" x1="352" />
        </branch>
        <iomarker fontsize="28" x="208" y="560" name="CLK" orien="R180" />
        <branch name="ENABLE_IN">
            <wire x2="592" y1="768" y2="768" x1="224" />
        </branch>
        <iomarker fontsize="28" x="224" y="768" name="ENABLE_IN" orien="R180" />
        <branch name="INPUT_DATA(28:0)">
            <wire x2="592" y1="832" y2="832" x1="320" />
        </branch>
        <iomarker fontsize="28" x="320" y="832" name="INPUT_DATA(28:0)" orien="R180" />
        <instance x="1312" y="1424" name="XLXI_9" orien="R0">
        </instance>
        <branch name="XLXN_15(134:0)">
            <wire x2="592" y1="896" y2="896" x1="512" />
            <wire x2="512" y1="896" y2="1088" x1="512" />
            <wire x2="2032" y1="1088" y2="1088" x1="512" />
            <wire x2="2032" y1="1088" y2="1328" x1="2032" />
            <wire x2="2032" y1="1328" y2="1328" x1="1760" />
            <wire x2="2304" y1="928" y2="928" x1="2032" />
            <wire x2="2032" y1="928" y2="1088" x1="2032" />
        </branch>
        <iomarker fontsize="28" x="256" y="432" name="RST" orien="R180" />
        <branch name="RST">
            <wire x2="448" y1="432" y2="432" x1="256" />
            <wire x2="1296" y1="432" y2="432" x1="448" />
            <wire x2="2208" y1="432" y2="432" x1="1296" />
            <wire x2="2208" y1="432" y2="992" x1="2208" />
            <wire x2="2304" y1="992" y2="992" x1="2208" />
            <wire x2="1296" y1="432" y2="832" x1="1296" />
            <wire x2="1408" y1="832" y2="832" x1="1296" />
            <wire x2="448" y1="432" y2="960" x1="448" />
            <wire x2="592" y1="960" y2="960" x1="448" />
        </branch>
        <branch name="GAUSS_KERNEL_ID(3:0)">
            <wire x2="1296" y1="1392" y2="1392" x1="400" />
            <wire x2="1312" y1="1392" y2="1392" x1="1296" />
        </branch>
        <iomarker fontsize="28" x="400" y="1392" name="GAUSS_KERNEL_ID(3:0)" orien="R180" />
        <branch name="OUTPUT_DATA(16:0)">
            <wire x2="2848" y1="736" y2="736" x1="2832" />
            <wire x2="3104" y1="736" y2="736" x1="2848" />
        </branch>
        <branch name="ENABLE_OUT">
            <wire x2="2848" y1="800" y2="800" x1="2832" />
            <wire x2="3104" y1="800" y2="800" x1="2848" />
        </branch>
        <iomarker fontsize="28" x="3104" y="736" name="OUTPUT_DATA(16:0)" orien="R0" />
        <iomarker fontsize="28" x="3104" y="800" name="ENABLE_OUT" orien="R0" />
    </sheet>
</drawing>