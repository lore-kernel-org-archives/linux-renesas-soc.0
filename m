Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:38544 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751464AbdHHK3a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Aug 2017 06:29:30 -0400
Received: by mail-wm0-f65.google.com with SMTP id y206so3430018wmd.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Aug 2017 03:29:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1502181568-12299-1-git-send-email-horms+renesas@verge.net.au>
References: <1502181568-12299-1-git-send-email-horms+renesas@verge.net.au>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Tue, 8 Aug 2017 19:29:28 +0900
Message-ID: <CANqRtoRcsAhvFB=DNoJHzJt4dejKX+Z8ar04D8O1cFq1XkxWkw@mail.gmail.com>
Subject: Re: [PATCH 00/10] ARM, arm64: dts: renesas: Use R-Car GPIO Gen[123]
 fallback compat strings
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Tue, Aug 8, 2017 at 5:39 PM, Simon Horman <horms+renesas@verge.net.au> wrote:
> Use newly added R-Car GPIO Gen 1, 2 and 3 fallback compat strings in place
> of now deprecated non-generation specific R-Car GPIO fallback compat string
> in the DT of Renesas ARM and arm64 based SoCs.
>
> This should have no run-time effect as the driver matches against the
> per-SoC compat string before considering the fallback compat string.

Thanks for your efforts.I have no issue with your series (apart from
the GPIO and SATA mistake), but at the same time I believe the GPIO
hardware itself is backwards compatible between various generations.

In the nitpick department I would like to point out that the level of
hardware difference between say R-Car Gen1 GPIO and R-Car Gen2 GPIO is
similar to say good old uarts like 8250 and 16450 hardware. Basically
a couple of registers were added to the hardware in a
backwards-compatible way if I recall correctly.

So if we are going to use "compatible" to point out if hardware is
compatible or not then I would do this instead:

--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -214,7 +214,7 @@

                gpio0: gpio@e6050000 {
                        compatible = "renesas,gpio-r8a7796",
+                                    "renesas,rcar-gen3-gpio";
                                     "renesas,gpio-rcar";
                        reg = <0 0xe6050000 0 0x50>;
                        interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
                        #gpio-cells = <2>;

At the same time I'm not sure if I care _that_ much. =)

Thanks,

/ magnus
