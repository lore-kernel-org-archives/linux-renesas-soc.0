Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:44550 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756739AbdLOPQI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 10:16:08 -0500
Received: by mail-wm0-f68.google.com with SMTP id t8so18090561wmc.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2017 07:16:07 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 0/7] up-port of out-of-tree GSX GPU driver for r8a7796
Date: Fri, 15 Dec 2017 16:15:38 +0100
Message-Id: <1513350945-2642-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

This is a set of patches to the out-of-tree driver for the PowerVR GX6650
GPU used in the R-Car M3-W SoC that is required to make it work on mainline.

The driver source can be downloaded here:
https://www.renesas.com/en-us/solutions/automotive/rcar-demoboard.html

The patched driver can also be found at
https://github.com/uli/r8a7796-gpu

The OpenCL tests and various others that are supplied with the "R-Car H3
Evaluation Software Package for Linux for Yocto v2.23.0" at
https://www.renesas.com/en-us/solutions/automotive/rcar-opencl.html
pass. Anything that relies on EGL, however, fails early with an error
from eglInitialize(). I suspect this to be an incompatibility of the binary
blob libraries with my user space and will look into it further.

A description of the test setup and some test results can be found here:
https://www.elinux.org/User:Uli/R-Car_M3-W_Mainline_GPU_Test

This relies on the series "r8a7796 bits required for out-of-tree GSX module"
for the DT and clock driver bits.

CU
Uli


Ulrich Hecht (7):
  drm/img-rogue: adapt to changed fence API
  drm/img-rogue: change #include <asm/uaccess.h> to <linux/uaccess.h>
  drm/img-rogue: #include <linux/sched/clock.h> in osfunc.c
  drm/img-rogue: dma_buf_ops .kmap_* are now .map_*
  drm/img-rogue: dma_ops->sync_single_for_*() -> dma_sync_single_for_*()
  drm/img-rogue: init_timer() -> setup_timer()
  drm/img-rogue: replace call to obsolete drm_platform_init()

 include/drm/pvr_drm.h                            |  2 +
 kernel/drivers/staging/imgtec/pvr_buffer_sync.c  | 38 ++++++-------
 kernel/drivers/staging/imgtec/pvr_drm.c          | 23 +-------
 kernel/drivers/staging/imgtec/pvr_fence.c        | 68 ++++++++++++------------
 kernel/drivers/staging/imgtec/pvr_fence.h        | 20 +++----
 kernel/drivers/staging/imgtec/pvr_platform_drv.c | 19 ++++++-
 services/server/env/linux/osfunc.c               | 13 ++---
 services/server/env/linux/osfunc_arm64.c         | 24 ++-------
 services/server/env/linux/physmem_dmabuf.c       |  4 +-
 services/server/env/linux/pvr_uaccess.h          |  2 +-
 10 files changed, 96 insertions(+), 117 deletions(-)

-- 
2.7.4
