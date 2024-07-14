module skid_buffer#(
    parameter WIDTH = 32
)(
    input   clk,
    input   rst_n,

    input   input_valid,
    output  input_ready,
    input   [WIDTH-1:0]  input_data,

    output  output_valid,
    input   output_ready,
    output  [WIDTH-1:0]  output_data

);
reg     [WIDTH-1:0]     data_out_reg,data_buffer_out;
wire    [WIDTH-1:0]     data_sel_out;
reg [1:0]   cstate,nstate;
wire    insert,remove;
wire    load,unload,fill,flush,flow;
wire    data_buffer_wren,data_out_en,data_sel;
localparam  EMPTY = 2'b00;
localparam  BUSY  = 2'b01;
localparam  FULL  = 2'b10;
//data_buffer
always @(posedge clk,negedge rst_n) begin
    if(~rst_n)begin
        data_buffer_out<={WIDTH{1'b0}};
    end
    else if(data_buffer_wren)begin
        data_buffer_out<=input_data;
    end
end

//data_sel
assign data_sel_out=data_sel?data_buffer_out:input_data;

//output_buffer
always @(posedge clk,negedge rst_n) begin
    if(~rst_n)begin
        data_out_reg<={WIDTH{1'b0}};
    end
    else if(data_out_en)begin
        data_out_reg<=data_sel_out;
    end
    
end

//control logic
assign  insert = input_valid && input_ready;
assign  remove = output_valid && output_ready;
assign  load = (cstate == EMPTY) && insert;//因为是握手信号，传输是在下个周期才发生，所以用nstate
assign  unload = (cstate == BUSY) && remove && (~insert);
assign  flow = (cstate == BUSY) && remove && insert;
assign  fill = (cstate == BUSY) && (~remove) && insert;
assign  flush = (cstate == FULL) && remove && (~insert);
always @(posedge clk,negedge rst_n) begin
    if(~rst_n)begin
        cstate<=EMPTY;
    end
    else begin
        cstate<=nstate;
    end
end
always @(*) begin
    case(cstate)
    EMPTY:begin
        nstate = load ? BUSY : EMPTY;
    end
    BUSY:begin
        if(unload)begin
            nstate = EMPTY;
        end
        else if(fill) begin
            nstate = FULL;
        end
        else if(flow)begin
            nstate = BUSY;
        end
        else begin
            nstate = BUSY;
        end
        end
    FULL:begin
        if(flush)begin
            nstate = BUSY;
        end
        else begin
            nstate = FULL;
        end
    end
    default:begin
        nstate = EMPTY;
    end
    endcase
end
//                         load   unload  fill   flush   flow
assign data_buffer_wren =                 fill               ;
assign data_out_en      =  load          |       flush | flow;
assign data_sel     =                        flush       ;

//valid_ready logic
assign input_ready = ~(cstate == FULL);
assign output_valid = ~(cstate == EMPTY);
assign output_data = data_out_reg;
endmodule