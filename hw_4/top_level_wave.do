onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {UART UNIT} /uart_tb_top/UART_UNIT_DUT/uart_unit/clk
add wave -noupdate -expand -group {UART UNIT} /uart_tb_top/UART_UNIT_DUT/uart_unit/reset
add wave -noupdate -expand -group {UART UNIT} /uart_tb_top/UART_UNIT_DUT/uart_unit/dvsr
add wave -noupdate -expand -group {UART UNIT} /uart_tb_top/UART_UNIT_DUT/uart_unit/rd_uart
add wave -noupdate -expand -group {UART UNIT} /uart_tb_top/UART_UNIT_DUT/uart_unit/wr_uart
add wave -noupdate -expand -group {UART UNIT} /uart_tb_top/UART_UNIT_DUT/uart_unit/tx_full
add wave -noupdate -expand -group {UART UNIT} /uart_tb_top/UART_UNIT_DUT/uart_unit/rx_empty
add wave -noupdate -expand -group {UART UNIT} /uart_tb_top/UART_UNIT_DUT/uart_unit/w_data
add wave -noupdate -expand -group {UART UNIT} /uart_tb_top/UART_UNIT_DUT/uart_unit/r_data
add wave -noupdate -expand -group {UART UNIT} /uart_tb_top/UART_UNIT_DUT/uart_unit/rx
add wave -noupdate -expand -group {UART UNIT} /uart_tb_top/UART_UNIT_DUT/uart_unit/tx
add wave -noupdate -expand -group {UART UNIT} /uart_tb_top/UART_UNIT_DUT/uart_unit/tick
add wave -noupdate -expand -group {UART UNIT} /uart_tb_top/UART_UNIT_DUT/uart_unit/rx_done_tick
add wave -noupdate -expand -group {UART UNIT} /uart_tb_top/UART_UNIT_DUT/uart_unit/tx_done_tick
add wave -noupdate -expand -group {UART UNIT} /uart_tb_top/UART_UNIT_DUT/uart_unit/tx_empty
add wave -noupdate -expand -group {UART UNIT} /uart_tb_top/UART_UNIT_DUT/uart_unit/tx_fifo_not_empty
add wave -noupdate -expand -group {UART UNIT} /uart_tb_top/UART_UNIT_DUT/uart_unit/tx_fifo_out
add wave -noupdate -expand -group {UART UNIT} /uart_tb_top/UART_UNIT_DUT/uart_unit/rx_data_out
add wave -noupdate -group {BAUD GENR} /uart_tb_top/UART_UNIT_DUT/uart_unit/baud_gen_unit/clk
add wave -noupdate -group {BAUD GENR} /uart_tb_top/UART_UNIT_DUT/uart_unit/baud_gen_unit/reset
add wave -noupdate -group {BAUD GENR} /uart_tb_top/UART_UNIT_DUT/uart_unit/baud_gen_unit/dvsr
add wave -noupdate -group {BAUD GENR} /uart_tb_top/UART_UNIT_DUT/uart_unit/baud_gen_unit/tick
add wave -noupdate -group {BAUD GENR} /uart_tb_top/UART_UNIT_DUT/uart_unit/baud_gen_unit/r_reg
add wave -noupdate -group {BAUD GENR} /uart_tb_top/UART_UNIT_DUT/uart_unit/baud_gen_unit/r_next
add wave -noupdate -group {UART RX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_rx_unit/clk
add wave -noupdate -group {UART RX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_rx_unit/reset
add wave -noupdate -group {UART RX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_rx_unit/rx
add wave -noupdate -group {UART RX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_rx_unit/s_tick
add wave -noupdate -group {UART RX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_rx_unit/rx_done_tick
add wave -noupdate -group {UART RX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_rx_unit/dout
add wave -noupdate -group {UART RX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_rx_unit/state_reg
add wave -noupdate -group {UART RX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_rx_unit/state_next
add wave -noupdate -group {UART RX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_rx_unit/s_reg
add wave -noupdate -group {UART RX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_rx_unit/s_next
add wave -noupdate -group {UART RX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_rx_unit/n_reg
add wave -noupdate -group {UART RX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_rx_unit/n_next
add wave -noupdate -group {UART RX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_rx_unit/b_reg
add wave -noupdate -group {UART RX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_rx_unit/b_next
add wave -noupdate -group {RX FIFO} /uart_tb_top/UART_UNIT_DUT/uart_unit/fifo_rx/clk
add wave -noupdate -group {RX FIFO} /uart_tb_top/UART_UNIT_DUT/uart_unit/fifo_rx/reset
add wave -noupdate -group {RX FIFO} /uart_tb_top/UART_UNIT_DUT/uart_unit/fifo_rx/rd
add wave -noupdate -group {RX FIFO} /uart_tb_top/UART_UNIT_DUT/uart_unit/fifo_rx/wr
add wave -noupdate -group {RX FIFO} /uart_tb_top/UART_UNIT_DUT/uart_unit/fifo_rx/w_data
add wave -noupdate -group {RX FIFO} /uart_tb_top/UART_UNIT_DUT/uart_unit/fifo_rx/empty
add wave -noupdate -group {RX FIFO} /uart_tb_top/UART_UNIT_DUT/uart_unit/fifo_rx/full
add wave -noupdate -group {RX FIFO} /uart_tb_top/UART_UNIT_DUT/uart_unit/fifo_rx/r_data
add wave -noupdate -group {RX FIFO} /uart_tb_top/UART_UNIT_DUT/uart_unit/fifo_rx/w_addr
add wave -noupdate -group {RX FIFO} /uart_tb_top/UART_UNIT_DUT/uart_unit/fifo_rx/r_addr
add wave -noupdate -group {RX FIFO} /uart_tb_top/UART_UNIT_DUT/uart_unit/fifo_rx/wr_en
add wave -noupdate -group {RX FIFO} /uart_tb_top/UART_UNIT_DUT/uart_unit/fifo_rx/full_tmp
add wave -noupdate -group {UART TX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_tx_unit/clk
add wave -noupdate -group {UART TX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_tx_unit/reset
add wave -noupdate -group {UART TX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_tx_unit/tx_start
add wave -noupdate -group {UART TX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_tx_unit/s_tick
add wave -noupdate -group {UART TX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_tx_unit/din
add wave -noupdate -group {UART TX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_tx_unit/tx_done_tick
add wave -noupdate -group {UART TX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_tx_unit/tx
add wave -noupdate -group {UART TX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_tx_unit/state_reg
add wave -noupdate -group {UART TX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_tx_unit/state_next
add wave -noupdate -group {UART TX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_tx_unit/s_reg
add wave -noupdate -group {UART TX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_tx_unit/s_next
add wave -noupdate -group {UART TX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_tx_unit/n_reg
add wave -noupdate -group {UART TX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_tx_unit/n_next
add wave -noupdate -group {UART TX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_tx_unit/b_reg
add wave -noupdate -group {UART TX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_tx_unit/b_next
add wave -noupdate -group {UART TX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_tx_unit/tx_reg
add wave -noupdate -group {UART TX} /uart_tb_top/UART_UNIT_DUT/uart_unit/uart_tx_unit/tx_next
add wave -noupdate -group {TX FIFO} /uart_tb_top/UART_UNIT_DUT/uart_unit/fifo_tx/clk
add wave -noupdate -group {TX FIFO} /uart_tb_top/UART_UNIT_DUT/uart_unit/fifo_tx/reset
add wave -noupdate -group {TX FIFO} /uart_tb_top/UART_UNIT_DUT/uart_unit/fifo_tx/rd
add wave -noupdate -group {TX FIFO} /uart_tb_top/UART_UNIT_DUT/uart_unit/fifo_tx/wr
add wave -noupdate -group {TX FIFO} /uart_tb_top/UART_UNIT_DUT/uart_unit/fifo_tx/w_data
add wave -noupdate -group {TX FIFO} /uart_tb_top/UART_UNIT_DUT/uart_unit/fifo_tx/empty
add wave -noupdate -group {TX FIFO} /uart_tb_top/UART_UNIT_DUT/uart_unit/fifo_tx/full
add wave -noupdate -group {TX FIFO} /uart_tb_top/UART_UNIT_DUT/uart_unit/fifo_tx/r_data
add wave -noupdate -group {TX FIFO} /uart_tb_top/UART_UNIT_DUT/uart_unit/fifo_tx/w_addr
add wave -noupdate -group {TX FIFO} /uart_tb_top/UART_UNIT_DUT/uart_unit/fifo_tx/r_addr
add wave -noupdate -group {TX FIFO} /uart_tb_top/UART_UNIT_DUT/uart_unit/fifo_tx/wr_en
add wave -noupdate -group {TX FIFO} /uart_tb_top/UART_UNIT_DUT/uart_unit/fifo_tx/full_tmp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5369220000 ps} 0} {{Cursor 2} {64487243443 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 381
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {63280676325 ps} {147438732825 ps}
