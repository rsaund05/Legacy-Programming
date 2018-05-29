with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO; 
with Ada.Strings.Bounded; use Ada.Strings.Bounded;
with Ada.Calendar; use Ada.Calendar;

procedure sieve is
	type primeArr is array(integer range<>) of integer;
	upper : integer;
	i : integer := 2;
	j : integer;
	outFp : file_type;
	start_t : Time;
	end_t : Time;
	total_t : duration;

begin
	put_line("(Ada)");
	put_line("Enter Upper Bound: ");
	get(upper);
	declare
		prime : primeArr(0..upper + 1);
	begin
		start_t := Clock;
		create(outFp, Ada.Text_IO.Out_File, "outputAda.txt");
		for e in 0..upper loop
			prime(e) := 1;
		end loop;
		while i * i <= upper loop
			if prime(i) = 1 then
				j := i * 2;
				loop
					prime(j) := 0;
					j := j + i;
					exit when j >= upper + 1;
				end loop;
			end if;
			i := i + 1;
		end loop;
		set_output(outFp);
		for k in 2..upper + 1 loop
			if prime(k) = 1 then
				put(k);
				new_line;
			end if;
		end loop;
		end_t := Clock;
		total_t := end_t - start_t;
		total_t := total_t*1000;
		set_output(standard_output);
		put_line("Total Execution Time: ");
		put(Duration'image(total_t));
	end;
end sieve;