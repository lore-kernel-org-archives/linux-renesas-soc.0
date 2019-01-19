Return-Path: <SRS0=PMmv=P3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E11FC6369F
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 19 Jan 2019 12:17:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 79F6320821
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 19 Jan 2019 12:17:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727965AbfASMRE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 19 Jan 2019 07:17:04 -0500
Received: from sauhun.de ([88.99.104.3]:56422 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727970AbfASMRE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 Jan 2019 07:17:04 -0500
Received: from localhost (p54B33180.dip0.t-ipconnect.de [84.179.49.128])
        by pokefinder.org (Postfix) with ESMTPSA id CCA9F2DDAB5;
        Sat, 19 Jan 2019 13:17:02 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/3] i2c: algo-bit: convert to SPDX header
Date:   Sat, 19 Jan 2019 13:16:54 +0100
Message-Id: <20190119121655.5576-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190119121655.5576-1-wsa+renesas@sang-engineering.com>
References: <20190119121655.5576-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

And use kernel style for the remaining comments in the header.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/algos/i2c-algo-bit.c | 25 ++++++++-----------------
 include/linux/i2c-algo-bit.h     | 31 ++++++++-----------------------
 2 files changed, 16 insertions(+), 40 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-bit.c b/drivers/i2c/algos/i2c-algo-bit.c
index c33dcfb87993..5e5990a83da5 100644
--- a/drivers/i2c/algos/i2c-algo-bit.c
+++ b/drivers/i2c/algos/i2c-algo-bit.c
@@ -1,21 +1,12 @@
-/* -------------------------------------------------------------------------
- * i2c-algo-bit.c i2c driver algorithms for bit-shift adapters
- * -------------------------------------------------------------------------
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * i2c-algo-bit.c: i2c driver algorithms for bit-shift adapters
+ *
  *   Copyright (C) 1995-2000 Simon G. Vogl
-
-    This program is free software; you can redistribute it and/or modify
-    it under the terms of the GNU General Public License as published by
-    the Free Software Foundation; either version 2 of the License, or
-    (at your option) any later version.
-
-    This program is distributed in the hope that it will be useful,
-    but WITHOUT ANY WARRANTY; without even the implied warranty of
-    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-    GNU General Public License for more details.
- * ------------------------------------------------------------------------- */
-
-/* With some changes from Frodo Looijaard <frodol@dds.nl>, Kyösti Mälkki
-   <kmalkki@cc.hut.fi> and Jean Delvare <jdelvare@suse.de> */
+ *
+ * With some changes from Frodo Looijaard <frodol@dds.nl>, Kyösti Mälkki
+ * <kmalkki@cc.hut.fi> and Jean Delvare <jdelvare@suse.de>
+ */
 
 #include <linux/kernel.h>
 #include <linux/module.h>
diff --git a/include/linux/i2c-algo-bit.h b/include/linux/i2c-algo-bit.h
index d64cebc6e65a..69045df78e2d 100644
--- a/include/linux/i2c-algo-bit.h
+++ b/include/linux/i2c-algo-bit.h
@@ -1,26 +1,11 @@
-/* ------------------------------------------------------------------------- */
-/* i2c-algo-bit.h i2c driver algorithms for bit-shift adapters               */
-/* ------------------------------------------------------------------------- */
-/*   Copyright (C) 1995-99 Simon G. Vogl
-
-    This program is free software; you can redistribute it and/or modify
-    it under the terms of the GNU General Public License as published by
-    the Free Software Foundation; either version 2 of the License, or
-    (at your option) any later version.
-
-    This program is distributed in the hope that it will be useful,
-    but WITHOUT ANY WARRANTY; without even the implied warranty of
-    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-    GNU General Public License for more details.
-
-    You should have received a copy of the GNU General Public License
-    along with this program; if not, write to the Free Software
-    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
-    MA 02110-1301 USA.							     */
-/* ------------------------------------------------------------------------- */
-
-/* With some changes from Kyösti Mälkki <kmalkki@cc.hut.fi> and even
-   Frodo Looijaard <frodol@dds.nl> */
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * i2c-algo-bit.h: i2c driver algorithms for bit-shift adapters
+ *
+ *   Copyright (C) 1995-99 Simon G. Vogl
+ * With some changes from Kyösti Mälkki <kmalkki@cc.hut.fi> and even
+ * Frodo Looijaard <frodol@dds.nl>
+ */
 
 #ifndef _LINUX_I2C_ALGO_BIT_H
 #define _LINUX_I2C_ALGO_BIT_H
-- 
2.11.0

