--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
--Date        : Fri Jan 31 14:18:57 2020
--Host        : CISS32101 running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target SDDR_AXI_ST.bd
--Design      : SDDR_AXI_ST
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SDDR_AXI_ST is
  port (
    MCLK : in STD_LOGIC;
    ST_DATA_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    ST_DATA_arready : out STD_LOGIC;
    ST_DATA_arvalid : in STD_LOGIC;
    ST_DATA_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    ST_DATA_awready : out STD_LOGIC;
    ST_DATA_awvalid : in STD_LOGIC;
    ST_DATA_bready : in STD_LOGIC;
    ST_DATA_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ST_DATA_bvalid : out STD_LOGIC;
    ST_DATA_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ST_DATA_rready : in STD_LOGIC;
    ST_DATA_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ST_DATA_rvalid : out STD_LOGIC;
    ST_DATA_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ST_DATA_wready : out STD_LOGIC;
    ST_DATA_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    ST_DATA_wvalid : in STD_LOGIC;
    ST_UTIL_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    ST_UTIL_arready : out STD_LOGIC;
    ST_UTIL_arvalid : in STD_LOGIC;
    ST_UTIL_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    ST_UTIL_awready : out STD_LOGIC;
    ST_UTIL_awvalid : in STD_LOGIC;
    ST_UTIL_bready : in STD_LOGIC;
    ST_UTIL_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ST_UTIL_bvalid : out STD_LOGIC;
    ST_UTIL_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ST_UTIL_rready : in STD_LOGIC;
    ST_UTIL_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ST_UTIL_rvalid : out STD_LOGIC;
    ST_UTIL_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ST_UTIL_wready : out STD_LOGIC;
    ST_UTIL_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    ST_UTIL_wvalid : in STD_LOGIC;
    T1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    armed : out STD_LOGIC;
    waiting : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of SDDR_AXI_ST : entity is "SDDR_AXI_ST,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=SDDR_AXI_ST,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=16,numReposBlks=16,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of SDDR_AXI_ST : entity is "SDDR_AXI_ST.hwdef";
end SDDR_AXI_ST;

architecture STRUCTURE of SDDR_AXI_ST is
  component SDDR_AXI_ST_axi_gpio_0_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    gpio_io_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio2_io_i : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component SDDR_AXI_ST_axi_gpio_0_0;
  component SDDR_AXI_ST_axi_gpio_0_1 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    gpio_io_o : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gpio2_io_i : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component SDDR_AXI_ST_axi_gpio_0_1;
  component SDDR_AXI_ST_SDDR_ST_0_0 is
  port (
    MCLK : in STD_LOGIC;
    RESETN : in STD_LOGIC;
    T1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    D0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    D1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DRDY : out STD_LOGIC;
    CTIME : out STD_LOGIC_VECTOR ( 31 downto 0 );
    waiting : out STD_LOGIC;
    armed : out STD_LOGIC;
    DEBUG0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DEBUG1 : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component SDDR_AXI_ST_SDDR_ST_0_0;
  component SDDR_AXI_ST_util_vector_logic_0_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component SDDR_AXI_ST_util_vector_logic_0_0;
  component SDDR_AXI_ST_util_vector_logic_1_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component SDDR_AXI_ST_util_vector_logic_1_0;
  component SDDR_AXI_ST_fifo_generator_0_0 is
  port (
    clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 47 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 47 downto 0 );
    full : out STD_LOGIC;
    wr_ack : out STD_LOGIC;
    empty : out STD_LOGIC;
    valid : out STD_LOGIC;
    data_count : out STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  end component SDDR_AXI_ST_fifo_generator_0_0;
  component SDDR_AXI_ST_capacity_controller_0_0 is
  port (
    MCLK : in STD_LOGIC;
    full : in STD_LOGIC;
    empty : in STD_LOGIC;
    run : out STD_LOGIC;
    resetn : in STD_LOGIC
  );
  end component SDDR_AXI_ST_capacity_controller_0_0;
  component SDDR_AXI_ST_util_vector_logic_2_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component SDDR_AXI_ST_util_vector_logic_2_0;
  component SDDR_AXI_ST_FIFO_R_CT_0_0 is
  port (
    MCLK : in STD_LOGIC;
    REQ : in STD_LOGIC;
    valid : out STD_LOGIC;
    read_en : out STD_LOGIC;
    resetn : in STD_LOGIC
  );
  end component SDDR_AXI_ST_FIFO_R_CT_0_0;
  component SDDR_AXI_ST_xlslice_0_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component SDDR_AXI_ST_xlslice_0_0;
  component SDDR_AXI_ST_xlslice_0_1 is
  port (
    Din : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component SDDR_AXI_ST_xlslice_0_1;
  component SDDR_AXI_ST_xlslice_1_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component SDDR_AXI_ST_xlslice_1_0;
  component SDDR_AXI_ST_xlconcat_0_1 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    In1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    In2 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    dout : out STD_LOGIC_VECTOR ( 47 downto 0 )
  );
  end component SDDR_AXI_ST_xlconcat_0_1;
  component SDDR_AXI_ST_DATA_SPLITTER_0_0 is
  port (
    DATA_IN : in STD_LOGIC_VECTOR ( 47 downto 0 );
    COARSE : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FINE_TIMES : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component SDDR_AXI_ST_DATA_SPLITTER_0_0;
  component SDDR_AXI_ST_xlconcat_1_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component SDDR_AXI_ST_xlconcat_1_0;
  component SDDR_AXI_ST_util_vector_logic_3_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component SDDR_AXI_ST_util_vector_logic_3_0;
  signal DATA_SPLITTER_0_COARSE : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal DATA_SPLITTER_0_FINE_TIMES : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal FIFO_R_CT_0_read_en : STD_LOGIC;
  signal FIFO_R_CT_0_valid : STD_LOGIC;
  signal MCLK_1 : STD_LOGIC;
  signal SDDR_ST_0_CTIME : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal SDDR_ST_0_D0 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal SDDR_ST_0_D1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal SDDR_ST_0_DRDY : STD_LOGIC;
  signal SDDR_ST_0_armed : STD_LOGIC;
  signal SDDR_ST_0_waiting : STD_LOGIC;
  signal ST_DATA_1_ARADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal ST_DATA_1_ARREADY : STD_LOGIC;
  signal ST_DATA_1_ARVALID : STD_LOGIC;
  signal ST_DATA_1_AWADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal ST_DATA_1_AWREADY : STD_LOGIC;
  signal ST_DATA_1_AWVALID : STD_LOGIC;
  signal ST_DATA_1_BREADY : STD_LOGIC;
  signal ST_DATA_1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ST_DATA_1_BVALID : STD_LOGIC;
  signal ST_DATA_1_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ST_DATA_1_RREADY : STD_LOGIC;
  signal ST_DATA_1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ST_DATA_1_RVALID : STD_LOGIC;
  signal ST_DATA_1_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ST_DATA_1_WREADY : STD_LOGIC;
  signal ST_DATA_1_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ST_DATA_1_WVALID : STD_LOGIC;
  signal ST_UTIL_1_ARADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal ST_UTIL_1_ARREADY : STD_LOGIC;
  signal ST_UTIL_1_ARVALID : STD_LOGIC;
  signal ST_UTIL_1_AWADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal ST_UTIL_1_AWREADY : STD_LOGIC;
  signal ST_UTIL_1_AWVALID : STD_LOGIC;
  signal ST_UTIL_1_BREADY : STD_LOGIC;
  signal ST_UTIL_1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ST_UTIL_1_BVALID : STD_LOGIC;
  signal ST_UTIL_1_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ST_UTIL_1_RREADY : STD_LOGIC;
  signal ST_UTIL_1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ST_UTIL_1_RVALID : STD_LOGIC;
  signal ST_UTIL_1_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ST_UTIL_1_WREADY : STD_LOGIC;
  signal ST_UTIL_1_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ST_UTIL_1_WVALID : STD_LOGIC;
  signal T1_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal UTIL_gpio_io_o : STD_LOGIC_VECTOR ( 0 to 0 );
  signal UTIL_gpio_io_o1 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal aclk_1 : STD_LOGIC;
  signal aresetn_1 : STD_LOGIC;
  signal capacity_controller_0_run : STD_LOGIC;
  signal fifo_generator_0_dout : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal fifo_generator_0_empty : STD_LOGIC;
  signal fifo_generator_0_full : STD_LOGIC;
  signal util_vector_logic_0_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_1_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_2_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_3_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlconcat_0_dout : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal xlconcat_1_dout : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xlslice_1_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_2_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_SDDR_ST_0_DEBUG0_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_SDDR_ST_0_DEBUG1_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_fifo_generator_0_valid_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_generator_0_wr_ack_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_generator_0_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of MCLK : signal is "xilinx.com:signal:clock:1.0 CLK.MCLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of MCLK : signal is "XIL_INTERFACENAME CLK.MCLK, CLK_DOMAIN SDDR_AXI_ST_MCLK, FREQ_HZ 400000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of ST_DATA_arready : signal is "xilinx.com:interface:aximm:1.0 ST_DATA ARREADY";
  attribute X_INTERFACE_INFO of ST_DATA_arvalid : signal is "xilinx.com:interface:aximm:1.0 ST_DATA ARVALID";
  attribute X_INTERFACE_INFO of ST_DATA_awready : signal is "xilinx.com:interface:aximm:1.0 ST_DATA AWREADY";
  attribute X_INTERFACE_INFO of ST_DATA_awvalid : signal is "xilinx.com:interface:aximm:1.0 ST_DATA AWVALID";
  attribute X_INTERFACE_INFO of ST_DATA_bready : signal is "xilinx.com:interface:aximm:1.0 ST_DATA BREADY";
  attribute X_INTERFACE_INFO of ST_DATA_bvalid : signal is "xilinx.com:interface:aximm:1.0 ST_DATA BVALID";
  attribute X_INTERFACE_INFO of ST_DATA_rready : signal is "xilinx.com:interface:aximm:1.0 ST_DATA RREADY";
  attribute X_INTERFACE_INFO of ST_DATA_rvalid : signal is "xilinx.com:interface:aximm:1.0 ST_DATA RVALID";
  attribute X_INTERFACE_INFO of ST_DATA_wready : signal is "xilinx.com:interface:aximm:1.0 ST_DATA WREADY";
  attribute X_INTERFACE_INFO of ST_DATA_wvalid : signal is "xilinx.com:interface:aximm:1.0 ST_DATA WVALID";
  attribute X_INTERFACE_INFO of ST_UTIL_arready : signal is "xilinx.com:interface:aximm:1.0 ST_UTIL ARREADY";
  attribute X_INTERFACE_INFO of ST_UTIL_arvalid : signal is "xilinx.com:interface:aximm:1.0 ST_UTIL ARVALID";
  attribute X_INTERFACE_INFO of ST_UTIL_awready : signal is "xilinx.com:interface:aximm:1.0 ST_UTIL AWREADY";
  attribute X_INTERFACE_INFO of ST_UTIL_awvalid : signal is "xilinx.com:interface:aximm:1.0 ST_UTIL AWVALID";
  attribute X_INTERFACE_INFO of ST_UTIL_bready : signal is "xilinx.com:interface:aximm:1.0 ST_UTIL BREADY";
  attribute X_INTERFACE_INFO of ST_UTIL_bvalid : signal is "xilinx.com:interface:aximm:1.0 ST_UTIL BVALID";
  attribute X_INTERFACE_INFO of ST_UTIL_rready : signal is "xilinx.com:interface:aximm:1.0 ST_UTIL RREADY";
  attribute X_INTERFACE_INFO of ST_UTIL_rvalid : signal is "xilinx.com:interface:aximm:1.0 ST_UTIL RVALID";
  attribute X_INTERFACE_INFO of ST_UTIL_wready : signal is "xilinx.com:interface:aximm:1.0 ST_UTIL WREADY";
  attribute X_INTERFACE_INFO of ST_UTIL_wvalid : signal is "xilinx.com:interface:aximm:1.0 ST_UTIL WVALID";
  attribute X_INTERFACE_INFO of aclk : signal is "xilinx.com:signal:clock:1.0 CLK.ACLK CLK";
  attribute X_INTERFACE_PARAMETER of aclk : signal is "XIL_INTERFACENAME CLK.ACLK, ASSOCIATED_RESET aresetn, CLK_DOMAIN SDDR_AXI_ST_aclk, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of aresetn : signal is "xilinx.com:signal:reset:1.0 RST.ARESETN RST";
  attribute X_INTERFACE_PARAMETER of aresetn : signal is "XIL_INTERFACENAME RST.ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of ST_DATA_araddr : signal is "xilinx.com:interface:aximm:1.0 ST_DATA ARADDR";
  attribute X_INTERFACE_PARAMETER of ST_DATA_araddr : signal is "XIL_INTERFACENAME ST_DATA, ADDR_WIDTH 9, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of ST_DATA_awaddr : signal is "xilinx.com:interface:aximm:1.0 ST_DATA AWADDR";
  attribute X_INTERFACE_INFO of ST_DATA_bresp : signal is "xilinx.com:interface:aximm:1.0 ST_DATA BRESP";
  attribute X_INTERFACE_INFO of ST_DATA_rdata : signal is "xilinx.com:interface:aximm:1.0 ST_DATA RDATA";
  attribute X_INTERFACE_INFO of ST_DATA_rresp : signal is "xilinx.com:interface:aximm:1.0 ST_DATA RRESP";
  attribute X_INTERFACE_INFO of ST_DATA_wdata : signal is "xilinx.com:interface:aximm:1.0 ST_DATA WDATA";
  attribute X_INTERFACE_INFO of ST_DATA_wstrb : signal is "xilinx.com:interface:aximm:1.0 ST_DATA WSTRB";
  attribute X_INTERFACE_INFO of ST_UTIL_araddr : signal is "xilinx.com:interface:aximm:1.0 ST_UTIL ARADDR";
  attribute X_INTERFACE_PARAMETER of ST_UTIL_araddr : signal is "XIL_INTERFACENAME ST_UTIL, ADDR_WIDTH 9, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of ST_UTIL_awaddr : signal is "xilinx.com:interface:aximm:1.0 ST_UTIL AWADDR";
  attribute X_INTERFACE_INFO of ST_UTIL_bresp : signal is "xilinx.com:interface:aximm:1.0 ST_UTIL BRESP";
  attribute X_INTERFACE_INFO of ST_UTIL_rdata : signal is "xilinx.com:interface:aximm:1.0 ST_UTIL RDATA";
  attribute X_INTERFACE_INFO of ST_UTIL_rresp : signal is "xilinx.com:interface:aximm:1.0 ST_UTIL RRESP";
  attribute X_INTERFACE_INFO of ST_UTIL_wdata : signal is "xilinx.com:interface:aximm:1.0 ST_UTIL WDATA";
  attribute X_INTERFACE_INFO of ST_UTIL_wstrb : signal is "xilinx.com:interface:aximm:1.0 ST_UTIL WSTRB";
begin
  MCLK_1 <= MCLK;
  ST_DATA_1_ARADDR(8 downto 0) <= ST_DATA_araddr(8 downto 0);
  ST_DATA_1_ARVALID <= ST_DATA_arvalid;
  ST_DATA_1_AWADDR(8 downto 0) <= ST_DATA_awaddr(8 downto 0);
  ST_DATA_1_AWVALID <= ST_DATA_awvalid;
  ST_DATA_1_BREADY <= ST_DATA_bready;
  ST_DATA_1_RREADY <= ST_DATA_rready;
  ST_DATA_1_WDATA(31 downto 0) <= ST_DATA_wdata(31 downto 0);
  ST_DATA_1_WSTRB(3 downto 0) <= ST_DATA_wstrb(3 downto 0);
  ST_DATA_1_WVALID <= ST_DATA_wvalid;
  ST_DATA_arready <= ST_DATA_1_ARREADY;
  ST_DATA_awready <= ST_DATA_1_AWREADY;
  ST_DATA_bresp(1 downto 0) <= ST_DATA_1_BRESP(1 downto 0);
  ST_DATA_bvalid <= ST_DATA_1_BVALID;
  ST_DATA_rdata(31 downto 0) <= ST_DATA_1_RDATA(31 downto 0);
  ST_DATA_rresp(1 downto 0) <= ST_DATA_1_RRESP(1 downto 0);
  ST_DATA_rvalid <= ST_DATA_1_RVALID;
  ST_DATA_wready <= ST_DATA_1_WREADY;
  ST_UTIL_1_ARADDR(8 downto 0) <= ST_UTIL_araddr(8 downto 0);
  ST_UTIL_1_ARVALID <= ST_UTIL_arvalid;
  ST_UTIL_1_AWADDR(8 downto 0) <= ST_UTIL_awaddr(8 downto 0);
  ST_UTIL_1_AWVALID <= ST_UTIL_awvalid;
  ST_UTIL_1_BREADY <= ST_UTIL_bready;
  ST_UTIL_1_RREADY <= ST_UTIL_rready;
  ST_UTIL_1_WDATA(31 downto 0) <= ST_UTIL_wdata(31 downto 0);
  ST_UTIL_1_WSTRB(3 downto 0) <= ST_UTIL_wstrb(3 downto 0);
  ST_UTIL_1_WVALID <= ST_UTIL_wvalid;
  ST_UTIL_arready <= ST_UTIL_1_ARREADY;
  ST_UTIL_awready <= ST_UTIL_1_AWREADY;
  ST_UTIL_bresp(1 downto 0) <= ST_UTIL_1_BRESP(1 downto 0);
  ST_UTIL_bvalid <= ST_UTIL_1_BVALID;
  ST_UTIL_rdata(31 downto 0) <= ST_UTIL_1_RDATA(31 downto 0);
  ST_UTIL_rresp(1 downto 0) <= ST_UTIL_1_RRESP(1 downto 0);
  ST_UTIL_rvalid <= ST_UTIL_1_RVALID;
  ST_UTIL_wready <= ST_UTIL_1_WREADY;
  T1_1(7 downto 0) <= T1(7 downto 0);
  aclk_1 <= aclk;
  aresetn_1 <= aresetn;
  armed <= SDDR_ST_0_armed;
  waiting <= SDDR_ST_0_waiting;
DATA: component SDDR_AXI_ST_axi_gpio_0_0
     port map (
      gpio2_io_i(15 downto 0) => DATA_SPLITTER_0_FINE_TIMES(15 downto 0),
      gpio_io_i(31 downto 0) => DATA_SPLITTER_0_COARSE(31 downto 0),
      s_axi_aclk => aclk_1,
      s_axi_araddr(8 downto 0) => ST_DATA_1_ARADDR(8 downto 0),
      s_axi_aresetn => aresetn_1,
      s_axi_arready => ST_DATA_1_ARREADY,
      s_axi_arvalid => ST_DATA_1_ARVALID,
      s_axi_awaddr(8 downto 0) => ST_DATA_1_AWADDR(8 downto 0),
      s_axi_awready => ST_DATA_1_AWREADY,
      s_axi_awvalid => ST_DATA_1_AWVALID,
      s_axi_bready => ST_DATA_1_BREADY,
      s_axi_bresp(1 downto 0) => ST_DATA_1_BRESP(1 downto 0),
      s_axi_bvalid => ST_DATA_1_BVALID,
      s_axi_rdata(31 downto 0) => ST_DATA_1_RDATA(31 downto 0),
      s_axi_rready => ST_DATA_1_RREADY,
      s_axi_rresp(1 downto 0) => ST_DATA_1_RRESP(1 downto 0),
      s_axi_rvalid => ST_DATA_1_RVALID,
      s_axi_wdata(31 downto 0) => ST_DATA_1_WDATA(31 downto 0),
      s_axi_wready => ST_DATA_1_WREADY,
      s_axi_wstrb(3 downto 0) => ST_DATA_1_WSTRB(3 downto 0),
      s_axi_wvalid => ST_DATA_1_WVALID
    );
DATA_SPLITTER_0: component SDDR_AXI_ST_DATA_SPLITTER_0_0
     port map (
      COARSE(31 downto 0) => DATA_SPLITTER_0_COARSE(31 downto 0),
      DATA_IN(47 downto 0) => fifo_generator_0_dout(47 downto 0),
      FINE_TIMES(15 downto 0) => DATA_SPLITTER_0_FINE_TIMES(15 downto 0)
    );
FIFO_R_CT_0: component SDDR_AXI_ST_FIFO_R_CT_0_0
     port map (
      MCLK => MCLK_1,
      REQ => xlslice_1_Dout(0),
      read_en => FIFO_R_CT_0_read_en,
      resetn => xlslice_2_Dout(0),
      valid => FIFO_R_CT_0_valid
    );
SDDR_ST_0: component SDDR_AXI_ST_SDDR_ST_0_0
     port map (
      CTIME(31 downto 0) => SDDR_ST_0_CTIME(31 downto 0),
      D0(7 downto 0) => SDDR_ST_0_D0(7 downto 0),
      D1(7 downto 0) => SDDR_ST_0_D1(7 downto 0),
      DEBUG0(7 downto 0) => NLW_SDDR_ST_0_DEBUG0_UNCONNECTED(7 downto 0),
      DEBUG1(7 downto 0) => NLW_SDDR_ST_0_DEBUG1_UNCONNECTED(7 downto 0),
      DRDY => SDDR_ST_0_DRDY,
      MCLK => MCLK_1,
      RESETN => util_vector_logic_2_Res(0),
      T1(7 downto 0) => T1_1(7 downto 0),
      armed => SDDR_ST_0_armed,
      waiting => SDDR_ST_0_waiting
    );
UTIL: component SDDR_AXI_ST_axi_gpio_0_1
     port map (
      gpio2_io_i(2 downto 0) => xlconcat_1_dout(2 downto 0),
      gpio_io_o(2 downto 0) => UTIL_gpio_io_o1(2 downto 0),
      s_axi_aclk => aclk_1,
      s_axi_araddr(8 downto 0) => ST_UTIL_1_ARADDR(8 downto 0),
      s_axi_aresetn => aresetn_1,
      s_axi_arready => ST_UTIL_1_ARREADY,
      s_axi_arvalid => ST_UTIL_1_ARVALID,
      s_axi_awaddr(8 downto 0) => ST_UTIL_1_AWADDR(8 downto 0),
      s_axi_awready => ST_UTIL_1_AWREADY,
      s_axi_awvalid => ST_UTIL_1_AWVALID,
      s_axi_bready => ST_UTIL_1_BREADY,
      s_axi_bresp(1 downto 0) => ST_UTIL_1_BRESP(1 downto 0),
      s_axi_bvalid => ST_UTIL_1_BVALID,
      s_axi_rdata(31 downto 0) => ST_UTIL_1_RDATA(31 downto 0),
      s_axi_rready => ST_UTIL_1_RREADY,
      s_axi_rresp(1 downto 0) => ST_UTIL_1_RRESP(1 downto 0),
      s_axi_rvalid => ST_UTIL_1_RVALID,
      s_axi_wdata(31 downto 0) => ST_UTIL_1_WDATA(31 downto 0),
      s_axi_wready => ST_UTIL_1_WREADY,
      s_axi_wstrb(3 downto 0) => ST_UTIL_1_WSTRB(3 downto 0),
      s_axi_wvalid => ST_UTIL_1_WVALID
    );
capacity_controller_0: component SDDR_AXI_ST_capacity_controller_0_0
     port map (
      MCLK => MCLK_1,
      empty => fifo_generator_0_empty,
      full => fifo_generator_0_full,
      resetn => UTIL_gpio_io_o(0),
      run => capacity_controller_0_run
    );
fifo_generator_0: component SDDR_AXI_ST_fifo_generator_0_0
     port map (
      clk => MCLK_1,
      data_count(10 downto 0) => NLW_fifo_generator_0_data_count_UNCONNECTED(10 downto 0),
      din(47 downto 0) => xlconcat_0_dout(47 downto 0),
      dout(47 downto 0) => fifo_generator_0_dout(47 downto 0),
      empty => fifo_generator_0_empty,
      full => fifo_generator_0_full,
      rd_en => FIFO_R_CT_0_read_en,
      srst => util_vector_logic_3_Res(0),
      valid => NLW_fifo_generator_0_valid_UNCONNECTED,
      wr_ack => NLW_fifo_generator_0_wr_ack_UNCONNECTED,
      wr_en => SDDR_ST_0_DRDY
    );
util_vector_logic_0: component SDDR_AXI_ST_util_vector_logic_0_0
     port map (
      Op1(0) => UTIL_gpio_io_o(0),
      Op2(0) => util_vector_logic_1_Res(0),
      Res(0) => util_vector_logic_0_Res(0)
    );
util_vector_logic_1: component SDDR_AXI_ST_util_vector_logic_1_0
     port map (
      Op1(0) => SDDR_ST_0_DRDY,
      Res(0) => util_vector_logic_1_Res(0)
    );
util_vector_logic_2: component SDDR_AXI_ST_util_vector_logic_2_0
     port map (
      Op1(0) => capacity_controller_0_run,
      Op2(0) => util_vector_logic_0_Res(0),
      Res(0) => util_vector_logic_2_Res(0)
    );
util_vector_logic_3: component SDDR_AXI_ST_util_vector_logic_3_0
     port map (
      Op1(0) => aresetn_1,
      Res(0) => util_vector_logic_3_Res(0)
    );
xlconcat_0: component SDDR_AXI_ST_xlconcat_0_1
     port map (
      In0(31 downto 0) => SDDR_ST_0_CTIME(31 downto 0),
      In1(7 downto 0) => SDDR_ST_0_D0(7 downto 0),
      In2(7 downto 0) => SDDR_ST_0_D1(7 downto 0),
      dout(47 downto 0) => xlconcat_0_dout(47 downto 0)
    );
xlconcat_1: component SDDR_AXI_ST_xlconcat_1_0
     port map (
      In0(0) => FIFO_R_CT_0_valid,
      In1(0) => fifo_generator_0_empty,
      In2(0) => fifo_generator_0_full,
      dout(2 downto 0) => xlconcat_1_dout(2 downto 0)
    );
xlslice_0: component SDDR_AXI_ST_xlslice_0_0
     port map (
      Din(2 downto 0) => UTIL_gpio_io_o1(2 downto 0),
      Dout(0) => UTIL_gpio_io_o(0)
    );
xlslice_1: component SDDR_AXI_ST_xlslice_0_1
     port map (
      Din(2 downto 0) => UTIL_gpio_io_o1(2 downto 0),
      Dout(0) => xlslice_1_Dout(0)
    );
xlslice_2: component SDDR_AXI_ST_xlslice_1_0
     port map (
      Din(2 downto 0) => UTIL_gpio_io_o1(2 downto 0),
      Dout(0) => xlslice_2_Dout(0)
    );
end STRUCTURE;
