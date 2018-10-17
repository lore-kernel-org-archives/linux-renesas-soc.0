Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65]:36994 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726691AbeJQR3q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 13:29:46 -0400
Received: by mail-vs1-f65.google.com with SMTP id r83so20328968vsc.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Oct 2018 02:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <1539669890-25719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20181017085719.5ukyuml3ugmfdtmp@verge.net.au>
In-Reply-To: <20181017085719.5ukyuml3ugmfdtmp@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Oct 2018 11:34:43 +0200
Message-ID: <CAMuHMdU09fTvuF3kCkN0dJk_S25_KYyL-1OCgPGNQxs=w2YaEw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: revise hsusb's reg size
To: Simon Horman <horms@verge.net.au>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Wed, Oct 17, 2018 at 10:57 AM Simon Horman <horms@verge.net.au> wrote:
> On Tue, Oct 16, 2018 at 03:04:50PM +0900, Yoshihiro Shimoda wrote:
> > This patch revises the reg size of each hsusb device node for
> > r8a7795, r8a7796 and r8a77965.
> >
> > Reported-by: Biju Das <biju.das@bp.renesas.com>
> > Fixes: d2422e108812 ("arm64: dts: r8a7795: Add HSUSB device node")
> > Fixes: 4725f2b88057 ("arm64: dts: renesas: r8a7795: add hsusb ch3 device node")
> > Fixes: b9535853777f ("arm64: dts: r8a7796: Add HSUSB device node")
> > Fixes: 9e1b00a2ef43 ("arm64: dts: renesas: r8a77965: Add "reg" properties")
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>
> Thanks Shimoda-san,
>
> This looks fine to me but I will wait to see if there are other reviews
> before applying.
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
>
>
> Also, could you let me know if this has any run-time effect?
> If so perhaps it should be treated as a fix for v4.20 rather than
> a patch for v4.21.

Probably not, as mapping granularity is PAGE_SIZE (> 0x200) anyway.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
