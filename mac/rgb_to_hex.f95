program main
    use is
    implicit none
    INTEGER ::  INDEX,ARGCOUNT,COLOR
    CHARACTER(len=:), ALLOCATABLE :: R,G,B,ARG,MIN,MAX,INT
    ALLOCATE(CHARACTER(len=2) :: R,G,B)
    ALLOCATE(CHARACTER(len=1) :: MIN)
    ALLOCATE(CHARACTER(len=3) :: MAX)
    ALLOCATE(CHARACTER(len=3) :: INT)
    MIN = '0'
    MAX = '255'
    ARGCOUNT = command_argument_count()
    if (ARGCOUNT .lt. 3) call exit(1)
    ARGCOUNT = 3
    ALLOCATE(CHARACTER(len=ARGCOUNT) :: ARG)
    do INDEX=1, ARGCOUNT
        call get_command_argument(INDEX,ARG)
        INT = ARG
        if (is_int(INT) .eqv. .false.) call exit(2)
        if(ARG .ge. MIN .and. ARG .le. MAX)then
            read(ARG,*) COLOR
            if (INDEX .eq. 1) write(R,'(Z2)') COLOR
            if (INDEX .eq. 2) write(G,'(Z2)') COLOR
            if (INDEX .eq. 3) write(B,'(Z2)') COLOR
        else 
            call exit(3)
        end if
    end do
    if(R(1:1) .eq. '') R(1:1) = '0'
    if(G(1:1) .eq. '') G(1:1) = '0'
    if(B(1:1) .eq. '') B(1:1) = '0'
    write(*,'(a)')R//G//B
end program main
