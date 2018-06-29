Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:55400 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755371AbeF2OZW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Jun 2018 10:25:22 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/4] serial: sh-sci: Stop RX FIFO timer during port shutdown
Date: Fri, 29 Jun 2018 16:25:13 +0200
Message-Id: <20180629142513.20743-8-geert+renesas@glider.be>
In-Reply-To: <20180629142513.20743-1-geert+renesas@glider.be>
References: <20180629142513.20743-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The RX FIFO timer may be armed when the port is shut down, hence the
timer function may still be called afterwards.

Fix this race condition by deleting the timer during port shutdown.

Fixes: 039403765e5da3c6 ("serial: sh-sci: SCIFA/B RX FIFO software timeout")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested with scifa0 on r8a7740/armadillo, after

    echo 2000 > /sys/devices/platform/e6c40000.serial/rx_fifo_timeout
---
 drivers/tty/serial/sh-sci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 58016386558c6789..cca3bbc62a6b1110 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2571,6 +2571,8 @@ static void sci_shutdown(struct uart_port *port)
 	}
 #endif
 
+	if (s->rx_trigger > 1 && s->rx_fifo_timeout > 0)
+		del_timer_sync(&s->rx_fifo_timer);
 	sci_free_irq(s);
 	sci_free_dma(port);
 }
-- 
2.17.1
