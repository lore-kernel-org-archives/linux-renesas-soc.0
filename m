Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:18529 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726824AbeGMJsI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jul 2018 05:48:08 -0400
From: Phil Edworthy <phil.edworthy@renesas.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Jiri Slaby <jslaby@suse.com>,
        Joshua Scott <joshua.scott@alliedtelesis.co.nz>,
        Ed Blake <ed.blake@sondrel.com>,
        Stefan Potyra <Stefan.Potyra@elektrobit.com>
Subject: [PATCH v2 2/2] serial: 8250_dw: Add compatible string for Renesas RZ/N1 UART
Date: Fri, 13 Jul 2018 10:33:49 +0100
Message-Id: <1531474429-17146-3-git-send-email-phil.edworthy@renesas.com>
In-Reply-To: <1531474429-17146-1-git-send-email-phil.edworthy@renesas.com>
References: <1531474429-17146-1-git-send-email-phil.edworthy@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The Renesas RZ/N1 UART is based on the Synopsys DW UART, but has additional
registers for DMA. This patch does not address the changes required for DMA
support, it simply adds the compatible string.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
v2:
 - Change "renesas,<peripheral>-<family-or-device>" to
   "renesas,<family-or-device>-<peripheral>"
---
 drivers/tty/serial/8250/8250_dw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index aff04f1..7a7c742 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -693,6 +693,7 @@ static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart" },
 	{ .compatible = "cavium,octeon-3860-uart" },
 	{ .compatible = "marvell,armada-38x-uart" },
+	{ .compatible = "renesas,rzn1-uart" },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dw8250_of_match);
-- 
2.7.4
