Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:47804 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752847AbdK3M5a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Nov 2017 07:57:30 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/4] ARM: dts: renesas: Convert to named i2c-gpio bindings
Date: Thu, 30 Nov 2017 13:57:22 +0100
Message-Id: <1512046646-15253-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

Commits 7d29f509d2cfd807 ("dt-bindings: i2c: i2c-gpio: Add support for
named gpios") and 05c74778858d7d99 ("i2c: gpio: Add support for named
gpios in DT") introduced named i2c-gpio DT bindings, and deprecated the
more error-prone unnamed variant.

This patch series switches all Renesas boards to the new bindings, and
adds the missing GPIO_OPEN_DRAIN I/O flags, which were implicitly
assumed before.  The latter gets rid of messages like:

    gpio-208 (?): enforced open drain please flag it properly in DT/ACPI DSDT/board file
    gpio-91 (?): enforced open drain please flag it properly in DT/ACPI DSDT/board file

Patch 1 was extracted from series "[PATCH/RFC 0/3] i2c: gpio: Add
support for named gpios in DT", hence the v2.  All other patches are
new.

Note that after this series is applied, the i2c-gpio buses are no longer
detected when booting new DTBs on old (v4.14 and older) kernels, which
should not be an issue.  Booting old DTBs on new kernels is not
affected.

Thanks for applying!

Geert Uytterhoeven (4):
  ARM: dts: armadillo800eva: Convert to named i2c-gpio bindings
  ARM: dts: lager: Convert to named i2c-gpio bindings
  ARM: dts: koelsch: Convert to named i2c-gpio bindings
  ARM: dts: alt: Convert to named i2c-gpio bindings

 arch/arm/boot/dts/r8a7740-armadillo800eva.dts    | 5 ++---
 arch/arm/boot/dts/r8a7790-lager.dts              | 5 ++---
 arch/arm/boot/dts/r8a7791-koelsch.dts            | 5 ++---
 arch/arm/boot/dts/r8a7794-alt.dts                | 5 ++---
 4 files changed, 8 insertions(+), 12 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
