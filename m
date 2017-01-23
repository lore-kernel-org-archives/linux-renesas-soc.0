Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33061 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750951AbdAWQEh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2017 11:04:37 -0500
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, wsa@the-dreams.de,
        geert@linux-m68k.org
Cc: linux-serial@vger.kernel.org, magnus.damm@gmail.com,
        sergei.shtylyov@cogentembedded.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v2 3/7] serial: sh-sci: implement FIFO threshold register setting
Date: Mon, 23 Jan 2017 17:04:14 +0100
Message-Id: <1485187458-8195-4-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1485187458-8195-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1485187458-8195-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Sets the closest match for a desired RX trigger level.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/tty/serial/sh-sci.c | 59 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 3a9c001..39734cc 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1102,6 +1102,65 @@ static int sci_handle_breaks(struct uart_port *port)
 	return copied;
 }
 
+static int scif_set_rtrg(struct uart_port *port, int rx_trig)
+{
+	unsigned int bits;
+
+	if (rx_trig < 1)
+		rx_trig = 1;
+	if (rx_trig >= port->fifosize)
+		rx_trig = port->fifosize;
+
+	/* HSCIF can be set to an arbitrary level. */
+	if (sci_getreg(port, HSRTRGR)->size) {
+		serial_port_out(port, HSRTRGR, rx_trig);
+		return rx_trig;
+	}
+
+	switch (port->type) {
+	case PORT_SCIF:
+		if (rx_trig < 4) {
+			bits = 0;
+			rx_trig = 1;
+		} else if (rx_trig < 8) {
+			bits = SCFCR_RTRG0;
+			rx_trig = 4;
+		} else if (rx_trig < 14) {
+			bits = SCFCR_RTRG1;
+			rx_trig = 8;
+		} else {
+			bits = SCFCR_RTRG0 | SCFCR_RTRG1;
+			rx_trig = 14;
+		}
+		break;
+	case PORT_SCIFA:
+	case PORT_SCIFB:
+		if (rx_trig < 16) {
+			bits = 0;
+			rx_trig = 1;
+		} else if (rx_trig < 32) {
+			bits = SCFCR_RTRG0;
+			rx_trig = 16;
+		} else if (rx_trig < 48) {
+			bits = SCFCR_RTRG1;
+			rx_trig = 32;
+		} else {
+			bits = SCFCR_RTRG0 | SCFCR_RTRG1;
+			rx_trig = 48;
+		}
+		break;
+	default:
+		WARN(1, "unknown FIFO configuration");
+		return 1;
+	}
+
+	serial_port_out(port, SCFCR,
+		(serial_port_in(port, SCFCR) &
+		~(SCFCR_RTRG1 | SCFCR_RTRG0)) | bits);
+
+	return rx_trig;
+}
+
 #ifdef CONFIG_SERIAL_SH_SCI_DMA
 static void sci_dma_tx_complete(void *arg)
 {
-- 
2.7.4
