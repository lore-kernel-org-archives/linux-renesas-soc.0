Return-Path: <devicetree-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jslaby@suse.com>,
	Peter Hurley <peter@hurleysoftware.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org
Subject: [PATCH/RFC 1/5] serial: sh-sci: Update DT binding documentation for GPIO modem lines
Date: Thu, 17 Mar 2016 14:47:25 +0100
Message-Id: <1458222449-12324-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1458222449-12324-1-git-send-email-geert+renesas@glider.be>
References: <1458222449-12324-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Amend the DT bindings for the Renesas SCI driver to allow describing
optional GPIO-controlled modem lines, which can be used where dedicated
modem lines are not available.

The property naming is dictated by the SERIAL_MCTRL_GPIO helpers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/serial/renesas,sci-serial.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
index 528c3b90f23cb04b..f8d7b36742967163 100644
--- a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
+++ b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
@@ -76,6 +76,9 @@ Optional properties:
   - dmas: Must contain a list of two references to DMA specifiers, one for
 	  transmission, and one for reception.
   - dma-names: Must contain a list of two DMA names, "tx" and "rx".
+  - {cts,dsr,dcd,rng,rts,dtr,out1,out2}-gpios: Must contain a GPIO specifier,
+    referring to the GPIO pin to be used as the UART's CTS, DSR, DCD, RNG, RTS,
+    DTR, OUT1, or OUT2 line.
 
 Example:
 	aliases {
-- 
1.9.1

