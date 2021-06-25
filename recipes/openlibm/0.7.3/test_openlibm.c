#define OPENLIBM_USE_HOST_COMPLEX_H
#define OPENLIBM_USE_HOST_FENV_H
#include <openlibm.h>
#include <stdio.h>

int main()
{
    if (!isopenlibm()) {
        return 1;
    }

    printf("tanh(-0.3589835151970974): %.17g\n", tanh(-0.3589835151970974));
    printf("exp(99.06494938359764): %.17g\n", exp(99.06494938359764));

    return 0;
}
