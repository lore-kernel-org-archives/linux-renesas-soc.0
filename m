Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f67.google.com ([209.85.222.67]:44137 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbeIETuc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Sep 2018 15:50:32 -0400
MIME-Version: 1.0
References: <1536042803-6152-1-git-send-email-neeraju@codeaurora.org>
 <alpine.DEB.2.21.1809051244500.1416@nanos.tec.linutronix.de>
 <alpine.DEB.2.21.1809051419580.1416@nanos.tec.linutronix.de> <20180905145353.GA14069@e107155-lin>
In-Reply-To: <20180905145353.GA14069@e107155-lin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Sep 2018 17:19:40 +0200
Message-ID: <CAMuHMdUEVt0JW6XV9zOx53Rv3C9Za-5hjg=J6TpWgUxHWcctjQ@mail.gmail.com>
Subject: Re: [PATCH] cpu/hotplug: Fix rollback during error-out in takedown_cpu()
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>, dzickus@redhat.com,
        Brendan Jackman <brendan.jackman@arm.com>,
        Mathieu Malaterre <malat@debian.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        sramana@codeaurora.org, linux-arm-msm@vger.kernel.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sudeep,

Thanks for the CC!

On Wed, Sep 5, 2018 at 4:54 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> On Wed, Sep 05, 2018 at 02:23:46PM +0200, Thomas Gleixner wrote:
> > On Wed, 5 Sep 2018, Thomas Gleixner wrote:
> > > On Tue, 4 Sep 2018, Neeraj Upadhyay wrote:
> > > >   ret = cpuhp_down_callbacks(cpu, st, target);
> > > >   if (ret && st->state > CPUHP_TEARDOWN_CPU && st->state < prev_state) {
> > > > -         cpuhp_reset_state(st, prev_state);
> > > > +         /*
> > > > +          * As st->last is not set, cpuhp_reset_state() increments
> > > > +          * st->state, which results in CPUHP_AP_SMPBOOT_THREADS being
> > > > +          * skipped during rollback. So, don't use it here.
> > > > +          */
> > > > +         st->rollback = true;
> > > > +         st->target = prev_state;
> > > > +         st->bringup = !st->bringup;
> > >
> > > No, this is just papering over the actual problem.
> > >
> > > The state inconsistency happens in take_cpu_down() when it returns with a
> > > failure from __cpu_disable() because that returns with state = TEARDOWN_CPU
> > > and st->state is then incremented in undo_cpu_down().
> > >
> > > That's the real issue and we need to analyze the whole cpu_down rollback
> > > logic first.
> >
> > And looking closer this is a general issue. Just that the TEARDOWN state
> > makes it simple to observe. It's universaly broken, when the first teardown
> > callback fails because, st->state is only decremented _AFTER_ the callback
> > returns success, but undo_cpu_down() increments unconditionally.
> >
> > Patch below.
>
> This patch fixes the issue reported @[1]. Lorenzo did some debugging and
> I wanted to have a look at it at some point but this discussion drew my
> attention and sounded very similar[2]. So I did a quick test with this
> patch and it fixes the issue.

> [1] https://lore.kernel.org/lkml/CAMuHMdVg868LgL5xTg5Dp5rReKxoo+8fRy+ETJiMxGWZCp+hWw@mail.gmail.com/
> [2] https://lore.kernel.org/lkml/20180823131505.GA31558@red-moon/

Thomas' patch fixes the issue for me:
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
