Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:48424 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751759AbdAYOzr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 09:55:47 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc: linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] serial: sh-sci: Reformat sci_parse_dt() for git diff
Date: Wed, 25 Jan 2017 15:55:49 +0100
Message-Id: <1485356149-2731-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

As the function header of sci_parse_dt() is split in an unusual way,
"git diff" gets confused when changes to the body of the function are
made, and attributes them to the wrong function.

Reformat the function header to fix this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/tty/serial/sh-sci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 9bc9756a2d15d574..a589544f320661f5 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2816,8 +2816,8 @@ static int sci_remove(struct platform_device *dev)
 };
 MODULE_DEVICE_TABLE(of, of_sci_match);
 
-static struct plat_sci_port *
-sci_parse_dt(struct platform_device *pdev, unsigned int *dev_id)
+static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
+					  unsigned int *dev_id)
 {
 	struct device_node *np = pdev->dev.of_node;
 	const struct of_device_id *match;
-- 
1.9.1
