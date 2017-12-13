Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:41170 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753824AbdLMTFY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 14:05:24 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] spi: sh-msiof: Multi-slave enhancements
Date: Wed, 13 Dec 2017 20:05:09 +0100
Message-Id: <1513191913-10612-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Mark², Rob,

This patch series enhances the Renesas MSIOF SPI controller driver for
multiple SPI slave devices.

The first patch fixes the classical pitfall of writing to configuration
registers from the spi_master.setup() callback, where possible.
The second patch extends support from 1 to 3 native chip selects,
The third patch fixes the use of GPIOs as chip selects on modern
platform using DT instead of board code.
The last patch documents hardware limitations related to chip selects,
to guide board designers and DTS writers.

This has been tested with:
  - Three 25LC040 SPI EEPROMs, using GPIO chip selects due to MSIOF
    hardware limitations (verified with a logic analyzer),
  - Multiple 74HC595 shift registers feeding lots of blinkenlights,
    using only native chipselects, only GPIO chip selects, and a healthy
    mix of both.

Thanks for your comments!

Geert Uytterhoeven (4):
  spi: sh-msiof: Avoid writing to registers from spi_master.setup()
  spi: sh-msiof: Extend support to 3 native chip selects
  spi: sh-msiof: Implement cs-gpios configuration
  spi: sh-msiof: Document hardware limitations related to chip selects

 Documentation/devicetree/bindings/spi/sh-msiof.txt |  16 ++-
 drivers/spi/spi-sh-msiof.c                         | 111 +++++++++++++++++----
 2 files changed, 107 insertions(+), 20 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
