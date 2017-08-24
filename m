Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:60714 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751979AbdHXJVS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2017 05:21:18 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Haavard Skinnemoen <hskinnemoen@gmail.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/3] i2c: gpio: Add support for named gpios in DT
Date: Thu, 24 Aug 2017 11:21:11 +0200
Message-Id: <1503566474-5335-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi all,

The current i2c-gpio DT bindings use a single unnamed "gpios" property
to refer to the SDA and SCL signal lines by index.  This is error-prone
for the casual DT writer and reviewer, as one has to look up the order
in the DT bindings, and leads to the addition of comments in DTS files,
like

	gpios = <&pfc 208 GPIO_ACTIVE_HIGH /* sda */
		 &pfc 91 GPIO_ACTIVE_HIGH /* scl */
		>;

This patch series:
  - Amends the DT bindings to use named gpios,
  - Adds support for the new bindings to the driver,
  - Converts the armadillo800eva to use the new bindings, as an example.

Thanks for your comments!

Geert Uytterhoeven (3):
  dt-bindings: i2c: i2c-gpio: Add support for named gpios
  i2c: gpio: Add support for named gpios in DT
  ARM: dts: armadillo800eva: Convert to named i2c-gpio bindings

 Documentation/devicetree/bindings/i2c/i2c-gpio.txt | 5 +++--
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts      | 5 ++---
 drivers/i2c/busses/i2c-gpio.c                      | 9 +++++++++
 3 files changed, 14 insertions(+), 5 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
