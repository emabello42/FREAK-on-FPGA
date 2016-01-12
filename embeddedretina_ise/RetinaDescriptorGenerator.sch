<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex5" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_16(511:0)" />
        <signal name="XLXN_18(7:0)" />
        <signal name="XLXN_19(7:0)" />
        <signal name="XLXN_17" />
        <signal name="XLXN_42(19:0)" />
        <signal name="XLXN_43" />
        <signal name="IMG_BASE_ADDR(31:0)" />
        <signal name="XLXN_114(31:0)" />
        <signal name="XLXN_115" />
        <signal name="XLXN_119" />
        <signal name="READ_MEM" />
        <signal name="ADDR_MEM(31:0)" />
        <signal name="XLXN_128" />
        <signal name="RST" />
        <signal name="XLXN_134(3:0)" />
        <signal name="XLXN_135" />
        <signal name="XLXN_136(9:0)" />
        <signal name="XLXN_137(9:0)" />
        <signal name="KPTS_ADDR(31:0)" />
        <signal name="XLXN_149" />
        <signal name="ENABLE" />
        <signal name="XLXN_150" />
        <signal name="CLK" />
        <signal name="XLXN_155" />
        <signal name="XLXN_156" />
        <signal name="XLXN_157" />
        <signal name="XLXN_158" />
        <signal name="XLXN_159" />
        <signal name="XLXN_160" />
        <signal name="XLXN_161" />
        <signal name="XLXN_162" />
        <signal name="DESCRIPTOR(511:0)" />
        <signal name="ENABLEOUT" />
        <signal name="XLXN_165" />
        <signal name="XLXN_166" />
        <signal name="XLXN_167" />
        <signal name="XLXN_168(31:0)" />
        <signal name="XLXN_169(31:0)" />
        <signal name="KPT_DATA(31:0)" />
        <signal name="PIXEL_DATA(7:0)" />
        <port polarity="Input" name="IMG_BASE_ADDR(31:0)" />
        <port polarity="Output" name="READ_MEM" />
        <port polarity="Output" name="ADDR_MEM(31:0)" />
        <port polarity="Input" name="RST" />
        <port polarity="Input" name="KPTS_ADDR(31:0)" />
        <port polarity="Input" name="ENABLE" />
        <port polarity="Input" name="CLK" />
        <port polarity="Output" name="DESCRIPTOR(511:0)" />
        <port polarity="Output" name="ENABLEOUT" />
        <port polarity="Input" name="KPT_DATA(31:0)" />
        <port polarity="Input" name="PIXEL_DATA(7:0)" />
        <blockdef name="KeypointReader">
            <timestamp>2014-4-11T20:20:3</timestamp>
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="528" y1="-96" y2="-96" x1="464" />
            <line x2="528" y1="-416" y2="-416" x1="464" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="528" y1="-352" y2="-352" x1="464" />
            <rect width="64" x="464" y="-364" height="24" />
            <line x2="528" y1="-288" y2="-288" x1="464" />
            <rect width="64" x="464" y="-300" height="24" />
            <line x2="528" y1="-224" y2="-224" x1="464" />
            <rect width="64" x="464" y="-236" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <rect width="400" x="64" y="-448" height="448" />
        </blockdef>
        <blockdef name="AddressGenerator">
            <timestamp>2014-4-6T2:28:25</timestamp>
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="528" y1="-416" y2="-416" x1="464" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="528" y1="-352" y2="-352" x1="464" />
            <line x2="528" y1="-288" y2="-288" x1="464" />
            <rect width="64" x="464" y="-300" height="24" />
            <rect width="400" x="64" y="-448" height="448" />
        </blockdef>
        <blockdef name="ImagePatchReader">
            <timestamp>2014-5-9T2:46:21</timestamp>
            <rect width="400" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="528" y1="-32" y2="-32" x1="464" />
            <rect width="64" x="464" y="-44" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="528" y1="-352" y2="-352" x1="464" />
            <line x2="528" y1="-288" y2="-288" x1="464" />
            <rect width="64" x="464" y="-300" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="528" y1="-224" y2="-224" x1="464" />
            <rect width="64" x="464" y="-236" height="24" />
            <line x2="528" y1="-160" y2="-160" x1="464" />
            <line x2="528" y1="-96" y2="-96" x1="464" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="GaussianFilter">
            <timestamp>2014-4-7T0:47:54</timestamp>
            <rect width="400" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="528" y1="-224" y2="-224" x1="464" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="528" y1="-288" y2="-288" x1="464" />
            <rect width="64" x="464" y="-300" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
        </blockdef>
        <blockdef name="PointBuffer">
            <timestamp>2014-4-6T0:11:29</timestamp>
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="528" y1="-224" y2="-224" x1="464" />
            <line x2="528" y1="-160" y2="-160" x1="464" />
            <rect width="64" x="464" y="-172" height="24" />
            <rect width="400" x="64" y="-256" height="256" />
        </blockdef>
        <blockdef name="PairSelector">
            <timestamp>2014-4-6T0:17:30</timestamp>
            <rect width="400" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="528" y1="-224" y2="-224" x1="464" />
            <line x2="528" y1="-160" y2="-160" x1="464" />
            <rect width="64" x="464" y="-172" height="24" />
            <line x2="528" y1="-96" y2="-96" x1="464" />
            <rect width="64" x="464" y="-108" height="24" />
        </blockdef>
        <blockdef name="DoG">
            <timestamp>2014-4-6T2:7:57</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="DescriptorMaker">
            <timestamp>2014-5-9T2:20:9</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
        </blockdef>
        <block symbolname="ImagePatchReader" name="XLXI_3">
            <blockpin signalname="XLXN_168(31:0)" name="addr(31:0)" />
            <blockpin signalname="XLXN_134(3:0)" name="addrKernel(2:0)" />
            <blockpin signalname="XLXN_167" name="busy_in" />
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="XLXN_128" name="en_out" />
            <blockpin signalname="ADDR_MEM(31:0)" name="memAddr(31:0)" />
            <blockpin signalname="PIXEL_DATA(7:0)" name="memData(7:0)" />
            <blockpin signalname="XLXN_169(31:0)" name="patchColumn(31:0)" />
            <blockpin signalname="READ_MEM" name="readMem" />
            <blockpin signalname="XLXN_115" name="request_out" />
            <blockpin signalname="RST" name="rst" />
        </block>
        <block symbolname="GaussianFilter" name="XLXI_4">
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="XLXN_128" name="ENABLEIN" />
            <blockpin signalname="XLXN_43" name="ENABLEOUT" />
            <blockpin signalname="XLXN_134(3:0)" name="GAUSS_ID(3:0)" />
            <blockpin signalname="XLXN_169(31:0)" name="INPUTARRAY(31:0)" />
            <blockpin signalname="XLXN_42(19:0)" name="OUTPUTDATA(19:0)" />
            <blockpin signalname="RST" name="RST" />
        </block>
        <block symbolname="PairSelector" name="XLXI_6">
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="RST" name="rst" />
            <blockpin signalname="XLXN_16(511:0)" name="pointSet(511:0)" />
            <blockpin signalname="XLXN_17" name="enableIn" />
            <blockpin signalname="XLXN_119" name="enableOut" />
            <blockpin signalname="XLXN_18(7:0)" name="point1(7:0)" />
            <blockpin signalname="XLXN_19(7:0)" name="point2(7:0)" />
        </block>
        <block symbolname="PointBuffer" name="XLXI_5">
            <blockpin signalname="XLXN_43" name="enableIn" />
            <blockpin signalname="XLXN_42(19:0)" name="inputValue(19:0)" />
            <blockpin signalname="XLXN_17" name="enableOut" />
            <blockpin signalname="XLXN_16(511:0)" name="pointSet(511:0)" />
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="RST" name="rst" />
        </block>
        <block symbolname="DoG" name="XLXI_7">
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="XLXN_119" name="enableIn" />
            <blockpin signalname="XLXN_18(7:0)" name="point1(7:0)" />
            <blockpin signalname="XLXN_19(7:0)" name="point2(7:0)" />
            <blockpin signalname="XLXN_162" name="test" />
            <blockpin signalname="XLXN_161" name="enableOut" />
        </block>
        <block symbolname="DescriptorMaker" name="XLXI_10">
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="DESCRIPTOR(511:0)" name="descriptor(511:0)" />
            <blockpin signalname="XLXN_161" name="enableIn" />
            <blockpin signalname="ENABLEOUT" name="enableOut" />
            <blockpin signalname="XLXN_162" name="test" />
            <blockpin signalname="RST" name="rst" />
        </block>
        <block symbolname="KeypointReader" name="XLXI_1">
            <blockpin signalname="KPTS_ADDR(31:0)" name="addr(31:0)" />
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="KPT_DATA(31:0)" name="memData(31:0)" />
            <blockpin signalname="XLXN_149" name="request" />
            <blockpin signalname="RST" name="rst" />
            <blockpin signalname="XLXN_135" name="busy" />
            <blockpin signalname="XLXN_136(9:0)" name="kptCoordX(9:0)" />
            <blockpin signalname="XLXN_137(9:0)" name="kptCoordY(9:0)" />
            <blockpin signalname="ADDR_MEM(31:0)" name="memAddr(31:0)" />
            <blockpin signalname="READ_MEM" name="read_mem" />
            <blockpin signalname="ENABLE" name="enableIn" />
        </block>
        <block symbolname="AddressGenerator" name="XLXI_2">
            <blockpin signalname="XLXN_135" name="busy_in" />
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="XLXN_136(9:0)" name="kptCoordX(9:0)" />
            <blockpin signalname="XLXN_137(9:0)" name="kptCoordY(9:0)" />
            <blockpin signalname="XLXN_115" name="request_in" />
            <blockpin signalname="RST" name="rst" />
            <blockpin signalname="XLXN_168(31:0)" name="addr(31:0)" />
            <blockpin signalname="XLXN_167" name="busy_out" />
            <blockpin signalname="XLXN_149" name="request_out" />
            <blockpin signalname="IMG_BASE_ADDR(31:0)" name="imgBaseAddr(31:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="XLXN_16(511:0)">
            <wire x2="1120" y1="1552" y2="1552" x1="976" />
            <wire x2="1120" y1="1552" y2="1632" x1="1120" />
            <wire x2="1168" y1="1632" y2="1632" x1="1120" />
        </branch>
        <branch name="XLXN_18(7:0)">
            <wire x2="2032" y1="1568" y2="1568" x1="1696" />
        </branch>
        <branch name="XLXN_19(7:0)">
            <wire x2="2032" y1="1632" y2="1632" x1="1696" />
        </branch>
        <instance x="1168" y="1728" name="XLXI_6" orien="R0">
        </instance>
        <instance x="448" y="1712" name="XLXI_5" orien="R0">
        </instance>
        <branch name="XLXN_17">
            <wire x2="1056" y1="1488" y2="1488" x1="976" />
            <wire x2="1056" y1="1488" y2="1696" x1="1056" />
            <wire x2="1168" y1="1696" y2="1696" x1="1056" />
        </branch>
        <instance x="2032" y="1664" name="XLXI_7" orien="R0">
        </instance>
        <branch name="XLXN_42(19:0)">
            <wire x2="432" y1="1328" y2="1488" x1="432" />
            <wire x2="448" y1="1488" y2="1488" x1="432" />
            <wire x2="3456" y1="1328" y2="1328" x1="432" />
            <wire x2="3456" y1="880" y2="880" x1="3392" />
            <wire x2="3456" y1="880" y2="1328" x1="3456" />
        </branch>
        <branch name="XLXN_43">
            <wire x2="448" y1="1552" y2="1552" x1="432" />
            <wire x2="432" y1="1552" y2="1792" x1="432" />
            <wire x2="3440" y1="1792" y2="1792" x1="432" />
            <wire x2="3440" y1="944" y2="944" x1="3392" />
            <wire x2="3440" y1="944" y2="1792" x1="3440" />
        </branch>
        <instance x="1312" y="1104" name="XLXI_2" orien="R0">
        </instance>
        <branch name="IMG_BASE_ADDR(31:0)">
            <wire x2="1296" y1="1248" y2="1248" x1="656" />
            <wire x2="1312" y1="1072" y2="1072" x1="1296" />
            <wire x2="1296" y1="1072" y2="1248" x1="1296" />
        </branch>
        <branch name="XLXN_115">
            <wire x2="1216" y1="544" y2="944" x1="1216" />
            <wire x2="1312" y1="944" y2="944" x1="1216" />
            <wire x2="2672" y1="544" y2="544" x1="1216" />
            <wire x2="2672" y1="544" y2="1072" x1="2672" />
            <wire x2="2672" y1="1072" y2="1072" x1="2608" />
        </branch>
        <branch name="XLXN_119">
            <wire x2="2032" y1="1504" y2="1504" x1="1696" />
        </branch>
        <iomarker fontsize="28" x="656" y="1248" name="IMG_BASE_ADDR(31:0)" orien="R180" />
        <branch name="READ_MEM">
            <wire x2="1104" y1="1008" y2="1008" x1="1056" />
            <wire x2="1104" y1="224" y2="1008" x1="1104" />
            <wire x2="2704" y1="224" y2="224" x1="1104" />
            <wire x2="2944" y1="224" y2="224" x1="2704" />
            <wire x2="2704" y1="224" y2="1008" x1="2704" />
            <wire x2="2704" y1="1008" y2="1008" x1="2608" />
        </branch>
        <branch name="ADDR_MEM(31:0)">
            <wire x2="1088" y1="880" y2="880" x1="1056" />
            <wire x2="1088" y1="304" y2="880" x1="1088" />
            <wire x2="2624" y1="304" y2="304" x1="1088" />
            <wire x2="2960" y1="304" y2="304" x1="2624" />
            <wire x2="2624" y1="304" y2="880" x1="2624" />
            <wire x2="2624" y1="880" y2="880" x1="2608" />
        </branch>
        <iomarker fontsize="28" x="2960" y="304" name="ADDR_MEM(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2944" y="224" name="READ_MEM" orien="R0" />
        <branch name="RST">
            <wire x2="128" y1="752" y2="752" x1="96" />
            <wire x2="368" y1="752" y2="752" x1="128" />
            <wire x2="528" y1="752" y2="752" x1="368" />
            <wire x2="128" y1="752" y2="1408" x1="128" />
            <wire x2="176" y1="1408" y2="1408" x1="128" />
            <wire x2="176" y1="1408" y2="1856" x1="176" />
            <wire x2="400" y1="1856" y2="1856" x1="176" />
            <wire x2="1136" y1="1856" y2="1856" x1="400" />
            <wire x2="2464" y1="1856" y2="1856" x1="1136" />
            <wire x2="368" y1="384" y2="752" x1="368" />
            <wire x2="1232" y1="384" y2="384" x1="368" />
            <wire x2="1232" y1="384" y2="752" x1="1232" />
            <wire x2="1312" y1="752" y2="752" x1="1232" />
            <wire x2="1968" y1="384" y2="384" x1="1232" />
            <wire x2="2768" y1="384" y2="384" x1="1968" />
            <wire x2="2768" y1="384" y2="1008" x1="2768" />
            <wire x2="2864" y1="1008" y2="1008" x1="2768" />
            <wire x2="1968" y1="384" y2="1072" x1="1968" />
            <wire x2="2080" y1="1072" y2="1072" x1="1968" />
            <wire x2="448" y1="1680" y2="1680" x1="400" />
            <wire x2="400" y1="1680" y2="1856" x1="400" />
            <wire x2="1168" y1="1568" y2="1568" x1="1136" />
            <wire x2="1136" y1="1568" y2="1856" x1="1136" />
            <wire x2="2608" y1="1664" y2="1664" x1="2464" />
            <wire x2="2464" y1="1664" y2="1856" x1="2464" />
        </branch>
        <branch name="XLXN_134(3:0)">
            <wire x2="2864" y1="1136" y2="1136" x1="2608" />
        </branch>
        <branch name="XLXN_136(9:0)">
            <wire x2="1152" y1="752" y2="752" x1="1056" />
            <wire x2="1152" y1="752" y2="816" x1="1152" />
            <wire x2="1312" y1="816" y2="816" x1="1152" />
        </branch>
        <branch name="XLXN_137(9:0)">
            <wire x2="1136" y1="816" y2="816" x1="1056" />
            <wire x2="1136" y1="816" y2="880" x1="1136" />
            <wire x2="1312" y1="880" y2="880" x1="1136" />
        </branch>
        <instance x="528" y="1104" name="XLXI_1" orien="R0">
        </instance>
        <branch name="XLXN_135">
            <wire x2="1168" y1="688" y2="688" x1="1056" />
            <wire x2="1168" y1="688" y2="1008" x1="1168" />
            <wire x2="1312" y1="1008" y2="1008" x1="1168" />
        </branch>
        <branch name="KPTS_ADDR(31:0)">
            <wire x2="528" y1="816" y2="816" x1="496" />
        </branch>
        <iomarker fontsize="28" x="496" y="816" name="KPTS_ADDR(31:0)" orien="R180" />
        <branch name="XLXN_149">
            <wire x2="528" y1="880" y2="880" x1="448" />
            <wire x2="448" y1="880" y2="1168" x1="448" />
            <wire x2="1920" y1="1168" y2="1168" x1="448" />
            <wire x2="1920" y1="688" y2="688" x1="1840" />
            <wire x2="1920" y1="688" y2="1168" x1="1920" />
        </branch>
        <branch name="ENABLE">
            <wire x2="400" y1="928" y2="928" x1="304" />
            <wire x2="400" y1="928" y2="1072" x1="400" />
            <wire x2="528" y1="1072" y2="1072" x1="400" />
        </branch>
        <instance x="2608" y="1696" name="XLXI_10" orien="R0">
        </instance>
        <instance x="2864" y="1168" name="XLXI_4" orien="R0">
        </instance>
        <branch name="XLXN_128">
            <wire x2="2848" y1="816" y2="816" x1="2608" />
            <wire x2="2848" y1="816" y2="944" x1="2848" />
            <wire x2="2864" y1="944" y2="944" x1="2848" />
        </branch>
        <branch name="CLK">
            <wire x2="144" y1="576" y2="576" x1="96" />
            <wire x2="144" y1="576" y2="1360" x1="144" />
            <wire x2="288" y1="1360" y2="1360" x1="144" />
            <wire x2="1104" y1="1360" y2="1360" x1="288" />
            <wire x2="1952" y1="1360" y2="1360" x1="1104" />
            <wire x2="1952" y1="1360" y2="1440" x1="1952" />
            <wire x2="2032" y1="1440" y2="1440" x1="1952" />
            <wire x2="2480" y1="1360" y2="1360" x1="1952" />
            <wire x2="2480" y1="1360" y2="1472" x1="2480" />
            <wire x2="2608" y1="1472" y2="1472" x1="2480" />
            <wire x2="1104" y1="1360" y2="1504" x1="1104" />
            <wire x2="1168" y1="1504" y2="1504" x1="1104" />
            <wire x2="288" y1="1360" y2="1616" x1="288" />
            <wire x2="448" y1="1616" y2="1616" x1="288" />
            <wire x2="528" y1="576" y2="576" x1="144" />
            <wire x2="528" y1="576" y2="688" x1="528" />
            <wire x2="1280" y1="576" y2="576" x1="528" />
            <wire x2="1280" y1="576" y2="688" x1="1280" />
            <wire x2="1312" y1="688" y2="688" x1="1280" />
            <wire x2="2032" y1="576" y2="576" x1="1280" />
            <wire x2="2816" y1="576" y2="576" x1="2032" />
            <wire x2="2816" y1="576" y2="880" x1="2816" />
            <wire x2="2864" y1="880" y2="880" x1="2816" />
            <wire x2="2032" y1="576" y2="944" x1="2032" />
            <wire x2="2080" y1="944" y2="944" x1="2032" />
        </branch>
        <iomarker fontsize="28" x="96" y="576" name="CLK" orien="R180" />
        <iomarker fontsize="28" x="304" y="928" name="ENABLE" orien="R180" />
        <iomarker fontsize="28" x="96" y="752" name="RST" orien="R180" />
        <branch name="XLXN_161">
            <wire x2="2512" y1="1504" y2="1504" x1="2416" />
            <wire x2="2512" y1="1504" y2="1536" x1="2512" />
            <wire x2="2608" y1="1536" y2="1536" x1="2512" />
        </branch>
        <branch name="XLXN_162">
            <wire x2="2448" y1="1440" y2="1440" x1="2416" />
            <wire x2="2448" y1="1440" y2="1600" x1="2448" />
            <wire x2="2608" y1="1600" y2="1600" x1="2448" />
        </branch>
        <branch name="DESCRIPTOR(511:0)">
            <wire x2="3120" y1="1472" y2="1472" x1="2992" />
        </branch>
        <iomarker fontsize="28" x="3120" y="1472" name="DESCRIPTOR(511:0)" orien="R0" />
        <branch name="ENABLEOUT">
            <wire x2="3136" y1="1536" y2="1536" x1="2992" />
        </branch>
        <iomarker fontsize="28" x="3136" y="1536" name="ENABLEOUT" orien="R0" />
        <instance x="2080" y="1168" name="XLXI_3" orien="R0">
        </instance>
        <branch name="XLXN_167">
            <wire x2="1952" y1="752" y2="752" x1="1840" />
            <wire x2="1952" y1="752" y2="880" x1="1952" />
            <wire x2="2080" y1="880" y2="880" x1="1952" />
        </branch>
        <branch name="XLXN_168(31:0)">
            <wire x2="2080" y1="816" y2="816" x1="1840" />
        </branch>
        <branch name="XLXN_169(31:0)">
            <wire x2="2736" y1="944" y2="944" x1="2608" />
            <wire x2="2736" y1="944" y2="1072" x1="2736" />
            <wire x2="2864" y1="1072" y2="1072" x1="2736" />
        </branch>
        <branch name="KPT_DATA(31:0)">
            <wire x2="512" y1="1136" y2="1136" x1="416" />
            <wire x2="528" y1="944" y2="944" x1="512" />
            <wire x2="512" y1="944" y2="1136" x1="512" />
        </branch>
        <iomarker fontsize="28" x="416" y="1136" name="KPT_DATA(31:0)" orien="R180" />
        <branch name="PIXEL_DATA(7:0)">
            <wire x2="2064" y1="1264" y2="1264" x1="1904" />
            <wire x2="2080" y1="1008" y2="1008" x1="2064" />
            <wire x2="2064" y1="1008" y2="1264" x1="2064" />
        </branch>
        <iomarker fontsize="28" x="1904" y="1264" name="PIXEL_DATA(7:0)" orien="R180" />
    </sheet>
</drawing>