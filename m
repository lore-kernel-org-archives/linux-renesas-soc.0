Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp1.de.adit-jv.com ([62.225.105.245]:55011 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbeH0Xa3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Aug 2018 19:30:29 -0400
Date: Mon, 27 Aug 2018 21:42:19 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH v2 3/7] pinctrl: sh-pfc: r8a77965: Add HSCIF0 pins,
 groups, and functions
Message-ID: <20180827194219.GC18631@vmlxhi-102.adit-jv.com>
References: <20180812133149.7710-1-erosca@de.adit-jv.com>
 <20180812133149.7710-3-erosca@de.adit-jv.com>
 <CAMuHMdX_gzXfKVLN+2N3Djn+TTRfZYKdmE3-gtD1HJSPjXv1cQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdX_gzXfKVLN+2N3Djn+TTRfZYKdmE3-gtD1HJSPjXv1cQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Mon, Aug 27, 2018 at 05:07:39PM +0200, Geert Uytterhoeven wrote:
> Hi Eugeniu,
> 
> On Sun, Aug 12, 2018 at 3:33 PM Eugeniu Rosca <roscaeugeniu@gmail.com> wrote:
> > According to R-Car Gen3 HW manual Rev.1.00 Apr 2018, M3-N SoC implements
> > five (0..4) HSCIF channels, similar to H3, M3-W and E3.
> >
> > The story behind this patch is tackling below dmesg warnings, which pop
> > up when booting M3NULCB Kingfisher board:
> >
> > $ dmesg | grep sh-pfc
> > sh-pfc e6060000.pin-controller: r8a77965_pfc support registered
> > sh-pfc e6060000.pin-controller: function 'hscif0' not supported
> > sh-pfc e6060000.pin-controller: invalid function hscif0 in map table
> > sh-pfc e6060000.pin-controller: function 'hscif0' not supported
> > sh-pfc e6060000.pin-controller: invalid function hscif0 in map table
> >
> > To fix them, extract the HSCIF0 part from below v4.15-rc1 commits:
> >  - commit 7a362e3488cb ("pinctrl: sh-pfc: r8a7795: Add HSCIF pins, groups, and functions")
> >  - commit 0e4e4999aac1 ("pinctrl: sh-pfc: r8a7796: Add HSCIF pins, groups, and functions")
> >
> > Note that `checkpatch --strict` throws several "CHECK: Please use a
> > blank line after function/struct/union/enum declarations", which are
> > ignored for the sake of staying in sync with the aforementioned commits.
> >
> > Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> 
> Thanks for your patch, but please see commit 7628fa811b8af571 ("pinctrl:
> sh-pfc: r8a77965: Add HSCIF pins, groups, and functions") in v4.19-rc1.

Thanks for pointing out. Please, feel free to drop the patch. Its
purpose was to build a self-contained (no new compiler/dmesg
warnings/errors) patch series assuming v4.18.

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

Best regards,
Eugeniu.
