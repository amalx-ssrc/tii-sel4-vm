#
# Copyright 2018, Data61, CSIRO (ABN 41 687 119 230)
# Copyright 2022, Technology Innovation Institute
#
# SPDX-License-Identifier: BSD-2-Clause
#

set(supported "qemu-arm-virt;rpi4")
if(NOT "${PLATFORM}" IN_LIST supported)
    message(FATAL_ERROR "PLATFORM: ${PLATFORM} not supported.
         Supported: ${supported}")
endif()
set(LibUSB                  OFF CACHE BOOL "" FORCE)
set(VmOnDemandDeviceInstall ON CACHE BOOL "" FORCE)
set(VmEmmc2NoDMA            ON CACHE BOOL "" FORCE)
set(VmVUSB                  OFF CACHE BOOL "" FORCE)
set(VmPCISupport            ON CACHE BOOL "" FORCE)
set(VmVirtioNetArping       OFF CACHE BOOL "" FORCE)
set(VmVirtioNetVirtqueue    ON CACHE BOOL "" FORCE)
set(VmVirtioConsole         ON CACHE BOOL "" FORCE)
# set(VmRootfs              "" CACHE STRING "" FORCE)
set(VmInitRdFile            ON CACHE BOOL "" FORCE)
set(VmDtbFile               OFF CACHE BOOL "" FORCE)

if("${PLATFORM}" STREQUAL "qemu-arm-virt")
    set(QEMU_MEMORY             "4096")
    set(KernelArmCPU            cortex-a53 CACHE STRING "" FORCE)
    set(qemu_sim_extra_args     "-netdev tap,id=mynet0,ifname=tap0,script=no,downscript=no -device virtio-net,netdev=mynet0,mac=52:55:00:d1:55:01")
    set(KernelArmExportPCNTUser ON CACHE BOOL "" FORCE)
    set(KernelArmExportPTMRUser ON CACHE BOOL "" FORCE)
endif()
