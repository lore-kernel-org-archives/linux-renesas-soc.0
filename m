Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:35512 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752403AbdF2Ll6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Jun 2017 07:41:58 -0400
MIME-Version: 1.0
In-Reply-To: <20170629101851.23972-8-marek.vasut@gmail.com>
References: <20170629101851.23972-1-marek.vasut@gmail.com> <20170629101851.23972-8-marek.vasut@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Jun 2017 13:41:57 +0200
Message-ID: <CAMuHMdVRVURPWXb=pXDsxMgmiB6QvMsXHWTYM6UMW7sufUzf3w@mail.gmail.com>
Subject: Re: [PATCH 8/8] clk: vc5: Add support for IDT VersaClock 5P49V6901
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-clk <linux-clk@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Marek,

On Thu, Jun 29, 2017 at 12:18 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>
> Update IDT VersaClock 6 driver to support 5P49V6901. This chip has

Update the IDT VersaClock5 driver to support the VersaClock6 5P49V6901?

> two clock inputs (external XTAL or external CLKIN), four fractional
> dividers (FODs) and five clock outputs (four universal clock outputs
> and one reference clock output at OUT0_SELB_I2C).
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Alexey Firago <alexey_firago@mentor.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/clk/clk-versaclock5.c | 11 +++++++++++

and

--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -210,14 +210,14 @@ config COMMON_CLK_OXNAS
          Support for the OXNAS SoC Family clocks.

 config COMMON_CLK_VC5
-       tristate "Clock driver for IDT VersaClock5 devices"
+       tristate "Clock driver for IDT VersaClock5/6 devices"
        depends on I2C
        depends on OF
        select REGMAP_I2C
        help
        ---help---
-         This driver supports the IDT VersaClock5 programmable clock
-         generator.
+         This driver supports the IDT VersaClock5 and VersaClock6
+         programmable clock generator.

 source "drivers/clk/bcm/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
