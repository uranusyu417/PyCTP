"""
setup.py file for SWIG example
"""
from setuptools import setup
from setuptools.extension import Extension
import platform

if 'windows' in platform.system().lower(): 
    trader = Extension('_PyCTP',
                               libraries=['thostmduserapi_se', 'thosttraderapi_se'],
                               sources=["PyCTP.i"],
                               language='c++',
                               swig_opts=['-c++', '-threads'],
                               extra_compile_args=['/EHsc'])
else:
    trader = Extension('_PyCTP',
                               libraries=['thostmduserapi_se', 'thosttraderapi_se'],
                               sources=["PyCTP.i"],
                               language='c++',
                               swig_opts=['-c++', '-threads'],)

setup(name='PyCTP',
      version='0.1',
      author="Aaron Yu",
      description="""swig wrapper for CTP""",
      ext_modules=[trader],
      py_modules=["PyCTP"],)
