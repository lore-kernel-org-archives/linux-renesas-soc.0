Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:58088 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbeLCT4z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Dec 2018 14:56:55 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Avri Altman <Avri.Altman@wdc.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] mmc: document 'Reliable Write' bit in uapi header
Date: Mon,  3 Dec 2018 20:56:47 +0100
Message-Id: <20181203195647.6261-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

If we use it this way, people should know about it. Also, replace
true/false with nonzero/zero because the flag is not strictly a bool
anymore.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Change since V1:
* reworded first line of comment as well. Thanks, Geert!

Still not super happy about shifting into the sign bit, but yeah...
don't break userspace, I guess.

 include/uapi/linux/mmc/ioctl.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/mmc/ioctl.h b/include/uapi/linux/mmc/ioctl.h
index 45f369dc0a42..00c08120f3ba 100644
--- a/include/uapi/linux/mmc/ioctl.h
+++ b/include/uapi/linux/mmc/ioctl.h
@@ -5,7 +5,10 @@
 #include <linux/types.h>
 
 struct mmc_ioc_cmd {
-	/* Implies direction of data.  true = write, false = read */
+	/*
+	 * Direction of data: nonzero = write, zero = read.
+	 * Bit 31 selects 'Reliable Write' for RPMB.
+	 */
 	int write_flag;
 
 	/* Application-specific command.  true = precede with CMD55 */
-- 
2.11.0
