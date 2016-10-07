Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:47884 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756321AbcJGIcg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Oct 2016 04:32:36 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] ARM: shmobile: Consolidate R8A779[234] machine definitions
Date: Fri, 07 Oct 2016 11:31:38 +0300
Message-ID: <1887854.q6czybrPJL@avalon>
In-Reply-To: <CAMuHMdVVE2N20zmCddy6Y2mMBf4zk0u=WfQ3Sa1e_ASOf5zO_Q@mail.gmail.com>
References: <1475663489-4789-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdVVE2N20zmCddy6Y2mMBf4zk0u=WfQ3Sa1e_ASOf5zO_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Friday 07 Oct 2016 09:43:53 Geert Uytterhoeven wrote:
> On Wed, Oct 5, 2016 at 12:31 PM, Laurent Pinchart wrote:
> > The three SoCs use the exact same machine definition, consolidate them
> > into a single one.
> 
> Thanks for your patch!
> 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks.

> I'm wondering if we can improve upon...

I think we can. Your points below are valid, patches are welcome ;-)

> > --- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
> > +++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
> > @@ -203,3 +204,22 @@ void __init rcar_gen2_reserve(void)
> >         }
> >  #endif
> >  }
> > +
> > +static const char * const rcar_gen2_boards_compat_dt[] __initconst = {
> > +       /*
> > +        * R8A7790 and R8A7791 can't be handled here as long as they need
> > SMP
> > +        * initialization fallback.
> > +        */
> > +       "renesas,r8a7792",
> > +       "renesas,r8a7793",
> > +       "renesas,r8a7794",
> > +       NULL,
> > +};
> > +
> > +DT_MACHINE_START(RCAR_GEN2_DT, "Generic Gen2 (Flattened Device Tree)")
> > +       .init_early     = shmobile_init_delay,
> 
> shmobile_init_delay() is not really Renesas-specific, but ARM-specific.
> This is just to avoid calibrating the delay loop?
> 
> > +       .init_late      = shmobile_init_late,
> 
> This calls only into shmobile_suspend_init(), which is also not
> Renesas-specific.
> 
> > +       .init_time      = rcar_gen2_timer_init,
> 
> This is about fixing up the ARM Arch timer, and initializing clocks as we
> need to pass the mode pin state (ugh, will hopefully go away soon).
> 
> > +       .reserve        = rcar_gen2_reserve,
> 
> Reserving a block for CMA DMA is also not really Renesas-specific.
> 
> > +       .dt_compat      = rcar_gen2_boards_compat_dt,
> > +MACHINE_END

-- 
Regards,

Laurent Pinchart
