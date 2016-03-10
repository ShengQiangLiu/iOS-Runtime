struct objc_selector; struct objc_class;
struct __rw_objc_super { struct objc_object *object; struct objc_object *superClass; };
#ifndef _REWRITER_typedef_Protocol
typedef struct objc_object Protocol;
#define _REWRITER_typedef_Protocol
#endif
#define __OBJC_RW_DLLIMPORT extern
__OBJC_RW_DLLIMPORT struct objc_object *objc_msgSend(struct objc_object *, struct objc_selector *, ...);
__OBJC_RW_DLLIMPORT struct objc_object *objc_msgSendSuper(struct objc_super *, struct objc_selector *, ...);
__OBJC_RW_DLLIMPORT struct objc_object* objc_msgSend_stret(struct objc_object *, struct objc_selector *, ...);
__OBJC_RW_DLLIMPORT struct objc_object* objc_msgSendSuper_stret(struct objc_super *, struct objc_selector *, ...);
__OBJC_RW_DLLIMPORT double objc_msgSend_fpret(struct objc_object *, struct objc_selector *, ...);
__OBJC_RW_DLLIMPORT struct objc_object *objc_getClass(const char *);
__OBJC_RW_DLLIMPORT struct objc_class *class_getSuperclass(struct objc_class *);
__OBJC_RW_DLLIMPORT struct objc_object *objc_getMetaClass(const char *);
__OBJC_RW_DLLIMPORT void objc_exception_throw(struct objc_object *);
__OBJC_RW_DLLIMPORT void objc_exception_try_enter(void *);
__OBJC_RW_DLLIMPORT void objc_exception_try_exit(void *);
__OBJC_RW_DLLIMPORT struct objc_object *objc_exception_extract(void *);
__OBJC_RW_DLLIMPORT int objc_exception_match(struct objc_class *, struct objc_object *);
__OBJC_RW_DLLIMPORT int objc_sync_enter(struct objc_object *);
__OBJC_RW_DLLIMPORT int objc_sync_exit(struct objc_object *);
__OBJC_RW_DLLIMPORT Protocol *objc_getProtocol(const char *);
#ifndef __FASTENUMERATIONSTATE
struct __objcFastEnumerationState {
	unsigned long state;
	void **itemsPtr;
	unsigned long *mutationsPtr;
	unsigned long extra[5];
};
__OBJC_RW_DLLIMPORT void objc_enumerationMutation(struct objc_object *);
#define __FASTENUMERATIONSTATE
#endif
#ifndef __NSCONSTANTSTRINGIMPL
struct __NSConstantStringImpl {
  int *isa;
  int flags;
  char *str;
  long length;
};
#ifdef CF_EXPORT_CONSTANT_STRING
extern "C" __declspec(dllexport) int __CFConstantStringClassReference[];
#else
__OBJC_RW_DLLIMPORT int __CFConstantStringClassReference[];
#endif
#define __NSCONSTANTSTRINGIMPL
#endif
#ifndef BLOCK_IMPL
#define BLOCK_IMPL
struct __block_impl {
  void *isa;
  int Flags;
  int Reserved;
  void *FuncPtr;
};
// Runtime copy/destroy helper functions (from Block_private.h)
#ifdef __OBJC_EXPORT_BLOCKS
extern "C" __declspec(dllexport) void _Block_object_assign(void *, const void *, const int);
extern "C" __declspec(dllexport) void _Block_object_dispose(const void *, const int);
extern "C" __declspec(dllexport) void *_NSConcreteGlobalBlock[32];
extern "C" __declspec(dllexport) void *_NSConcreteStackBlock[32];
#else
__OBJC_RW_DLLIMPORT void _Block_object_assign(void *, const void *, const int);
__OBJC_RW_DLLIMPORT void _Block_object_dispose(const void *, const int);
__OBJC_RW_DLLIMPORT void *_NSConcreteGlobalBlock[32];
__OBJC_RW_DLLIMPORT void *_NSConcreteStackBlock[32];
#endif
#endif
#define __block
#define __weak

#define __OFFSETOFIVAR__(TYPE, MEMBER) ((long long) &((TYPE *)0)->MEMBER)
static __NSConstantStringImpl __NSConstantStringImpl_main_m_0 __attribute__ ((section ("__DATA, __cfstring"))) = {__CFConstantStringClassReference,0x000007c8,"%s",2};
static __NSConstantStringImpl __NSConstantStringImpl_main_m_1 __attribute__ ((section ("__DATA, __cfstring"))) = {__CFConstantStringClassReference,0x000007c8,"%p",2};
static __NSConstantStringImpl __NSConstantStringImpl_main_m_2 __attribute__ ((section ("__DATA, __cfstring"))) = {__CFConstantStringClassReference,0x000007c8,"length",6};
static __NSConstantStringImpl __NSConstantStringImpl_main_m_3 __attribute__ ((section ("__DATA, __cfstring"))) = {__CFConstantStringClassReference,0x000007c8,"%s",2};
static __NSConstantStringImpl __NSConstantStringImpl_main_m_4 __attribute__ ((section ("__DATA, __cfstring"))) = {__CFConstantStringClassReference,0x000007c8,"%p",2};
static __NSConstantStringImpl __NSConstantStringImpl_main_m_5 __attribute__ ((section ("__DATA, __cfstring"))) = {__CFConstantStringClassReference,0x000007c8,"length",6};
static __NSConstantStringImpl __NSConstantStringImpl_main_m_6 __attribute__ ((section ("__DATA, __cfstring"))) = {__CFConstantStringClassReference,0x000007c8,"%s",2};
static __NSConstantStringImpl __NSConstantStringImpl_main_m_7 __attribute__ ((section ("__DATA, __cfstring"))) = {__CFConstantStringClassReference,0x000007c8,"%p",2};
static __NSConstantStringImpl __NSConstantStringImpl_main_m_8 __attribute__ ((section ("__DATA, __cfstring"))) = {__CFConstantStringClassReference,0x000007c8,"%d",2};
static __NSConstantStringImpl __NSConstantStringImpl_main_m_9 __attribute__ ((section ("__DATA, __cfstring"))) = {__CFConstantStringClassReference,0x000007c8,"%d",2};
//
//  main.m
//  OC-Self&Super
//
//  Created by admin on 16/3/6.
//  Copyright © 2016年 ShengQiangLiu. All rights reserved.
//

#include <Foundation/Foundation.h>
#include <objc/runtime.h>
#include "Son.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Son *son = ((Son *(*)(id, SEL))(void *)objc_msgSend)((id)((Son *(*)(id, SEL))(void *)objc_msgSend)(objc_getClass("Son"), sel_registerName("alloc")), sel_registerName("init"));
        
//        [son myClass];
        
//        ((Class (*)(id, SEL))(void *)objc_msgSend)((id)son, sel_registerName("myClass"));

        NSString *obj = ((NSString *(*)(id, SEL))(void *)objc_msgSend)((id)((NSString *(*)(id, SEL))(void *)objc_msgSend)(objc_getClass("NSString"), sel_registerName("alloc")), sel_registerName("init"));
        NSInteger count = ((NSUInteger (*)(id, SEL))(void *)objc_msgSend)((id)obj, sel_registerName("length"));
        
        
        SEL sel = sel_registerName("length");
        NSLog((NSString *)&__NSConstantStringImpl_main_m_0, sel_getName(sel));
        NSLog((NSString *)&__NSConstantStringImpl_main_m_1, sel);
        
        const char *selName = ((const char * _Nullable (*)(id, SEL))(void *)objc_msgSend)((id)&__NSConstantStringImpl_main_m_2, sel_registerName("UTF8String"));
        SEL sel2 = sel_registerName(selName);
        NSLog((NSString *)&__NSConstantStringImpl_main_m_3, sel_getName(sel2));
        NSLog((NSString *)&__NSConstantStringImpl_main_m_4, sel2);
        
        SEL sel3 = NSSelectorFromString((NSString *)&__NSConstantStringImpl_main_m_5);
        NSLog((NSString *)&__NSConstantStringImpl_main_m_6, sel_getName(sel3));
        NSLog((NSString *)&__NSConstantStringImpl_main_m_7, sel3);
        
        NSLog((NSString *)&__NSConstantStringImpl_main_m_8, sel_isEqual(sel, sel2));
        NSLog((NSString *)&__NSConstantStringImpl_main_m_9, sel_isEqual(sel2, sel3));
        

        
    }
    return 0;
}
