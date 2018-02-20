Return-Path: <devicetree-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Barry Song <baohua@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
        Jiri Slaby <jslaby@suse.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-serial@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/9] serial: imx: Fix out-of-bounds access through DT alias
Date: Tue, 20 Feb 2018 10:40:18 +0100
Message-Id: <1519119624-1268-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1519119624-1268-1-git-send-email-geert+renesas@glider.be>
References: <1519119624-1268-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The imx_ports[] array is indexed using a value derived from the
"serialN" alias in DT, which may lead to an out-of-bounds access.

Fix this by adding a range check.

Fixes: 9206ab8a0350c3da ("serial: imx: Fix out-of-bounds access through DT alias")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/tty/serial/imx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 1d7ca382bc12b238..e89e90ad87d8245c 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -2041,6 +2041,11 @@ static int serial_imx_probe(struct platform_device *pdev)
 		serial_imx_probe_pdata(sport, pdev);
 	else if (ret < 0)
 		return ret;
+	if (sport->port.line >= UART_NR) {
+		dev_err(&pdev->dev, "serial%d out of range\n",
+			sport->port.line);
+		return -EINVAL;
+	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(&pdev->dev, res);
-- 
2.7.4

