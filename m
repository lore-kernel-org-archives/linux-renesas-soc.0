Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f68.google.com ([209.85.217.68]:46190 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726483AbeJIQov (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Oct 2018 12:44:51 -0400
MIME-Version: 1.0
References: <20180918102226.8017-1-horms+renesas@verge.net.au> <5bddb393-3060-6d74-4cf1-3547cb87924e@cogentembedded.com>
In-Reply-To: <5bddb393-3060-6d74-4cf1-3547cb87924e@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Oct 2018 11:28:40 +0200
Message-ID: <CAMuHMdU_6uBpHOFshgxc61GOG1o1ibAoi5T1n_ZdYZ+=i8H5Sw@mail.gmail.com>
Subject: Re: [PATCH v3 net-next] ravb: do not write 1 to reserved bits
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        "David S. Miller" <davem@davemloft.net>,
        Magnus Damm <magnus.damm@gmail.com>,
        netdev <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Tue, Sep 18, 2018 at 6:55 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 09/18/2018 01:22 PM, Simon Horman wrote:
> > From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> > EtherAVB hardware requires 0 to be written to status register bits in
> > order to clear them, however, care must be taken not to:
> >
> > 1. Clear other bits, by writing zero to them
> > 2. Write one to reserved bits
> >
> > This patch corrects the ravb driver with respect to the second point above.
> > This is done by defining reserved bit masks for the affected registers and,
> > after auditing the code, ensure all sites that may write a one to a
> > reserved bit use are suitably masked.
> >
> > Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> [...]
>
> Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> > diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> > index 1470fc12282b..9b6bf557a2f5 100644
> > --- a/drivers/net/ethernet/renesas/ravb.h
> > +++ b/drivers/net/ethernet/renesas/ravb.h
> > @@ -428,6 +428,7 @@ enum EIS_BIT {
> >       EIS_CULF1       = 0x00000080,
> >       EIS_TFFF        = 0x00000100,
> >       EIS_QFS         = 0x00010000,
> > +     EIS_RESERVED    = (GENMASK(31, 17) | GENMASK(15, 11)),
>
>    Well, I'm not a big fan of BIT() and GENMASK() -- they still lack a macro
> to #define a bit/field value. But if you prefer to use them, OK, let's be so...

FIELD_PREP()?

Perhaps the other bit definitions should be converted to BIT()?
That way it becomes much easier to match valid EIS_* bits with EIS_RESERVED.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
