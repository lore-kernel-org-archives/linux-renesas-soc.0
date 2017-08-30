Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55369 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751330AbdH3J1e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Aug 2017 05:27:34 -0400
Date: Wed, 30 Aug 2017 11:27:26 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dirk Behme <dirk.behme@de.bosch.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: clk: renesas: rcar-gen3: Status of Z* clocks?
Message-ID: <20170830092725.GA5183@verge.net.au>
References: <705d6de1-a037-f1e1-8c61-7b5aa5e0f30a@de.bosch.com>
 <CAMuHMdVuBqSLjMg+r1y7_TRSDL5r1tLhTewfgr5xU9hZup=PLA@mail.gmail.com>
 <1664e732-4e38-06fb-cfef-d42b49a45d62@de.bosch.com>
 <CAMuHMdXzuUzGnUkMfMdMcV5fCcsLn5uP4XQUkh9tfzAsfo0_ww@mail.gmail.com>
 <6cad207c-8f9e-3ed9-36e7-16963a6a3892@de.bosch.com>
 <CAMuHMdXJfrwvK+N8pek6y4ZMQ_oVo2dh+J5Wse5wDpEBGMeUuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXJfrwvK+N8pek6y4ZMQ_oVo2dh+J5Wse5wDpEBGMeUuQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Aug 30, 2017 at 11:09:44AM +0200, Geert Uytterhoeven wrote:
> Hi Dirk,
> 
> On Tue, Aug 29, 2017 at 12:36 PM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> > On 29.08.2017 11:44, Geert Uytterhoeven wrote:
> >> On Tue, Aug 29, 2017 at 11:15 AM, Dirk Behme <dirk.behme@de.bosch.com>
> >> wrote:
> >>>
> >>> But ZG and with this module clock #112 is still missing, no?
> >>>
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?h=v4.9/rcar-3.5.8&id=aa7b99b06d280e4151e
> >>>
> >>>
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?h=v4.9/rcar-3.5.8&id=a03bfd8abc9572800fb5043
> >>
> >>
> >> The ZG bits in the FRQCRB register are documented to exist on R-Car D3
> >> only.
> >
> > ... what contradicts
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?h=v4.9/rcar-3.5.8&id=a03bfd8abc9572800fb5043
> >
> > and the 3DGE module clock in e.g. MSTPSR1 which is documented for H3 and
> > M3-W, too, and Table 8.1a List of Clocks [R-Car H3] ZG -> 3DGE etc.
> 
> That commit doesn't use CLK_TYPE_GEN3_ZG, but models ZG as PLL4/4,
> which matches the block diagram and the list of clocks.
> So that one is acceptable (modulo upstream (non)use of  the 3DGE module?).

I won't stand in the way of adding ZG support on the basis of non-use.

> Later, ZG is changed to use the non-documented bits, cfr.
> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?h=v4.9/rcar-3.5.8&id=054863e7a5855be9b4652c588c140d49bede4dc4
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
> 
