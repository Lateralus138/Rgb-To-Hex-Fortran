module is
contains
    function is_int(string) result(bool)
    implicit none
        character(len=:), allocatable :: string
        logical :: bool
        integer :: index
        bool = .true.
        string = adjustl(trim(string))
        do index=1,len(string)
            if (string(index:index) < '0' .or. string(index:index) > '9')then
                bool = .false.
            end if
        end do
    end function
end module is