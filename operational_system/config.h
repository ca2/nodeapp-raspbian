#pragma once



//#define _GNU_SOURCE
#define _REENTRANT
#define _THREAD_SAFE


#ifndef LINUX
#define LINUX
#endif


#ifndef RASPBIAN
#define RASPBIAN
#endif


#define BSD_STYLE_SOCKETS 1
#define HAVE_MYSQL 1
#define HAVE_OPENSSL 1

#define VARIADIC_TEMPLATE_FORMAT2


#ifdef _DEBUG
#define DEBUG
#endif


#define __WINESRC__

#define CLASS_DECL_EXPORT
#define CLASS_DECL_IMPORT
#define CLASS_DECL_THREAD __thread


#define __PLATFORM   "linux"



#ifndef OSBIT
#include "nodeapp/operational_system/bit.h"
#endif


#ifdef cplus
#define inline static
#endif

#ifdef __cplusplus

#define LOG_THIS_TAG (demangle(typeid(*this).name()))
#define LOG_MEMBER_PREFIX __FUNCTION__

#endif

#define static_inline static inline


#define AXIS_FREEIMAGE


#define FONT_SANS "FreeSans"
#define FONT_SERIF "FreeSerif"
#define FONT_MONO "Ubuntu Mono"
#define FONT_SANS_EX "Liberation Sans"
#define FONT_SERIF_EX "Liberation Serif"
#define FONT_SANS_FX "Ubuntu"
#define FONT_SERIF_FX "Bitstream Charter"




#define _strdup strdup




