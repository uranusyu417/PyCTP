%module(directors="1") PyCTP

%include "typemaps.i"
%include "cstring.i"


%{
#define SWIG_FILE_WITH_INIT
#include "ThostFtdcUserApiDataType.h"
#include "ThostFtdcUserApiStruct.h"
#include "ThostFtdcTraderApi.h"
#include "ThostFtdcMdApi.h"
%}


%include "ThostFtdcUserApiDataType.h"
%include "ThostFtdcUserApiStruct.h"

%feature("director") CThostFtdcTraderSpi;
%include "ThostFtdcTraderApi.h"


%feature("director") CThostFtdcMdSpi;
%typemap(in) char *ppInstrumentID[] {
  /* Check if is a list */
  if (PyList_Check($input)) {
    int size = PyList_Size($input);
    int i = 0;
    $1 = (char **) malloc((size+1)*sizeof(char *));
    for (i = 0; i < size; i++) {
      PyObject *o = PyList_GetItem($input, i);
      if (PyString_Check(o)) {
        $1[i] = PyString_AsString(PyList_GetItem($input, i));
      } else {
        free($1);
        PyErr_SetString(PyExc_TypeError, "list must contain strings");
        SWIG_fail;
      }
    }
    $1[i] = 0;
  } else {
    PyErr_SetString(PyExc_TypeError, "not a list");
    SWIG_fail;
  }
}
// This cleans up the char ** array we malloc'd before the function call
%typemap(freearg) char *ppInstrumentID[] {
  free((char *) $1);
} 
%include "ThostFtdcMdApi.h"
