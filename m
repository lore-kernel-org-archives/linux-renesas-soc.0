Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:56254 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726462AbeLCO2B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Dec 2018 09:28:01 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Avri Altman <Avri.Altman@wdc.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc: document 'Reliable Write' bit in uapi header
Date: Mon,  3 Dec 2018 15:26:44 +0100
Message-Id: <20181203142644.3038-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

If we use it this way, people should know about it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Still not super happy about shifting into the sign bit, but yeah...
don't break userspace, I guess.

 include/uapi/linux/mmc/ioctl.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/mmc/ioctl.h b/include/uapi/linux/mmc/ioctl.h
index 45f369dc0a42..ae659333e73f 100644
--- a/include/uapi/linux/mmc/ioctl.h
+++ b/include/uapi/linux/mmc/ioctl.h
@@ -5,7 +5,10 @@
 #include <linux/types.h>
 
 struct mmc_ioc_cmd {
-	/* Implies direction of data.  true = write, false = read */
+	/*
+	 * Implies direction of data.  true = write, false = read.
+	 * Bit 31 selects 'Reliable Write' for RPMB.
+	 */
 	int write_flag;
 
 	/* Application-specific command.  true = precede with CMD55 */
-- 
2.11.0
