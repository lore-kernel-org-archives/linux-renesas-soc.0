Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kieran Bingham <kieran@ksquared.org.uk>, linux-renesas-soc@vger.kernel.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] clk: renesas: Provide r8a7795 FDP1 clocks
Date: Tue, 17 May 2016 18:42:40 +0300
Message-ID: <60985808.sO50ZmgucX@avalon>
In-Reply-To: <CAMuHMdWX7H184XBTHxoh76e3=2a+qphZVvvHJiR87MUnJcA4Fg@mail.gmail.com>
References: <1463479411-10817-1-git-send-email-kieran@bingham.xyz> <1463479411-10817-2-git-send-email-kieran@bingham.xyz> <CAMuHMdWX7H184XBTHxoh76e3=2a+qphZVvvHJiR87MUnJcA4Fg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Kieran,

On Tuesday 17 May 2016 12:25:37 Geert Uytterhoeven wrote:
> On Tue, May 17, 2016 at 12:03 PM, Kieran Bingham wrote:
> > Add the clocks with a parent of S2D1 for now, until the correct
> > parentage is identified
> 
> Thanks for your patch!
> 
> > --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> > +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> > @@ -128,6 +128,9 @@ static const struct cpg_core_clk r8a7795_core_clks[]
> > __initconst = {> 
> >  };
> >  
> >  static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
> > 
> > +       DEF_MOD("fdp1-ch2",              117,   R8A7795_CLK_S2D1),
> > +       DEF_MOD("fdp1-ch1",              118,   R8A7795_CLK_S2D1),
> > +       DEF_MOD("fdp1-ch0",              119,   R8A7795_CLK_S2D1),
> 
> I would call them "fdp1-2" etc., to match the documentation for the various
> Module Stop registers.
> 
> Apart from that:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

After fixing that (and double-checking the clock parent),

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
