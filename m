Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:58312 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752171AbcJRIdu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Oct 2016 04:33:50 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 3/3] clk: renesas: r8a7796: Add DU and LVDS clocks
Date: Tue, 18 Oct 2016 11:33:47 +0300
Message-ID: <4185496.IYlyB0ezCp@avalon>
In-Reply-To: <CAMuHMdUAdEEzqjm_qZCa0C65r96mbe+u5NC_Z8gytv8oWQY-zw@mail.gmail.com>
References: <1476738753-24304-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1476738753-24304-4-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdUAdEEzqjm_qZCa0C65r96mbe+u5NC_Z8gytv8oWQY-zw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Tuesday 18 Oct 2016 10:31:10 Geert Uytterhoeven wrote:
> On Mon, Oct 17, 2016 at 11:12 PM, Laurent Pinchart wrote:
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > ---
> > 
> >  drivers/clk/renesas/r8a7796-cpg-mssr.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c
> > b/drivers/clk/renesas/r8a7796-cpg-mssr.c index 679054658f99..20bd0643b238
> > 100644
> > --- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
> > +++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> > @@ -134,6 +134,10 @@ static const struct mssr_mod_clk r8a7796_mod_clks[]
> > __initconst = {
> >         DEF_MOD("vspd0",                 623,   R8A7796_CLK_S0D2),
> >         DEF_MOD("vspb",                  626,   R8A7796_CLK_S0D1),
> >         DEF_MOD("vspi0",                 631,   R8A7796_CLK_S0D1),
> > +       DEF_MOD("du2",                   722,   R8A7796_CLK_S0D2),
> > +       DEF_MOD("du1",                   723,   R8A7796_CLK_S0D2),
> > +       DEF_MOD("du0",                   724,   R8A7796_CLK_S0D2),
> 
> I'll fix up the DU parent clock to S2D1 now we got confirmation.

Fixed in v2, sent out to the list, and pushed to 
git://linuxtv.org/pinchartl/media.git drm/r8a7796/clk with your acks picked up 
:-)

Can I assume you'll take the patches in your tree for v4.10 ?

> > +       DEF_MOD("lvds",                  727,   R8A7796_CLK_S0D4),

-- 
Regards,

Laurent Pinchart
