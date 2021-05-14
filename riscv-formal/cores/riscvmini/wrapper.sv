module rvfi_wrapper (
	input         clock,
	input         reset,
	`RVFI_OUTPUTS
);
	Tile uut (
		.clock    (clock    ),
		.reset    (reset   ),
		`RVFI_CONN
	);
endmodule

