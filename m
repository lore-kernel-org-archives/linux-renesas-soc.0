Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50251 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbeJRUlC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Oct 2018 16:41:02 -0400
Date: Thu, 18 Oct 2018 14:40:08 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: revise hsusb's reg size
Message-ID: <20181018124008.hzwlcay5pxgadexd@verge.net.au>
References: <1539669890-25719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20181017085719.5ukyuml3ugmfdtmp@verge.net.au>
 <CAMuHMdU09fTvuF3kCkN0dJk_S25_KYyL-1OCgPGNQxs=w2YaEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU09fTvuF3kCkN0dJk_S25_KYyL-1OCgPGNQxs=w2YaEw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 17, 2018 at 11:34:43AM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Wed, Oct 17, 2018 at 10:57 AM Simon Horman <horms@verge.net.au> wrote:
> > On Tue, Oct 16, 2018 at 03:04:50PM +0900, Yoshihiro Shimoda wrote:
> > > This patch revises the reg size of each hsusb device node for
> > > r8a7795, r8a7796 and r8a77965.
> > >
> > > Reported-by: Biju Das <biju.das@bp.renesas.com>
> > > Fixes: d2422e108812 ("arm64: dts: r8a7795: Add HSUSB device node")
> > > Fixes: 4725f2b88057 ("arm64: dts: renesas: r8a7795: add hsusb ch3 device node")
> > > Fixes: b9535853777f ("arm64: dts: r8a7796: Add HSUSB device node")
> > > Fixes: 9e1b00a2ef43 ("arm64: dts: renesas: r8a77965: Add "reg" properties")
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
> > Thanks Shimoda-san,
> >
> > This looks fine to me but I will wait to see if there are other reviews
> > before applying.
> >
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> >
> >
> > Also, could you let me know if this has any run-time effect?
> > If so perhaps it should be treated as a fix for v4.20 rather than
> > a patch for v4.21.
> 
> Probably not, as mapping granularity is PAGE_SIZE (> 0x200) anyway.

Thanks, I have applied this for v4.21.
