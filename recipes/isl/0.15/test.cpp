// Sample code adapted from https://www.cs.colostate.edu/wiki/ISL:_Integer_Set_Library
#include <iostream>
using std::cout;
using std::endl;
using std::string;
#include <isl/flow.h>
#include <isl/constraint.h>
#include <isl/ctx.h>
#include <isl/set.h>
#include <isl/map.h>
#include <isl/printer.h>
int main()
{
   isl_ctx *ctx=NULL;
   ctx=isl_ctx_alloc();
   isl_printer *printer=NULL;
   printer=isl_printer_to_str(ctx );
   // define the input set as string
   string affine_formula_string= "[n,m]->{[i,j]: exists(x : x>=i and x<=n and x>=j and x<=m and m<=100)}";
   // define isl basic set
   isl_basic_set *set1;
    //read the input set from srting
   set1 =  isl_basic_set_read_from_str(ctx, affine_formula_string.c_str() );
   // The ISL will apply Fourier-Motzkin method automatically, to eliminate existential variables
   // set the output format to be ISL format
   isl_printer_set_output_format(printer , ISL_FORMAT_ISL);
   isl_printer_print_basic_set(printer ,set1);
   char *isl_set_str=isl_printer_get_str(printer);
   affine_formula_string = isl_set_str;
   isl_printer_flush(printer);
   free(isl_set_str);
   isl_basic_set_free(set1);
   set1= NULL;

   cout<<"The output set from ISL, after projecting out existential variables is"<<endl;
   cout<< affine_formula_string <<endl;
   return 0;
}
