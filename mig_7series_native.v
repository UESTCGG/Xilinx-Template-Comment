mig_7series_0 u_mig_7series_0 (





    // Memory interface ports 这里都是IP核自己产生的信号，只需要读取所需的信号，不需要用户操作


    .ddr3_addr                      (ddr3_addr),  // output [13:0]		ddr3_addr
    .ddr3_ba                        (ddr3_ba),  // output [2:0]		ddr3_ba
    .ddr3_cas_n                     (ddr3_cas_n),  // output			ddr3_cas_n
    .ddr3_ck_n                      (ddr3_ck_n),  // output [0:0]		ddr3_ck_n
    .ddr3_ck_p                      (ddr3_ck_p),  // output [0:0]		ddr3_ck_p
    .ddr3_cke                       (ddr3_cke),  // output [0:0]		ddr3_cke
    .ddr3_ras_n                     (ddr3_ras_n),  // output			ddr3_ras_n
    .ddr3_reset_n                   (ddr3_reset_n),  // output			ddr3_reset_n
    .ddr3_we_n                      (ddr3_we_n),  // output			ddr3_we_n
    .ddr3_dq                        (ddr3_dq),  // inout [7:0]		ddr3_dq
    .ddr3_dqs_n                     (ddr3_dqs_n),  // inout [0:0]		ddr3_dqs_n
    .ddr3_dqs_p                     (ddr3_dqs_p),  // inout [0:0]		ddr3_dqs_p
    .init_calib_complete            (init_calib_complete),  // output	IP核复位完成信号
	.ddr3_cs_n                      (ddr3_cs_n),  // output [0:0]		ddr3_cs_n
    .ddr3_dm                        (ddr3_dm),  // output [0:0]		ddr3_dm
    .ddr3_odt                       (ddr3_odt),  // output [0:0]		ddr3_odt


    // Application interface ports


    .app_addr                       (app_addr),  // input [27:0]		app_addr地址与ddr3的bank地址、行地址、列地址的对应关系在IP核内可选
    .app_cmd                        (app_cmd),  // input [2:0]		app_cmd控制该次操作是读还是写
    //以下两个信号构成了一个握手信号，同时为高代表握手成功，用户端数据才能写入IP核内，写入的是app_addr
    .app_en                         (app_en),  // input				app_en
    .app_rdy                        (app_rdy),  // output			app_rdy

    .app_wdf_data                   (app_wdf_data),  // input [63:0]		app_wdf_data代表写入的数据，这个数据可以先于地址写入，也可以后于地址写入，但是滞后最多只能2个clock
    .app_wdf_end                    (app_wdf_end),  // input				app_wdf_end代表当前写入的是最后一个数据
    //以下两个信号构成了一个握手信号，同时为高代表握手成功，用户端数据才能写入IP核内，写入的是app_wdf_data
    .app_wdf_wren                   (app_wdf_wren),  // input				app_wdf_wren
    .app_wdf_rdy                    (app_wdf_rdy),  // output			    app_wdf_rdy

    .app_wdf_mask                   (app_wdf_mask),  // input [7:0]		    app_wdf_mask代表对应写数据的字节是否有效，掩码，例如8'h01指只有最低的一个字节有效
    //读数据时没有握手信号
    .app_rd_data                    (app_rd_data),  // output [63:0]		app_rd_data
    .app_rd_data_end                (app_rd_data_end),  // output			app_rd_data_end代表当前是读出的最后一个数据
    .app_rd_data_valid              (app_rd_data_valid),  // output			app_rd_data_valid读数据有效信号
    
    
    //refresh request&acknowledge，不知道有什么用，用不到就把输入置0
    .app_ref_req                    (app_ref_req),  // input			app_ref_req
    .app_ref_ack                    (app_ref_ack),  // output			app_ref_ack

    //ZQ calibration，不知道有什么用
    .app_zq_req                     (app_zq_req),  // input			app_zq_req
    .app_zq_ack                     (app_zq_ack),  // output			app_zq_ack

    //置0就行，官方的示例prj在这也是置0
    .app_sr_req                     (app_sr_req),  // input			app_sr_req
    .app_sr_active                  (app_sr_active),  // output			app_sr_active
    

    .ui_clk                         (ui_clk),  // output			ui_clk
    .ui_clk_sync_rst                (ui_clk_sync_rst),  // output			ui_clk_sync_rst
    


    // System Clock Ports，IP核里设置不同，这里出现的端口也不同
    .sys_clk_i                       (sys_clk_i),


    // Reference Clock Ports
    .clk_ref_i                      (clk_ref_i),
    .sys_rst                        (sys_rst) // input sys_rst 可选低有效/高有效复位信号
    );