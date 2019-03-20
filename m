Return-Path: <SRS0=0aVP=RX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11782C10F05
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 10:21:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E360121850
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 10:21:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfCTKV5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Mar 2019 06:21:57 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:55402 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbfCTKVr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Mar 2019 06:21:47 -0400
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id qAMj1z00e3XaVaC01AMj79; Wed, 20 Mar 2019 11:21:44 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h6YLv-0005FW-Nz; Wed, 20 Mar 2019 11:21:43 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h6YLv-00052e-MR; Wed, 20 Mar 2019 11:21:43 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 03/10] pinctrl: sh-pfc: Add missing #include <linux/errno.h>
Date:   Wed, 20 Mar 2019 11:21:34 +0100
Message-Id: <20190320102141.19316-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190320102141.19316-1-geert+renesas@glider.be>
References: <20190320102141.19316-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Source files using -Exxx error codes should include <linux/errno.h>.
On ARM, this header file is included indirectly; on SuperH, it is not,
leading to "error: ‘EINVAL’ undeclared" failures when enabling
compile-testing later.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - No changes,

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
index 4359aeb35dbdf8f3..83772abffaf81b66 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2018 Renesas Electronics Corp.
  */
 
+#include <linux/errno.h>
 #include <linux/kernel.h>
 
 #include "sh_pfc.h"
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
index a84229cb8cd4c8a7..202638b9cb54ce5a 100644
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
index d8b13d4e9bbff7cb..d21a520695db1ae4 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2014-2017 Cogent Embedded, Inc.
  */
 
+#include <linux/errno.h>
 #include <linux/kernel.h>
 
 #include "sh_pfc.h"
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
index 958a5f714c93d967..d24ba71649a10888 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2015-2017 Cogent Embedded, Inc. <source@cogentembedded.com>
  */
 
+#include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/sys_soc.h>
 
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
index 0ef7ada08316fa34..52a0fa8abfcca2bd 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2015-2017  Renesas Electronics Corporation
  */
 
+#include <linux/errno.h>
 #include <linux/kernel.h>
 
 #include "core.h"
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 1a987dfea46f897a..6400e6304daf25e9 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2015-2017 Renesas Electronics Corporation
  */
 
+#include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/sys_soc.h>
 
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index a99c519e05a01f23..bb1255b9bc24241e 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -11,6 +11,7 @@
  * Copyright (C) 2015  Renesas Electronics Corporation
  */
 
+#include <linux/errno.h>
 #include <linux/kernel.h>
 
 #include "core.h"
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
index 820b74ca9d10236b..c656d26e51503fe5 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
@@ -12,6 +12,7 @@
  * Copyright (C) 2015  Renesas Electronics Corporation
  */
 
+#include <linux/errno.h>
 #include <linux/kernel.h>
 
 #include "core.h"
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
index f5868f5e40189441..37d0c1f10901704e 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
@@ -12,6 +12,7 @@
  * Copyright (C) 2015  Renesas Electronics Corporation
  */
 
+#include <linux/errno.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c b/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
index 376e689c737821b5..42c73913b5c7088c 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
@@ -12,6 +12,7 @@
  * Copyright (C) 2015 Renesas Electronics Corporation
  */
 
+#include <linux/errno.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 1a8d1ae896c0b0f5..10aa52eb4e32e467 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -11,6 +11,7 @@
  * Copyright (C) 2016-2017 Renesas Electronics Corp.
  */
 
+#include <linux/errno.h>
 #include <linux/kernel.h>
 
 #include "core.h"
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
index 0acdfb8bf0777b50..110671d4626c541c 100644
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

