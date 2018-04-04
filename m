Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33661 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752013AbeDDPs4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Apr 2018 11:48:56 -0400
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, wsa@the-dreams.de,
        geert@linux-m68k.org
Cc: linux-serial@vger.kernel.org, magnus.damm@gmail.com,
        greg@kroah.com, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v2] serial: sh-sci: Support for HSCIF RX sampling point adjustment
Date: Wed,  4 Apr 2018 17:48:51 +0200
Message-Id: <1522856931-6225-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

HSCIF has facilities that allow moving the RX sampling point by between
-8 and 7 sampling cycles (one sampling cycles equals 1/15 of a bit
by default) to improve the error margin in case of slightly mismatched
bit rates between sender and receiver.

This patch tries to determine if shifting the sampling point can improve
the error margin and will enable it if so.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
This revision dumps the sysfs interface and works out the optimal shift
on its own. It also moves setting of the HSSRR register back to its
original location.

CU
Uli


 drivers/tty/serial/sh-sci.c | 65 +++++++++++++++++++++++++++++----------------
 drivers/tty/serial/sh-sci.h |  4 +++
 2 files changed, 46 insertions(+), 23 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index fdbbff5..5d61654 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2390,6 +2390,27 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 
 	uart_update_timeout(port, termios->c_cflag, baud);
 
+	/* byte size and parity */
+	switch (termios->c_cflag & CSIZE) {
+	case CS5:
+		bits = 7;
+		break;
+	case CS6:
+		bits = 8;
+		break;
+	case CS7:
+		bits = 9;
+		break;
+	default:
+		bits = 10;
+		break;
+	}
+
+	if (termios->c_cflag & CSTOPB)
+		bits++;
+	if (termios->c_cflag & PARENB)
+		bits++;
+
 	if (best_clk >= 0) {
 		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
 			switch (srr + 1) {
@@ -2406,8 +2427,27 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 		serial_port_out(port, SCSCR, scr_val | s->hscif_tot);
 		serial_port_out(port, SCSMR, smr_val);
 		serial_port_out(port, SCBRR, brr);
-		if (sci_getreg(port, HSSRR)->size)
-			serial_port_out(port, HSSRR, srr | HSCIF_SRE);
+		if (sci_getreg(port, HSSRR)->size) {
+			unsigned int hssrr = srr | HSCIF_SRE;
+			/* Calculate deviation from intended rate at the
+			 * center of the last stop bit in sampling clocks.
+			 */
+			int last_stop = bits * 2 - 1;
+			int deviation = min_err * srr * last_stop / 2 / baud;
+
+			if (abs(deviation) >= 2) {
+				/* At least two sampling clocks off at the
+				 * last stop bit; we can increase the error
+				 * margin by shifting the sampling point.
+				 */
+				int shift = min(-8, max(7, deviation / 2));
+
+				hssrr |= (shift << HSCIF_SRHP_SHIFT) &
+					 HSCIF_SRHP_MASK;
+				hssrr |= HSCIF_SRDE;
+			}
+			serial_port_out(port, HSSRR, hssrr);
+		}
 
 		/* Wait one bit interval */
 		udelay((1000000 + (baud - 1)) / baud);
@@ -2474,27 +2514,6 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 	 * value obtained by this formula is too small. Therefore, if the value
 	 * is smaller than 20ms, use 20ms as the timeout value for DMA.
 	 */
-	/* byte size and parity */
-	switch (termios->c_cflag & CSIZE) {
-	case CS5:
-		bits = 7;
-		break;
-	case CS6:
-		bits = 8;
-		break;
-	case CS7:
-		bits = 9;
-		break;
-	default:
-		bits = 10;
-		break;
-	}
-
-	if (termios->c_cflag & CSTOPB)
-		bits++;
-	if (termios->c_cflag & PARENB)
-		bits++;
-
 	s->rx_frame = (10000 * bits) / (baud / 100);
 #ifdef CONFIG_SERIAL_SH_SCI_DMA
 	s->rx_timeout = s->buf_len_rx * 2 * s->rx_frame;
diff --git a/drivers/tty/serial/sh-sci.h b/drivers/tty/serial/sh-sci.h
index a5f792f..0b9e804 100644
--- a/drivers/tty/serial/sh-sci.h
+++ b/drivers/tty/serial/sh-sci.h
@@ -130,6 +130,10 @@ enum {
 
 /* HSSRR HSCIF */
 #define HSCIF_SRE	BIT(15)	/* Sampling Rate Register Enable */
+#define HSCIF_SRDE	BIT(14) /* Sampling Point Register Enable */
+
+#define HSCIF_SRHP_SHIFT	8
+#define HSCIF_SRHP_MASK		0x0f00
 
 /* SCPCR (Serial Port Control Register), SCIFA/SCIFB only */
 #define SCPCR_RTSC	BIT(4)	/* Serial Port RTS# Pin / Output Pin */
-- 
2.7.4
