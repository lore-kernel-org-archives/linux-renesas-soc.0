Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49953 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753534AbcIFNxA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Sep 2016 09:53:00 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/4] clk: shmobile: r8a7796: Add RAVB clock
Date: Tue, 06 Sep 2016 16:53:27 +0300
Message-ID: <36859074.LaEDpvzPq1@avalon>
In-Reply-To: <CAMuHMdVzd9k7CMxKG0JzDOTgaL6GEhHatAkFjcr6ma7-heWy2g@mail.gmail.com>
References: <1473150352-31081-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1473150352-31081-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdVzd9k7CMxKG0JzDOTgaL6GEhHatAkFjcr6ma7-heWy2g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Tuesday 06 Sep 2016 10:59:47 Geert Uytterhoeven wrote:
> On Tue, Sep 6, 2016 at 10:25 AM, Laurent Pinchart wrote:
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> >  drivers/clk/renesas/r8a7796-cpg-mssr.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c
> > b/drivers/clk/renesas/r8a7796-cpg-mssr.c index cfd5ffb77dfe..868dfe30dfe7
> > 100644
> > --- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
> > +++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> > @@ -99,6 +99,7 @@ static const struct cpg_core_clk r8a7796_core_clks[]
> > __initconst = {> 
> >  static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
> >         DEF_MOD("scif2",                 310,   R8A7796_CLK_S3D4),
> >         DEF_MOD("intc-ap",               408,   R8A7796_CLK_S3D1),
> > +       DEF_MOD("etheravb",              812,   R8A7796_CLK_S3D2),
> 
> According to the datasheet, the parent clock on M3-W (and H3 ES2.0!) is
> S0D6, not S3D2.

Indeed, I'll fix that.

Supporting H3 ES2.0 will be so much fun :-)

-- 
Regards,

Laurent Pinchart
