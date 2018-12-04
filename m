Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f66.google.com ([209.85.222.66]:41321 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbeLDOI3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Dec 2018 09:08:29 -0500
Received: by mail-ua1-f66.google.com with SMTP id z24so5801520ual.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Dec 2018 06:08:29 -0800 (PST)
MIME-Version: 1.0
References: <20181129003949.19984-1-niklas.soderlund+renesas@ragnatech.se> <20181129003949.19984-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20181129003949.19984-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Dec 2018 15:08:16 +0100
Message-ID: <CAMuHMdVBmTuAGR1TKK_smoCkp_j8CBGC=bdtH5D9HY3rOBTC2w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: renesas: rcar-gen3: add HS400 quirk for SD clock
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 29, 2018 at 1:41 AM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On H3 (ES1.x, ES2.0) and M3-W (ES1.0, ES1.1) the clock setting for HS400
> needs a quirk to function properly. The reason for the quirk is that
> there are two settings which produces same divider value for the SDn
> clock. On the effected boards the one currently selected results in
> HS400 not working.
>
> This change uses the same method as the Gen2 CPG driver and simply
> ignores the first clock setting as this is the offending one when
> selecting the settings. Which of the two possible settings is used have
> no effect for SDR104.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>
> ---
> * Changes since v1
> - Fixed spelling in commit message, thanks Sergei and Geert!
> - Reworked the whole patch per Geerts suggestion. Instead of only
>   skipping the first row on the effected boards when setting the clock
>   rete totally ignore it. This is made possible by another change to the
>   clock driver posted separately from this series and which this patch
>   now depends on [1].
>
>   1. [PATCH] clk: renesas: rcar-gen3: set state when registering SD clocks

Thanks for the update!

With s/rete/rate/:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
