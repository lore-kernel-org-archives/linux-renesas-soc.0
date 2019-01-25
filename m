Return-Path: <SRS0=AddW=QB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F537C282C0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 16:53:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EBC02218CD
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 16:53:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729135AbfAYQxN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 25 Jan 2019 11:53:13 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:54568 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729124AbfAYQxJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jan 2019 11:53:09 -0500
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id Ugt61z00P3XaVaC01gt67j; Fri, 25 Jan 2019 17:53:06 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gn4j4-0007ZX-M0; Fri, 25 Jan 2019 17:53:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gn4j4-0002FY-KS; Fri, 25 Jan 2019 17:53:06 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 09/10] pinctrl: sh-pfc: Add missing #include <linux/errno.h>
Date:   Fri, 25 Jan 2019 17:53:04 +0100
Message-Id: <20190125165305.8567-10-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190125165305.8567-1-geert+renesas@glider.be>
References: <20190125165305.8567-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Source files using -Exxx error codes should include <linux/errno.h>.
On ARM, this header file is included indirectly, but not on SuperH,
leading to "error: ‘EINVAL’ undeclared" failures when enabling
compile-testing later.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 drivers/pinctrl/sh-pfc/pfc-r8a77470.c    | 1 +
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c     | 1 +
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c     | 1 +
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c     | 1 +
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 1 +
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 1 +
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c     | 1 +
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c    | 1 +
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c    | 1 +
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c    | 1 +
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c    | 1 +
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c    | 1 +
 12 files changed, 12 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77470.c b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
index 59384150615f4471..c05dc14904861285 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2018 Renesas Electronics Corp.
  */
 
+#include <linux/errno.h>
 #include <linux/kernel.h>
 
 #include "sh_pfc.h"
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
index bccdc44828108831..c41a6761cf9d4352 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2012  Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  */
 
+#include <linux/errno.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/sys_soc.h>
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
index 88f8f4cfa4597edb..1292ec8d268fc41f 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2014-2017 Cogent Embedded, Inc.
  */
 
+#include <linux/errno.h>
 #include <linux/kernel.h>
 
 #include "sh_pfc.h"
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
index dc0fab281e53ff1e..1ff4969d8381fff4 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2015-2017 Cogent Embedded, Inc. <source@cogentembedded.com>
  */
 
+#include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/sys_soc.h>
 
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
index cf8aba550945102f..59f636603f13c2cc 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2015-2017  Renesas Electronics Corporation
  */
 
+#include <linux/errno.h>
 #include <linux/kernel.h>
 
 #include "core.h"
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index de9b1d1500940cf6..234f1e33f4fdf628 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2015-2017 Renesas Electronics Corporation
  */
 
+#include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/sys_soc.h>
 
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index f49752ddae6518ce..69070aac9c36b809 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -11,6 +11,7 @@
  * Copyright (C) 2015  Renesas Electronics Corporation
  */
 
+#include <linux/errno.h>
 #include <linux/kernel.h>
 
 #include "core.h"
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
index 88c577e2f6c0d6bb..fc512e6bf577d9b6 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
@@ -12,6 +12,7 @@
  * Copyright (C) 2015  Renesas Electronics Corporation
  */
 
+#include <linux/errno.h>
 #include <linux/kernel.h>
 
 #include "core.h"
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
index 232e9592122ce33e..d39ddef48d67b0bb 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
@@ -12,6 +12,7 @@
  * Copyright (C) 2015  Renesas Electronics Corporation
  */
 
+#include <linux/errno.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c b/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
index 6e2bcc92096eb1f3..f8846f431947ed28 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
@@ -12,6 +12,7 @@
  * Copyright (C) 2015 Renesas Electronics Corporation
  */
 
+#include <linux/errno.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 0eacde85ade48dae..dad5a71ca2107b7c 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -11,6 +11,7 @@
  * Copyright (C) 2016-2017 Renesas Electronics Corp.
  */
 
+#include <linux/errno.h>
 #include <linux/kernel.h>
 
 #include "core.h"
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
index 71a13c07570d6068..e02e707eaea20072 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
@@ -11,6 +11,7 @@
  * Copyright (C) 2015  Renesas Electronics Corporation
  */
 
+#include <linux/errno.h>
 #include <linux/kernel.h>
 
 #include "core.h"
-- 
2.17.1

