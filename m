Return-Path: <SRS0=FDtJ=RR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D337C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 22:54:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4C65421873
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 22:54:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbfCNWyw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 Mar 2019 18:54:52 -0400
Received: from sauhun.de ([88.99.104.3]:32938 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727489AbfCNWyv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Mar 2019 18:54:51 -0400
Received: from localhost (p54B33449.dip0.t-ipconnect.de [84.179.52.73])
        by pokefinder.org (Postfix) with ESMTPSA id 0FF9E2C0963;
        Thu, 14 Mar 2019 23:54:49 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFC] mmc: renesas_sdhi: update copyright information
Date:   Thu, 14 Mar 2019 23:54:41 +0100
Message-Id: <20190314225441.310-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Mostly year updates, but one addition as well.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I checked the git history to back up these changes to the best of my knowledge.
I chose to not modify the copyright information of other people but give them
here the chance to speak up :)


 drivers/mmc/host/renesas_sdhi.h               | 2 +-
 drivers/mmc/host/renesas_sdhi_core.c          | 4 ++--
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 3 ++-
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 4 ++--
 drivers/mmc/host/tmio_mmc.h                   | 4 ++--
 drivers/mmc/host/tmio_mmc_core.c              | 4 ++--
 6 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 8394a7bb1fc1..c0504aa90857 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -3,7 +3,7 @@
  * Renesas Mobile SDHI
  *
  * Copyright (C) 2017 Horms Solutions Ltd., Simon Horman
- * Copyright (C) 2017 Renesas Electronics Corporation
+ * Copyright (C) 2017-19 Renesas Electronics Corporation
  */
 
 #ifndef RENESAS_SDHI_H
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 71e13844df6c..923719e1282a 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -2,8 +2,8 @@
 /*
  * Renesas SDHI
  *
- * Copyright (C) 2015-17 Renesas Electronics Corporation
- * Copyright (C) 2016-17 Sang Engineering, Wolfram Sang
+ * Copyright (C) 2015-19 Renesas Electronics Corporation
+ * Copyright (C) 2016-19 Sang Engineering, Wolfram Sang
  * Copyright (C) 2016-17 Horms Solutions, Simon Horman
  * Copyright (C) 2009 Magnus Damm
  *
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index af0288f04200..751fe91c7571 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -2,8 +2,9 @@
 /*
  * DMA support for Internal DMAC with SDHI SD/SDIO controller
  *
- * Copyright (C) 2016-17 Renesas Electronics Corporation
+ * Copyright (C) 2016-19 Renesas Electronics Corporation
  * Copyright (C) 2016-17 Horms Solutions, Simon Horman
+ * Copyright (C) 2018-19 Sang Engineering, Wolfram Sang
  */
 
 #include <linux/bitops.h>
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index bfbf36634faa..1d29b822efb8 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -2,8 +2,8 @@
 /*
  * DMA support use of SYS DMAC with SDHI SD/SDIO controller
  *
- * Copyright (C) 2016-17 Renesas Electronics Corporation
- * Copyright (C) 2016-17 Sang Engineering, Wolfram Sang
+ * Copyright (C) 2016-19 Renesas Electronics Corporation
+ * Copyright (C) 2016-19 Sang Engineering, Wolfram Sang
  * Copyright (C) 2017 Horms Solutions, Simon Horman
  * Copyright (C) 2010-2011 Guennadi Liakhovetski
  */
diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index 64e00d8f3a88..c5ba13fae399 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -4,8 +4,8 @@
  *
  * TC6393XB TC6391XB TC6387XB T7L66XB ASIC3
  *
- * Copyright (C) 2015-17 Renesas Electronics Corporation
- * Copyright (C) 2016-17 Sang Engineering, Wolfram Sang
+ * Copyright (C) 2015-19 Renesas Electronics Corporation
+ * Copyright (C) 2016-19 Sang Engineering, Wolfram Sang
  * Copyright (C) 2016-17 Horms Solutions, Simon Horman
  * Copyright (C) 2007 Ian Molton
  * Copyright (C) 2004 Ian Molton
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index dfc15ce41191..130b91cb0f8a 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -4,8 +4,8 @@
  *
  * TC6393XB, TC6391XB, TC6387XB, T7L66XB, ASIC3, SH-Mobile SoCs
  *
- * Copyright (C) 2015-17 Renesas Electronics Corporation
- * Copyright (C) 2016-17 Sang Engineering, Wolfram Sang
+ * Copyright (C) 2015-19 Renesas Electronics Corporation
+ * Copyright (C) 2016-19 Sang Engineering, Wolfram Sang
  * Copyright (C) 2017 Horms Solutions, Simon Horman
  * Copyright (C) 2011 Guennadi Liakhovetski
  * Copyright (C) 2007 Ian Molton
-- 
2.11.0

