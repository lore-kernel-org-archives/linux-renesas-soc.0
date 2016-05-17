Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran@ksquared.org.uk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-renesas-soc@vger.kernel.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] clk: renesas: Provide r8a7795 FDP1 clocks
Date: Tue, 17 May 2016 18:43:53 +0300
Message-ID: <3827800.aMmxlTMbVf@avalon>
In-Reply-To: <573B16AD.6060405@bingham.xyz>
References: <1463479411-10817-1-git-send-email-kieran@bingham.xyz> <CAMuHMdWX7H184XBTHxoh76e3=2a+qphZVvvHJiR87MUnJcA4Fg@mail.gmail.com> <573B16AD.6060405@bingham.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Tuesday 17 May 2016 14:03:41 Kieran Bingham wrote:
> On 17/05/16 11:25, Geert Uytterhoeven wrote:
> > On Tue, May 17, 2016 at 12:03 PM, Kieran Bingham wrote:
> >> Add the clocks with a parent of S2D1 for now, until the correct
> >> parentage is identified
> > 
> > Thanks for your patch!
> > 
> >> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> >> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> >> @@ -128,6 +128,9 @@ static const struct cpg_core_clk r8a7795_core_clks[]
> >> __initconst = {
> >>  };
> >>  
> >>  static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
> >> +       DEF_MOD("fdp1-ch2",              117,   R8A7795_CLK_S2D1),
> >> +       DEF_MOD("fdp1-ch1",              118,   R8A7795_CLK_S2D1),
> >> +       DEF_MOD("fdp1-ch0",              119,   R8A7795_CLK_S2D1),
> > 
> > I would call them "fdp1-2" etc., to match the documentation for the
> > various Module Stop registers.
> 
> Ok. I've adjusted the names locally, and I'll await
> confirmation/correction on the clock parents before a resubmit with
> updated commit-log/sign-off.
> 
> I presume patches can be integrated as soon as they are wholly
> independent? i.e. this update, and the DTS updates for the FDP1, then
> the FDP1 driver itself? or would it be preferred to batch the whole lot
> up into one set?

You can get the pieces merged separately, but the DTS updates need the 
corresponding DT bindings patch to be at least acked first.

> Possibly just as well to keep the DT, and driver close together...

-- 
Regards,

Laurent Pinchart
