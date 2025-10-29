// Full Adder Design
module full_adder(input a,b,c_in,output sum,c_out);
  assign sum=(a ^ b ^ c_in);
  assign c_out =((a & b)|(b & c_in)|(c_in & a));
endmodule
