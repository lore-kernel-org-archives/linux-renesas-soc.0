Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:33751 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754742AbdAKJSB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jan 2017 04:18:01 -0500
Received: by mail-lf0-f52.google.com with SMTP id k86so132765317lfi.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jan 2017 01:18:01 -0800 (PST)
Date: Wed, 11 Jan 2017 10:17:58 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ai Kyuse <ai.kyuse.uw@renesas.com>
Subject: Re: [PATCH v8 6/6] mmc: sh_mobile_sdhi: Add tuning support
Message-ID: <20170111091758.GC25542@bigcity.dyn.berto.se>
References: <1478182564-18762-1-git-send-email-horms+renesas@verge.net.au>
 <1478182564-18762-7-git-send-email-horms+renesas@verge.net.au>
 <20170110210848.GA25542@bigcity.dyn.berto.se>
 <20170110223043.GA2710@katana>
 <20170111083541.GB25542@bigcity.dyn.berto.se>
 <CAMuHMdWM=_jhVzJD5GBojGROKyqSPO_-X5EDHetTXSCJLjX9pg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWM=_jhVzJD5GBojGROKyqSPO_-X5EDHetTXSCJLjX9pg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thanks for your feedback.

On 2017-01-11 09:42:09 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Wed, Jan 11, 2017 at 9:35 AM, Niklas S�derlund
> <niklas.soderlund@ragnatech.se> wrote:
> > On 2017-01-10 23:30:43 +0100, Wolfram Sang wrote:
> >> > Oddly enough the error are only printed when I insert the SD card in the
> >> > mmc0 slot. I can insert/eject the card multiple times in mmc1 and no
> >> > error but the first insertion in mmc0 and boom. Only difference I can
> >> > see are the clock speed between mmc0 and mmc1.
> >>
> >> Can you try this patch?
> >>
> >> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >> Date: Sun, 13 Nov 2016 11:10:09 +0100
> >> Subject: [PATCH] pinctrl: pfc: r8a7795: WIP: hardcode TDSEL value
> >>
> >> Otherwise, AC-180M won't get probed with SDR50 and EMMY-W1 has more
> >> tuning errors with SDR104.
> >>
> >> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >> ---
> >>  drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> >
> > I'm doing my tests on Koelsch so I'm afraid setting the TDSEL in
> > pfc-r8a7795.c won't do much ;-) Nevertheless I tried to mimic the patch
> > for Koelsch but found the documentation lacking and where unable to do
> > so. That is I found a TDSEL register but no documentation of its
> > content.
> 
> The datasheet does mention which bits are for SD[023]_CLK.
> Actual bit patterns should be the same as on r8a7795.

Thanks for the information about the bit patterns. I tried using the 
same bit pattern on SD[023]_CLK but the error persisted :-( 

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Regards,
Niklas S�derlund
