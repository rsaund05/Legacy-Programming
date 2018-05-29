program sieve
	integer :: u
	print *, "(Fortran)"
	print *, "Enter an upper bound: "
	read(*,'(i20)',iostat=ierror) u
	call runSieve(u)

	


contains
subroutine runSieve(u)
	implicit none
	real :: startTime, endTime, milSec
	integer :: u
	integer :: i
	integer :: p = 2
	integer :: j
	integer :: h
	integer, dimension(0:u + 1) :: prime
	open(1, file='outputFortran.txt', status='replace')
	!Initialize array
	do i = 0, u
		prime(i) = 1
	end do
	call cpu_time(startTime)
	do while(p * p <= u) 
		if(prime(p) == 1) then
			j = p * 2
			do
				prime(j) = 0
				j = j + p
				if(j >= u + 1) exit
			end do
		end if
		p = p + 1
	end do

	do h = 2, u + 1
		if(prime(h) == 1) then
			write(1, *) h
		end if
	end do
	call cpu_time(endTime)
	milSec = (endTime - startTime)*1000
	print *, "Total Execution Time: ", milSec
	close(1)
end 
end program sieve