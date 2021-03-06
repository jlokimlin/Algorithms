!
! The Laboratory of Algorithms
!
! The MIT License
!
! Copyright 2011-2015 Andrey Pudov.
!
! Permission is hereby granted, free of charge, to any person obtaining a copy
! of this software and associated documentation files (the 'Software'), to deal
! in the Software without restriction, including without limitation the rights
! to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
! copies of the Software, and to permit persons to whom the Software is
! furnished to do so, subject to the following conditions:
!
! The above copyright notice and this permission notice shall be included in
! all copies or substantial portions of the Software.
!
! THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
! IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
! FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
! AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
! LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
! OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
! THE SOFTWARE.
!

module MArrayStack

    use MArrays
    use MStack

    implicit none
    private

    integer, parameter :: DEFAULT_SIZE = 16

    type, extends(TStack), public :: TArrayStack
    private
        integer, dimension(:), allocatable :: array
        integer                            :: index
    contains
        procedure :: peek
        procedure :: pop
        procedure :: push

        procedure :: empty

        procedure :: init
        procedure :: destroy
    end type

contains
    function peek(instance) result(value)
        class(TArrayStack), intent(in) :: instance
        integer                        :: value

        value = 0
        if (instance%index /= 0) then
            value = instance%array(instance%index)
        end if
    end function

    function pop(instance) result(value)
        class(TArrayStack), intent(in out) :: instance
        integer                            :: value

        value = 0
        if (instance%index /= 0) then
            value          = instance%array(instance%index)
            instance%index = instance%index - 1
        end if
    end function

    subroutine push(instance, value)
        class(TArrayStack), intent(in out) :: instance
        integer, intent(in)                :: value

        type(TArrays) arrays

        instance%index = instance%index + 1
        call arrays%increaseWhenRequired(instance%array, instance%index)
        instance%array(instance%index) = value
    end subroutine

    function empty(instance) result(value)
        class(TArrayStack), intent(in) :: instance
        logical :: value

        value = (instance%index == 0)
    end function

    subroutine init(instance)
        class(TArrayStack), intent(in out) :: instance

        allocate(instance%array(DEFAULT_SIZE))
        instance%index = 0
    end subroutine

    subroutine destroy(instance)
        class(TArrayStack), intent(in out) :: instance

        deallocate(instance%array)
    end subroutine
end module
