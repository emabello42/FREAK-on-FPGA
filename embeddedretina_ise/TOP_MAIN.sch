<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex5" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <blockdef name="RetinaDescriptorGenerator">
            <timestamp>2014-5-9T3:23:40</timestamp>
            <rect width="512" x="64" y="-448" height="448" />
            <line x2="640" y1="-352" y2="-352" x1="576" />
            <rect width="64" x="576" y="-364" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="640" y1="-288" y2="-288" x1="576" />
            <rect width="64" x="576" y="-300" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="640" y1="-224" y2="-224" x1="576" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="640" y1="-416" y2="-416" x1="576" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
        </blockdef>
        <block symbolname="RetinaDescriptorGenerator" name="XLXI_1">
            <blockpin name="ADDR_MEM(31:0)" />
            <blockpin name="CLK" />
            <blockpin name="DESCRIPTOR(511:0)" />
            <blockpin name="ENABLE" />
            <blockpin name="ENABLEOUT" />
            <blockpin name="IMG_BASE_ADDR(31:0)" />
            <blockpin name="KPTS_ADDR(31:0)" />
            <blockpin name="KPT_DATA(31:0)" />
            <blockpin name="PIXEL_DATA(7:0)" />
            <blockpin name="READ_MEM" />
            <blockpin name="RST" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1248" y="1008" name="XLXI_1" orien="R0">
        </instance>
    </sheet>
</drawing>