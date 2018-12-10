Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:42723 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727580AbeLJOWD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 09:22:03 -0500
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC: <linux-gpio@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH] gpio: rcar: select General Output Register to set output states
Date: Mon, 10 Dec 2018 16:21:35 +0200
Message-ID: <20181210142135.23960-1-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type: text/plain; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

R-Car GPIO controller provides two interfaces to set GPIO line output
signal state, and for a particular GPIO line the selected interface is
determined by OUTDTSEL bit value.

At the moment the driver supports only one of two interfaces, namely
OUTDT General Output Register is used to control the output signal.

While this selection is the default one on reset, it is not explicitly
configured on probe, thus it might be possible that kernel and userspace
consumers of a GPIO won't be able to set the wanted GPIO output signal.

Below is a simple test case to reproduce the described problem and
verify this fix in the kernel on H3 ULCB by setting non-default OUTDTSEL
configuration from a bootloader:

  u-boot    > mw.l 0xe6055440 0x3000 1
  ...
  userspace > echo -n default-on > /sys/devices/platform/leds/leds/led5/trigger
  userspace > echo -n default-on > /sys/devices/platform/leds/leds/led6/trigger

Fixes: 119f5e448d32c ("gpio: Renesas R-Car GPIO driver V3")
Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---

The proposed change could be seen as an invitation for a more interesting
discussion about a necessity to add a pretty trivial support of the second
interface, for instance by selecting between OUTDT and OUTDTH/OUTDTL on
basis of read-only value of OUTDTSEL register, or, simply by switching
the driver to use the second interface only, because it does not require
an additional gpio_rcar_read() call, theoretically it should give noticeably
faster rate of bitbanging.

For reference the problem with the original interface comes from an inability
to set GPIO output signals from an RTOS, which runs in parallel to Linux and
wants to control some GPIOs on its own, usage of OUTDTH/OUTDTL excludes
a race in concurrent read/write register operations.

As a note in my opinion the selection of OUTDT vs. OUTDTH/OUTDTL should
NOT be done in DTS, extension to 3-cell values for GPIO consumers seems
unreasonable.

Below is the list of helpful tips for change reviewers, comments are welcome:
* I didn't manage to find H1 or M1A User's Manuals to confirm that
  OUTDTSEL register and the second OUTDTH/OUTDTL interface is present
  on the GPIO controllers found on R-Car Gen1 SoCs,
* Fixes tag here is pretty weak, nevertheless I suppose it is a fix in fact,
* gpio_rcar_suspend()/gpio_rcar_resume() don't respect OUTDTSEL/OUTDTH/OUTDTL
  values, if there is a reason to dump/restore registers, it might be good
  to include them to the list also,
* alternatively it might be possible to replace the original interface with
  OUTDTH/OUTDTL one, it will be a nice valid fix also.

 drivers/gpio/gpio-rcar.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 8802b59bfec7..d6ada162b167 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -63,6 +63,7 @@ struct gpio_rcar_priv {
 #define POSNEG 0x20	/* Positive/Negative Logic Select Register */
 #define EDGLEVEL 0x24	/* Edge/level Select Register */
 #define FILONOFF 0x28	/* Chattering Prevention On/Off Register */
+#define OUTDTSEL 0x40	/* Output Data Select Register */
 #define BOTHEDGE 0x4c	/* One Edge/Both Edge Select Register */
 
 #define RCAR_MAX_GPIO_PER_BANK		32
@@ -243,6 +244,10 @@ static void gpio_rcar_config_general_input_output_mode(struct gpio_chip *chip,
 	/* Select Input Mode or Output Mode in INOUTSEL */
 	gpio_rcar_modify_bit(p, INOUTSEL, gpio, output);
 
+	/* Select General Output Register to output data in OUTDTSEL */
+	if (output)
+		gpio_rcar_modify_bit(p, OUTDTSEL, gpio, false);
+
 	spin_unlock_irqrestore(&p->lock, flags);
 }
 
-- 
2.19.0
