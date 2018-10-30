Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-os2jpn01on0122.outbound.protection.outlook.com ([104.47.92.122]:13185
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726493AbeJ3PIB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Oct 2018 11:08:01 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: gregkh@linuxfoundation.org, jslaby@suse.com,
        linux-serial@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] serial: sh-sci: Fix could not remove dev_attr_rx_fifo_timeout
Date: Tue, 30 Oct 2018 15:13:35 +0900
Message-Id: <1540880015-11877-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch fixes an issue that the sci_remove() could not remove
dev_attr_rx_fifo_timeout because uart_remove_one_port() set
the port->port.type to PORT_UNKNOWN.

Reported-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Fixes: 5d23188a473d ("serial: sh-sci: make RX FIFO parameters tunable via sysfs")
Cc: <stable@vger.kernel.org> # v4.11+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/tty/serial/sh-sci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index ab3f6e91..3649b83 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3102,6 +3102,7 @@ static inline int sci_probe_earlyprintk(struct platform_device *pdev)
 static int sci_remove(struct platform_device *dev)
 {
 	struct sci_port *port = platform_get_drvdata(dev);
+	unsigned int type = port->port.type;	/* uart_remove_... clears it */
 
 	sci_ports_in_use &= ~BIT(port->port.line);
 	uart_remove_one_port(&sci_uart_driver, &port->port);
@@ -3112,8 +3113,7 @@ static int sci_remove(struct platform_device *dev)
 		sysfs_remove_file(&dev->dev.kobj,
 				  &dev_attr_rx_fifo_trigger.attr);
 	}
-	if (port->port.type == PORT_SCIFA || port->port.type == PORT_SCIFB ||
-	    port->port.type == PORT_HSCIF) {
+	if (type == PORT_SCIFA || type == PORT_SCIFB || type == PORT_HSCIF) {
 		sysfs_remove_file(&dev->dev.kobj,
 				  &dev_attr_rx_fifo_timeout.attr);
 	}
-- 
1.9.1
