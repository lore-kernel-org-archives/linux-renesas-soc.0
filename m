Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:28671 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725977AbeKUBtI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Nov 2018 20:49:08 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-gpio@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [RFC v3 2/2] gpio: rcar: Set pin as a GPIO when configuring an interrupt
Date: Tue, 20 Nov 2018 15:19:16 +0000
Message-Id: <1542727156-31432-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1542727156-31432-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1542727156-31432-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

As it turns out, the bootloader or a POR may get in the way
of the current implementation of gpio_rcar_irq_set_type, as
the pinmuxing may not be GPIO.
This patch makes sure the pin is configured as a GPIO when
requesting it an interrupt, as that's necessary for the
interrupt to work properly. Failing to do so may damage
the board as this can cause shorts.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 drivers/gpio/gpio-rcar.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 1322f7e..615404c 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -168,6 +168,9 @@ static int gpio_rcar_irq_set_type(struct irq_data *d, unsigned int type)
 	default:
 		return -EINVAL;
 	}
+
+	pinctrl_mux_gpio_request_enable(gc->base + hwirq);
+
 	return 0;
 }
 
-- 
2.7.4
