Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:40534 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750705AbdLZKLH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Dec 2017 05:11:07 -0500
Received: by mail-qk0-f193.google.com with SMTP id q14so30269295qke.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Dec 2017 02:11:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171214223101.16450-5-wsa+renesas@sang-engineering.com>
References: <20171214223101.16450-1-wsa+renesas@sang-engineering.com> <20171214223101.16450-5-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Dec 2017 11:11:06 +0100
Message-ID: <CAMuHMdXnY-zAc-=mBrrDy1XAxZcmvmsVA52D-EeZJT1Ff4Pdyw@mail.gmail.com>
Subject: Re: [PATCH 4/9] ARM: dts: koelsch: use demuxer for I2C4
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Thu, Dec 14, 2017 at 11:30 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Make it possible to fallback to GPIO for I2C4 on the EXIO-E connector.
>
> This is based on reference work for the I2C0 core of the lager/r8a7790
> by Wolfram Sang.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> [wsa: rebased, fixed aliases, switched to named GPIOS]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> --- a/arch/arm/boot/dts/r8a7791-koelsch.dts
> +++ b/arch/arm/boot/dts/r8a7791-koelsch.dts

> @@ -480,6 +504,11 @@
>                 function = "i2c2";
>         };
>
> +       i2c4_pins: i2c4 {
> +               groups = "i2c4";
> +               function = "i2c4";
> +       };

This change breaks VIN:

-rcar-vin e6ef0000.video: Device registered as video25
+sh-pfc e6060000.pin-controller: pin GP_4_13 already requested by
e6520000.i2c; cannot claim for e6ef0000.video
+sh-pfc e6060000.pin-controller: pin-141 (e6ef0000.video) status -22
+sh-pfc e6060000.pin-controller: could not request pin 141 (GP_4_13)
from group vin0_data24  on device sh-pfc
+rcar-vin e6ef0000.video: Error applying setting, reverse things back
+rcar-vin: probe of e6ef0000.video failed with error -22

I2C4 on Koelsch uses pins GP7_13/14 (group "i2c4_c"), not GP4_13/14
(group "i2c4").

Fixing it up in today's renesas-drivers release.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
