
include $(BUILD_SYSTEM)/clang/x86.mk
include $(BUILD_SYSTEM)/clang/HOST_x86_common.mk

ifeq ($(HOST_OS),linux)
CLANG_CONFIG_x86_HOST_TRIPLE := i686-linux-gnu
CLANG_CONFIG_x86_HOST_COMBO_EXTRA_ASFLAGS := $(CLANG_CONFIG_x86_LINUX_HOST_EXTRA_ASFLAGS)
CLANG_CONFIG_x86_HOST_COMBO_EXTRA_CFLAGS := $(CLANG_CONFIG_x86_LINUX_HOST_EXTRA_CFLAGS)
CLANG_CONFIG_x86_HOST_COMBO_EXTRA_CPPFLAGS := $(CLANG_CONFIG_x86_LINUX_HOST_EXTRA_CPPFLAGS)
CLANG_CONFIG_x86_HOST_COMBO_EXTRA_LDFLAGS := $(CLANG_CONFIG_x86_LINUX_HOST_EXTRA_LDFLAGS)
endif
ifeq ($(HOST_OS),darwin)
CLANG_CONFIG_x86_HOST_TRIPLE := i686-apple-darwin
CLANG_CONFIG_x86_HOST_COMBO_EXTRA_ASFLAGS := $(CLANG_CONFIG_x86_DARWIN_HOST_EXTRA_ASFLAGS)
CLANG_CONFIG_x86_HOST_COMBO_EXTRA_CFLAGS := $(CLANG_CONFIG_x86_DARWIN_HOST_EXTRA_CFLAGS)
CLANG_CONFIG_x86_HOST_COMBO_EXTRA_CPPFLAGS := $(CLANG_CONFIG_x86_DARWIN_HOST_EXTRA_CPPFLAGS)
CLANG_CONFIG_x86_HOST_COMBO_EXTRA_LDFLAGS := $(CLANG_CONFIG_x86_DARWIN_HOST_EXTRA_LDFLAGS)
endif

CLANG_CONFIG_x86_HOST_EXTRA_ASFLAGS := \
  $(CLANG_CONFIG_EXTRA_ASFLAGS) \
  $(CLANG_CONFIG_HOST_EXTRA_ASFLAGS) \
  $(CLANG_CONFIG_x86_EXTRA_ASFLAGS) \
  $(CLANG_CONFIG_x86_HOST_COMBO_EXTRA_ASFLAGS) \
  -target $(CLANG_CONFIG_x86_HOST_TRIPLE)

CLANG_CONFIG_x86_HOST_EXTRA_CFLAGS := \
  $(CLANG_CONFIG_EXTRA_CFLAGS) \
  $(CLANG_CONFIG_HOST_EXTRA_CFLAGS) \
  $(CLANG_CONFIG_x86_EXTRA_CFLAGS) \
  $(CLANG_CONFIG_x86_HOST_COMBO_EXTRA_CFLAGS) \
  $(CLANG_CONFIG_x86_HOST_EXTRA_ASFLAGS)

CLANG_CONFIG_x86_HOST_EXTRA_CONLYFLAGS := \
  $(CLANG_CONFIG_EXTRA_CONLYFLAGS) \
  $(CLANG_CONFIG_HOST_EXTRA_CONLYFLAGS) \
  $(CLANG_CONFIG_x86_EXTRA_CONLYFLAGS) \
  $(CLANG_CONFIG_x86_HOST_COMBO_EXTRA_CONLYFLAGS)

CLANG_CONFIG_x86_HOST_EXTRA_CPPFLAGS := \
  $(CLANG_CONFIG_EXTRA_CPPFLAGS) \
  $(CLANG_CONFIG_HOST_EXTRA_CPPFLAGS) \
  $(CLANG_CONFIG_x86_EXTRA_CPPFLAGS) \
  $(CLANG_CONFIG_x86_HOST_COMBO_EXTRA_CPPFLAGS)

CLANG_CONFIG_x86_HOST_EXTRA_LDFLAGS := \
  $(CLANG_CONFIG_EXTRA_LDFLAGS) \
  $(CLANG_CONFIG_HOST_EXTRA_LDFLAGS) \
  $(CLANG_CONFIG_x86_EXTRA_LDFLAGS) \
  $(CLANG_CONFIG_x86_HOST_COMBO_EXTRA_LDFLAGS) \
  -target $(CLANG_CONFIG_x86_HOST_TRIPLE)

define $(clang_2nd_arch_prefix)convert-to-host-clang-flags
  $(strip \
  $(call subst-clang-incompatible-x86-flags,\
  $(filter-out $(CLANG_CONFIG_x86_UNKNOWN_CFLAGS),\
  $(1))))
endef

$(clang_2nd_arch_prefix)HOST_LIBPROFILE_RT := $(LLVM_RTLIB_PATH)/libclang_rt.profile-i686.a
