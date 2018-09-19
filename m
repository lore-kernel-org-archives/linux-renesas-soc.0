Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f195.google.com ([209.85.221.195]:46835 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727990AbeISOU6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 10:20:58 -0400
Received: by mail-vk1-f195.google.com with SMTP id b14-v6so969205vke.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Sep 2018 01:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <153717356234.480.6698281193817518888.sendpatchset@octo>
 <153717357067.480.7556586771925219502.sendpatchset@octo> <CAMuHMdU6Gh3kUmKRxCQQfaXSq-70QZF6CHZhgLxtFs7+gEJsYQ@mail.gmail.com>
 <20180919083057.ch5zq76d3qxdz55t@verge.net.au>
In-Reply-To: <20180919083057.ch5zq76d3qxdz55t@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Sep 2018 10:43:53 +0200
Message-ID: <CAMuHMdUSPLC10Vbv0Vh2yTSjD1uK623a92WknoqFOTp-P3nh-A@mail.gmail.com>
Subject: Re: [PATCH 01/03] dt-bindings: arm: consistently name SH-Mobile AG5
 as R8A73A00
To: Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 19, 2018 at 10:31 AM Simon Horman <horms@verge.net.au> wrote:
> On Mon, Sep 17, 2018 at 01:20:57PM +0200, Geert Uytterhoeven wrote:
> > On Mon, Sep 17, 2018 at 10:39 AM Magnus Damm <magnus.damm@gmail.com> wrote:
> > > From: Magnus Damm <damm@opensource.se>
> > >
> > > Update the description of the AG5 entry to follow same style as other SoCs.
> > >
> > > The actual DT binding remains unchanged.
> > >
> > > Signed-off-by: Magnus Damm <damm@opensource.se>
> >
> > Thanks for your patch!
> >
> > Do you plan to update the other occurrences under
> > Documentation/devicetree/bindings/, too?
>
> Which occurrences are you concerned about?

git grep SH73A0 -- Documentation/devicetree/bindings/

I have mixed feelings about this patch. AFAIU, it was called SH73A0 originally,
but renamed R8A73A0 after SuperHitachi and successors morphed into Renesas?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
