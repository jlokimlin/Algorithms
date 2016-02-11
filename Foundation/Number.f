!
! The Laboratory of Algorithms
!
! The MIT License
!
! Copyright 2011-2016 Andrey Pudov.
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

submodule (Foundation) Number
contains
    module subroutine number_initWithCharacter(self, value)
        class(Number), intent(in out) :: self
        character, intent(in)         :: value

        self%charValue = value
    end subroutine

    module subroutine number_initWithInteger(self, value)
        class(Number), intent(in out) :: self
        integer, intent(in)           :: value

        self%intValue = value
    end subroutine

    module subroutine number_initWithLogical(self, value)
        class(Number), intent(in out) :: self
        logical, intent(in)           :: value

        self%logValue = value
    end subroutine

    module subroutine number_initWithReal(self, value)
        class(Number), intent(in out) :: self
        real, intent(in)              :: value

        self%doubleValue = value
    end subroutine

    module function number_characterValue(self) result(value)
        class(Number), intent(in) :: self
        character                 :: value

        value = self%charValue
    end function

    module function number_integerValue(self) result(value)
        class(Number), intent(in) :: self
        integer                   :: value

        value = self%intValue
    end function

    module function number_logicalValue(self) result(value)
        class(Number), intent(in) :: self
        logical                   :: value

        value = self%logValue
    end function

    module function number_realValue(self) result(value)
        class(Number), intent(in) :: self
        real                      :: value

        value = self%doubleValue
    end function

    module subroutine number_assign_character(instance, value)
        class(Number), intent(out)   :: instance
        character, intent(in)        :: value

        call instance%initWithCharacter(value)
    end subroutine

    module subroutine number_assign_integer(instance, value)
        class(Number), intent(out)   :: instance
        integer, intent(in)          :: value

        call instance%initWithInteger(value)
    end subroutine

    module subroutine number_assign_logical(instance, value)
        class(Number), intent(out)   :: instance
        logical, intent(in)          :: value

        call instance%initWithLogical(value)
    end subroutine

    module subroutine number_assign_real(instance, value)
        class(Number), intent(out)   :: instance
        real, intent(in)             :: value

        call instance%initWithReal(value)
    end subroutine
end submodule
