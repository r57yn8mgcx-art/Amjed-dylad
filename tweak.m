#import <UIKit/UIKit.h>
#import <objc/runtime.h>

static UIApplicationState (*original_applicationState)(id, SEL);

static UIApplicationState fake_applicationState(id self, SEL _cmd) {
    return UIApplicationStateActive;
}

__attribute__((constructor)) static void setup_background_tweak() {
    Class appClass = objc_getClass("UIApplication");
    Method stateMethod = class_getInstanceMethod(appClass, @selector(applicationState));
    original_applicationState = (UIApplicationState (*)(id, SEL))method_getImplementation(stateMethod);
    method_setImplementation(stateMethod, (IMP)fake_applicationState);
}
