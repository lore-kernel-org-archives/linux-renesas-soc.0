Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail2.asahi-net.or.jp ([202.224.39.198]:42281 "EHLO
	mail2.asahi-net.or.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752646AbcD0Pt3 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 27 Apr 2016 11:49:29 -0400
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH] sh-sci: SysRq support on EARLYCON
Date: Thu, 28 Apr 2016 00:49:13 +0900
Message-Id: <1461772153-6785-1-git-send-email-ysato@users.sourceforge.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add missing flag condition.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 drivers/tty/serial/sh-sci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 0130feb..5a73620 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -18,7 +18,9 @@
  * License.  See the file "COPYING" in the main directory of this archive
  * for more details.
  */
-#if defined(CONFIG_SERIAL_SH_SCI_CONSOLE) && defined(CONFIG_MAGIC_SYSRQ)
+#if (defined(CONFIG_SERIAL_SH_SCI_CONSOLE) || \
+     defined(CONFIG_SERIAL_SH_SCI_EARLYCON)) && \
+	defined(CONFIG_MAGIC_SYSRQ)
 #define SUPPORT_SYSRQ
 #endif
 
-- 
2.7.0
