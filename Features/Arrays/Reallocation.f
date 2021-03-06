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

module MFReallocation

    use MArrays
    use MUAsserts
    use MUReport

    implicit none
    private

    integer, parameter :: NUMBER_OF_ELEMENTS = 5

    type, public :: TFReallocation
    contains
        procedure, nopass :: present
    end type
contains
    subroutine present()
        call oneDimensional()
        call twoDimensional()

        print *, ''
    end subroutine present

    subroutine oneDimensional()
        integer, dimension(:), allocatable :: array
        integer, dimension(:), allocatable :: temporary_array

        type(TArrays) Arrays
        real start

        call cpu_time(start)

        allocate(array(NUMBER_OF_ELEMENTS))
        call Arrays.fillWithSequence(array)
        allocate(temporary_array(NUMBER_OF_ELEMENTS + 2))
        temporary_array(1:size(array)) = array

        call report('Reallocation', 'OneDimension', '', start)
        call assert_equals(temporary_array(1:size(array)), array)

        deallocate(array)
        call move_alloc(temporary_array, array)

        deallocate(array)
    end subroutine

    subroutine twoDimensional()
        integer, dimension(:,:), allocatable :: array
        integer, dimension(:,:), allocatable :: temporary_array

        type(TArrays) Arrays
        real start

        call cpu_time(start)

        allocate(array(NUMBER_OF_ELEMENTS, NUMBER_OF_ELEMENTS))

        call Arrays.fillWithSequence(array)
        allocate(temporary_array(NUMBER_OF_ELEMENTS + 2, NUMBER_OF_ELEMENTS + 2))
        temporary_array(1:size(array, 1), 1:size(array, 2)) = array

        call report('Reallocation', 'TwoDimension', '', start)
        call assert_equals(temporary_array(1:size(array, 1), 1:size(array, 2)), array)

        deallocate(array)
        call move_alloc(temporary_array, array)

        deallocate(array)
    end subroutine
end module
