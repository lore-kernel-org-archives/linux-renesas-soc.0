Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:53220 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751754AbcJENEo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Oct 2016 09:04:44 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH] ARM: shmobile: Remove unneeded check in SMP initialization
Date: Wed, 05 Oct 2016 16:04:39 +0300
Message-ID: <6311567.Xmt6xgUBQy@avalon>
In-Reply-To: <CAMuHMdUwussH1Tvzrz3=cOmt0b-+fS5ybd7gvy2FdYRiVADO1g@mail.gmail.com>
References: <1475663291-4502-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdUwussH1Tvzrz3=cOmt0b-+fS5ybd7gvy2FdYRiVADO1g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Wednesday 05 Oct 2016 13:25:12 Geert Uytterhoeven wrote:
> On Wed, Oct 5, 2016 at 12:28 PM, Laurent Pinchart wrote:
> > The SMP initialization function is only called if CONFIG_SMP is defined.
> > Remove the duplicate check.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> >  arch/arm/mach-shmobile/platsmp.c | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/arch/arm/mach-shmobile/platsmp.c
> > b/arch/arm/mach-shmobile/platsmp.c index 02e21bceb085..48595a397220
> > 100644
> > --- a/arch/arm/mach-shmobile/platsmp.c
> > +++ b/arch/arm/mach-shmobile/platsmp.c
> > @@ -39,9 +39,5 @@ bool shmobile_smp_cpu_can_disable(unsigned int cpu)
> > 
> >  bool __init shmobile_smp_init_fallback_ops(void)
> >  {
> > -       /* fallback on PSCI/smp_ops if no other DT based method is
> > detected */
> > -       if (!IS_ENABLED(CONFIG_SMP))
> > -               return false;
> > -
> >         return platform_can_secondary_boot() ? true : false;
> >  }
> 
> This check was added recently, because the UP build was broken.

I should have found that out. Sorry about the noise and thanks for the review.

-- 
Regards,

Laurent Pinchart
