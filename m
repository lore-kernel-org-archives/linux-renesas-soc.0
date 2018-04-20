Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f170.google.com ([209.85.128.170]:41580 "EHLO
        mail-wr0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755830AbeDTQAR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Apr 2018 12:00:17 -0400
Received: by mail-wr0-f170.google.com with SMTP id v24-v6so24254766wra.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Apr 2018 09:00:16 -0700 (PDT)
Date: Fri, 20 Apr 2018 18:00:13 +0200
From: Vincent Guittot <vincent.guittot@linaro.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>,
        Heiner Kallweit <hkallweit1@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Ingo Molnar <mingo@redhat.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: Potential problem with 31e77c93e432dec7 ("sched/fair: Update
 blocked load when newly idle")
Message-ID: <20180420160013.GA13769@linaro.org>
References: <20180412091822.GG12256@bigcity.dyn.berto.se>
 <CAKfTPtAE3qeWcTdT-WL8nrbZmP_+OaxPyyjUfVCzn=rax9tQZQ@mail.gmail.com>
 <20180412111519.GH12256@bigcity.dyn.berto.se>
 <20180412133031.GA551@linaro.org>
 <20180412223904.GJ12256@bigcity.dyn.berto.se>
 <CAKfTPtDRtto7w806gYgdS_bCJ77EY0RRtszycB+TnG6aQ6ve4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKfTPtDRtto7w806gYgdS_bCJ77EY0RRtszycB+TnG6aQ6ve4Q@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Heiner and Niklas,

Le Saturday 14 Apr 2018 � 13:24:20 (+0200), Vincent Guittot a �crit :
> Hi Niklas,
> 
> On 13 April 2018 at 00:39, Niklas S�derlund
> <niklas.soderlund@ragnatech.se> wrote:
> > Hi Vincent,
> >
> > Thanks for helping trying to figure this out.
> >
> > On 2018-04-12 15:30:31 +0200, Vincent Guittot wrote:
> >
> > [snip]
> >
> >>
> >> I'd like to narrow the problem a bit more with the 2 patchies aboves. Can you try
> >> them separatly on top of c18bb396d3d261eb ("Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net"))
> >> and check if one of them fixes the problem ?i
> >
> > I tried your suggested changes based on top of c18bb396d3d261eb.
> >
> >>
> >> (They should apply on linux-next as well)
> >>
> >> First patch always kick ilb instead of doing ilb on local cpu before entering idle
> >>
> >> ---
> >>  kernel/sched/fair.c | 3 +--
> >>  1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> >> index 0951d1c..b21925b 100644
> >> --- a/kernel/sched/fair.c
> >> +++ b/kernel/sched/fair.c
> >> @@ -9739,8 +9739,7 @@ static void nohz_newidle_balance(struct rq *this_rq)
> >>        * candidate for ilb instead of waking up another idle CPU.
> >>        * Kick an normal ilb if we failed to do the update.
> >>        */
> >> -     if (!_nohz_idle_balance(this_rq, NOHZ_STATS_KICK, CPU_NEWLY_IDLE))
> >> -             kick_ilb(NOHZ_STATS_KICK);
> >> +     kick_ilb(NOHZ_STATS_KICK);
> >>       raw_spin_lock(&this_rq->lock);
> >>  }
> >
> > This change don't seem to effect the issue. I can still get the single
> > ssh session and the system to lockup by hitting the return key. And
> > opening a second ssh session immediately unblocks both the first ssh
> > session and the serial console. And I can still trigger the console
> > warning by just letting the system be once it locks-up. I do have
> > just as before reset the system a few times to trigger the issue.
> 
> You results are similar to Heiner's ones. The problem is still there
> even if we only kick ilb which mainly send an IPI reschedule to the
> other CPU if Idle
> 

Could it be possible to record some traces of the problem to get a better view
of what happens ?

I have a small patch that adds some traces in the functions that seems to create
the problem

---
 kernel/sched/fair.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0951d1c..a951464 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9606,6 +9606,8 @@ static bool _nohz_idle_balance(struct rq *this_rq, unsigned int flags,
 	 */
 	WRITE_ONCE(nohz.has_blocked, 0);
 
+	trace_printk("_nohz_idle_balance cpu %d idle %d flag %x", this_cpu, idle, flags);
+
 	/*
 	 * Ensures that if we miss the CPU, we must see the has_blocked
 	 * store from nohz_balance_enter_idle().
@@ -9680,6 +9682,8 @@ static bool _nohz_idle_balance(struct rq *this_rq, unsigned int flags,
 	if (likely(update_next_balance))
 		nohz.next_balance = next_balance;
 
+	trace_printk("_nohz_idle_balance return %d", ret);
+
 	return ret;
 }
 
@@ -9732,6 +9736,8 @@ static void nohz_newidle_balance(struct rq *this_rq)
 	    time_before(jiffies, READ_ONCE(nohz.next_blocked)))
 		return;
 
+	trace_printk("nohz_newidle_balance start update");
+
 	raw_spin_unlock(&this_rq->lock);
 	/*
 	 * This CPU is going to be idle and blocked load of idle CPUs
-- 
2.7.4


Also that would be good to stop tracing when the RCU stall happens

In case you are not familiar with the trace tool, I have put below how to configure ftrace to trace scheudler, irq, timer ... events and stop tracing when dump_backtrace function is called

trace-cmd reset > /dev/null
trace-cmd start -b 40000 -p function -l dump_backtrace:traceoff -e sched -e cpu_idle -e cpu_frequency -e timer -e ipi -e irq -e printk
trace-cmd start -b 40000 -p function -l dump_backtrace

The trace-cmd start has to be called twice to make sure that we will not trace all function

Once the dump happen and the trace is stopped, you can extract the traces with 

trace-cmd extract -o <trace file name>

Thanks
Vincent
