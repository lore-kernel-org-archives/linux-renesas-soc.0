Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:46022 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750983AbdLSQCK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Dec 2017 11:02:10 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] pwm: renesas-tpu: Misc Fixes
Date: Tue, 19 Dec 2017 17:02:04 +0100
Message-Id: <1513699327-27357-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi all,

Here are three small fixes related to the Renesas Timer Pulse Unit PWM
driver.

The first patch is meant for Simon's tree.
The other two patches are meant for either the PWM or DT tree.

Thanks!

Geert Uytterhoeven (3):
  ARM: dts: r8a7740: Correct TPU register block size
  dt-bindings: pwm: renesas-tpu: Correct example TPU register block size
  dt-bindings: pwm: renesas-tpu: Correct SoC part numbers and family
    names

 Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt | 6 +++---
 arch/arm/boot/dts/r8a7740.dtsi                            | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
