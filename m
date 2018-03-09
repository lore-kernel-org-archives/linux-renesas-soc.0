Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:34120 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932108AbeCIV6q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Mar 2018 16:58:46 -0500
Received: by mail-lf0-f53.google.com with SMTP id l191-v6so15200288lfe.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Mar 2018 13:58:45 -0800 (PST)
Date: Fri, 9 Mar 2018 22:58:43 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/4] pinctrl: sh-pfc: r8a7796: Add VIN4, VIN5 pins,
 groups and functions
Message-ID: <20180309215843.GL2205@bigcity.dyn.berto.se>
References: <1518696091-23561-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1518696091-23561-2-git-send-email-ulrich.hecht+renesas@gmail.com>
 <CAMuHMdXeLXTnUDwxjkGsaeiHvdTZdc-XzE2+2bgC394S6RyxdQ@mail.gmail.com>
 <CAO3366yvjPm+kqbG0Do6dE5H0_s98_hOzhj=aaVyJUsJCF18TA@mail.gmail.com>
 <CAMuHMdV3HLoRdW1WLk_s6V9bfG5T8Xq2GzOEpKGHY=3MbCeZVw@mail.gmail.com>
 <CAMuHMdXPxS7ok2fYqtqT_X=kBctPfZHbAqgFSc5eBbGyOJFH0w@mail.gmail.com>
 <CAMuHMdV6dPcDUjA2oRCJMuuD_KsHwq=GS=1sSxDxOYoU3wYnfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdV6dPcDUjA2oRCJMuuD_KsHwq=GS=1sSxDxOYoU3wYnfg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 2018-03-09 13:33:03 +0100, Geert Uytterhoeven wrote:
> Hi Uli,
> 
> On Mon, Feb 26, 2018 at 11:18 AM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Mon, Feb 26, 2018 at 10:21 AM, Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> >> On Mon, Feb 26, 2018 at 10:02 AM, Ulrich Hecht
> >> <ulrich.hecht+renesas@gmail.com> wrote:
> >>> On Tue, Feb 20, 2018 at 2:58 PM, Geert Uytterhoeven
> >>> <geert@linux-m68k.org> wrote:
> >>>> Would there be a use case for vin4_data4 and vin5_data4, or is that
> >>>> mode only supported on R-Car H2?
> >>>
> >>> The docs don't mention it, so I would assume it's not supported.
> >>
> >> Thank you, queuing (also for r8a7795 and r8a77995) in sh-pfc-for-v4.17.
> >
> > Please send follow-up patches to reduce vin_data duplication.
> 
> Due to Sergei's submission for r8a77980, my attention was drawn to
> Tables 26.8.x, which describes which pins are used for each video input
> format.
> 
> The newly added tables for data18 are not correct, as they use the
> VI4_DATA0-17 pins, while data18/rgb666 uses the same pins as data24/rgb888
> mode, minus the 2 LSB pins for each channel. The BSP does it right, just
> like the R-Car Gen2 PFC drivers.
> 
> As in the mean time this is in pinctrl/for-next, can you please send
> follow-up patches fixing this bug for R-Car H3, M3-W, and D3?
> 
> Thanks!
> 
> P.S. Apparently R-Car Gen2 and Gen3 also support 8-bit YCbCr input data
>      on the DATA8-15 pins, for which we don't have pin groups yet.
>      Niklas: is this mode supported by the VIN driver?

* Gen2
I can't find DATA12-15 in the datasheet I have, where did you find them?  
I'm looking at Tables 26.3, 26.4 and 26.5 on v1.0 of the Gen2 datasheet.  
But yes on Gen2 the VIN driver supports capturing from these data pins.

* Gen3
Currently CSI-2 are the only supported input method for the Gen3 
patches. It would be possible with a small hack to run the Gen2 driver 
on Gen3 and have it try and use the DATA pins, but this is not tested as 
prior to V3M we had no device to test this on as the DATA pins where all 
routed to EXIO connectors.

There have been some talks about adding support for this to the driver, 
I know Jacopo posted a patch-set a while ago for this but I have not 
tested it. Looking at the Gen3 Table 26.8.1 it sure looks like all
DATA lines DATA0-23 could be used on some SoCs to capture 24 bit RGB and 
YCbCr.

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
