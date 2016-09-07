Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 7 Sep 2016 15:58:55 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, rt@linutronix.de,
        Thomas Gleixner <tglx@linutronix.de>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 02/21] ARM: shmobile: Convert to hotplug state machine
Message-ID: <20160907135855.wl6jbcucua5pgtac@linutronix.de>
References: <20160906170457.32393-1-bigeasy@linutronix.de>
 <20160906170457.32393-3-bigeasy@linutronix.de>
 <CAMuHMdWOZnL1cACUHSK+3T7CYenOci3Jx226cK6C0vq9RssjWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdWOZnL1cACUHSK+3T7CYenOci3Jx226cK6C0vq9RssjWw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2016-09-06 20:05:37 [+0200], Geert Uytterhoeven wrote:
> Hi Sebastian,
Hi Geert,

> Please describe why this is desirable.

We have now an old and new infrastructure in place to handle hotplug
notifications while a CPU goes up and/or down. We want to get rid of the
old infrastructure and are converting its users away. 

> > diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> > index 0da071ff36d2..008eed0c0787 100644
> > --- a/include/linux/cpuhotplug.h
> > +++ b/include/linux/cpuhotplug.h
> > @@ -35,6 +35,7 @@ enum cpuhp_state {
> >         CPUHP_POWERPC_PMAC_PREPARE,
> >         CPUHP_POWERPC_MMU_CTX_PREPARE,
> >         CPUHP_NOTIFY_PREPARE,
> > +       CPUHP_ARM_SHMOBILE_SCU_PREPARE,
> >         CPUHP_TIMERS_DEAD,
> >         CPUHP_BRINGUP_CPU,
> >         CPUHP_AP_IDLE_DEAD,
> 
> What's the rationale behind adding all these numbers and always
> iterating over all
> of them, even though most/all of them cannot be used at the same time
> (e.g. CPUHP_SH_SH3X_PREPARE is for SuperH, while
>  CPUHP_ARM_SHMOBILE_SCU_PREPARE is for ARM)?

PREPARE + STARTING states require static ids. The online callback has
dynamic allocations of ids since it was assumed that this is the most
common one.
We will most likely evaluate the situation once we done and total number
of IDS are not acceptable.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

Sebastian
