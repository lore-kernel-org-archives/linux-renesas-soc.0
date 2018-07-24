Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:46139 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388271AbeGXMi1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 08:38:27 -0400
MIME-Version: 1.0
References: <20180724111413.4056-1-horms+renesas@verge.net.au>
In-Reply-To: <20180724111413.4056-1-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Jul 2018 13:32:13 +0200
Message-ID: <CAMuHMdVVGRPTGAR_YLvgKM6B8Z-in9u9=66TVN-MjJ8SiSiwjQ@mail.gmail.com>
Subject: Re: [PATCH] thermal: rcar_thermal: avoid NULL dereference in absense
 of IRQ resources
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 24, 2018 at 1:15 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> Ensure that the base address used by a call to rcar_thermal_common_write()
> may be NULL if the SOC supports interrupts for use with the thermal device
> but none are defined in DT as is the case for R-Car H1 (r8a7779). Guard
> against this condition to prevent a NULL dereference when the device is
> probed.
>
> Tested on:
> * R-Mobile APE6 (r8a73a4) / APE6EVM
> * R-Car H1 (r8a7779) / Marzen
> * R-Car H2 (r8a7790) / Lager
> * R-Car M2-W (r8a7791) / Koelsch
> * R-Car M2-N (r8a7793) / Gose
> * R-Car D3 ES1.0 (r8a77995) / Draak
>
> Fixes: 1969d9dc2079 ("thermal: rcar_thermal: add r8a77995 support")
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
