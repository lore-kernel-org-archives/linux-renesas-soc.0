Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45286 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727445AbeHVBYp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Aug 2018 21:24:45 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Vinod Koul <vkoul@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] dmaengine: use SPDX identifier for Renesas drivers
Date: Wed, 22 Aug 2018 00:02:15 +0200
Message-Id: <20180821220233.9202-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180821220233.9202-1-wsa+renesas@sang-engineering.com>
References: <20180821220233.9202-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

To be applied individually per subsystem tree. Morimoto-san, could you maybe
ack this with your Renesas address?

 drivers/dma/nbpfaxi.c          | 5 +----
 drivers/dma/sh/shdma-arm.h     | 5 +----
 drivers/dma/sh/shdma-base.c    | 5 +----
 drivers/dma/sh/shdma-of.c      | 5 +----
 drivers/dma/sh/shdma-r8a73a4.c | 5 +----
 drivers/dma/sh/shdma.h         | 6 +-----
 drivers/dma/sh/shdmac.c        | 6 +-----
 drivers/dma/sh/sudmac.c        | 5 +----
 drivers/dma/sh/usb-dmac.c      | 5 +----
 9 files changed, 9 insertions(+), 38 deletions(-)

diff --git a/drivers/dma/nbpfaxi.c b/drivers/dma/nbpfaxi.c
index 8c7b2e8703da..38d251b198b8 100644
--- a/drivers/dma/nbpfaxi.c
+++ b/drivers/dma/nbpfaxi.c
@@ -1,10 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2013-2014 Renesas Electronics Europe Ltd.
  * Author: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
  */
 
 #include <linux/bitmap.h>
diff --git a/drivers/dma/sh/shdma-arm.h b/drivers/dma/sh/shdma-arm.h
index a1b0ef45d6a2..7459f9a13b5b 100644
--- a/drivers/dma/sh/shdma-arm.h
+++ b/drivers/dma/sh/shdma-arm.h
@@ -1,11 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Renesas SuperH DMA Engine support
  *
  * Copyright (C) 2013 Renesas Electronics, Inc.
- *
- * This is free software; you can redistribute it and/or modify it under the
- * terms of version 2 the GNU General Public License as published by the Free
- * Software Foundation.
  */
 
 #ifndef SHDMA_ARM_H
diff --git a/drivers/dma/sh/shdma-base.c b/drivers/dma/sh/shdma-base.c
index 6b5626e299b2..c51de498b5b4 100644
--- a/drivers/dma/sh/shdma-base.c
+++ b/drivers/dma/sh/shdma-base.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Dmaengine driver base library for DMA controllers, found on SH-based SoCs
  *
@@ -7,10 +8,6 @@
  * Copyright (C) 2009 Nobuhiro Iwamatsu <iwamatsu.nobuhiro@renesas.com>
  * Copyright (C) 2009 Renesas Solutions, Inc. All rights reserved.
  * Copyright (C) 2007 Freescale Semiconductor, Inc. All rights reserved.
- *
- * This is free software; you can redistribute it and/or modify
- * it under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
  */
 
 #include <linux/delay.h>
diff --git a/drivers/dma/sh/shdma-of.c b/drivers/dma/sh/shdma-of.c
index f999f9b0d314..be89dd894328 100644
--- a/drivers/dma/sh/shdma-of.c
+++ b/drivers/dma/sh/shdma-of.c
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * SHDMA Device Tree glue
  *
  * Copyright (C) 2013 Renesas Electronics Inc.
  * Author: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
- *
- * This is free software; you can redistribute it and/or modify
- * it under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
  */
 
 #include <linux/dmaengine.h>
diff --git a/drivers/dma/sh/shdma-r8a73a4.c b/drivers/dma/sh/shdma-r8a73a4.c
index 96ea3828c3eb..ddc9a3578353 100644
--- a/drivers/dma/sh/shdma-r8a73a4.c
+++ b/drivers/dma/sh/shdma-r8a73a4.c
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Renesas SuperH DMA Engine support for r8a73a4 (APE6) SoCs
  *
  * Copyright (C) 2013 Renesas Electronics, Inc.
- *
- * This is free software; you can redistribute it and/or modify it under the
- * terms of version 2 the GNU General Public License as published by the Free
- * Software Foundation.
  */
 #include <linux/sh_dma.h>
 
diff --git a/drivers/dma/sh/shdma.h b/drivers/dma/sh/shdma.h
index 2c0a969adc9f..fd702ca9a39c 100644
--- a/drivers/dma/sh/shdma.h
+++ b/drivers/dma/sh/shdma.h
@@ -1,14 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * Renesas SuperH DMA Engine support
  *
  * Copyright (C) 2009 Nobuhiro Iwamatsu <iwamatsu.nobuhiro@renesas.com>
  * Copyright (C) 2009 Renesas Solutions, Inc. All rights reserved.
  *
- * This is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
  */
 #ifndef __DMA_SHDMA_H
 #define __DMA_SHDMA_H
diff --git a/drivers/dma/sh/shdmac.c b/drivers/dma/sh/shdmac.c
index 04a74e0a95b7..fa37541b2d05 100644
--- a/drivers/dma/sh/shdmac.c
+++ b/drivers/dma/sh/shdmac.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Renesas SuperH DMA Engine support
  *
@@ -8,11 +9,6 @@
  * Copyright (C) 2009 Renesas Solutions, Inc. All rights reserved.
  * Copyright (C) 2007 Freescale Semiconductor, Inc. All rights reserved.
  *
- * This is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
  * - DMA of SuperH does not have Hardware DMA chain mode.
  * - MAX DMA size is 16MB.
  *
diff --git a/drivers/dma/sh/sudmac.c b/drivers/dma/sh/sudmac.c
index 69b9564dc9d9..30cc3553cb8b 100644
--- a/drivers/dma/sh/sudmac.c
+++ b/drivers/dma/sh/sudmac.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Renesas SUDMAC support
  *
@@ -8,10 +9,6 @@
  * Copyright (C) 2009 Nobuhiro Iwamatsu <iwamatsu.nobuhiro@renesas.com>
  * Copyright (C) 2009 Renesas Solutions, Inc. All rights reserved.
  * Copyright (C) 2007 Freescale Semiconductor, Inc. All rights reserved.
- *
- * This is free software; you can redistribute it and/or modify
- * it under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
  */
 
 #include <linux/dmaengine.h>
diff --git a/drivers/dma/sh/usb-dmac.c b/drivers/dma/sh/usb-dmac.c
index 1bb1a8e09025..7f7184c3cf95 100644
--- a/drivers/dma/sh/usb-dmac.c
+++ b/drivers/dma/sh/usb-dmac.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Renesas USB DMA Controller Driver
  *
@@ -6,10 +7,6 @@
  * based on rcar-dmac.c
  * Copyright (C) 2014 Renesas Electronics Inc.
  * Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
- *
- * This is free software; you can redistribute it and/or modify
- * it under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
  */
 
 #include <linux/delay.h>
-- 
2.11.0
