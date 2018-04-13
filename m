Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:42206 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751160AbeDMRBD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Apr 2018 13:01:03 -0400
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: wsa@the-dreams.de, geert@linux-m68k.org,
        linux-serial@vger.kernel.org, magnus.damm@gmail.com,
        Hien Dang <hien.dang.eb@renesas.com>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 2/2] serial: sh-sci: Use pm_runtime_get_sync()/put() on resume
Date: Fri, 13 Apr 2018 19:00:54 +0200
Message-Id: <1523638854-21804-3-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1523638854-21804-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1523638854-21804-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hien Dang <hien.dang.eb@renesas.com>

Since commit '39dd0f234fc37d ("PM / Domains: Allow runtime PM during system
PM phases")', runtime PM may be in suspended state during the system
suspend phase. It is therefore necessary to call pm_runtime_get_sync()/
pm_runtime_put() when accessing the hardware.

This modification is the counterpart for the resume case. It ensures
stability of the system, should the kernel allow the devices's runtime
suspend state to change during the system resume phase as well.

Signed-off-by: Hien Dang <hien.dang.eb@renesas.com>
Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
[uli: edited description for clarity]
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 drivers/tty/serial/sh-sci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 22d7a78..d5a1acb 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3259,8 +3259,11 @@ static __maybe_unused int sci_resume(struct device *dev)
 {
 	struct sci_port *sport = dev_get_drvdata(dev);
 
-	if (sport)
+	if (sport) {
+		pm_runtime_get_sync(sport->port.dev);
 		uart_resume_port(&sci_uart_driver, &sport->port);
+		pm_runtime_put(sport->port.dev);
+	}
 
 	return 0;
 }
-- 
2.7.4
