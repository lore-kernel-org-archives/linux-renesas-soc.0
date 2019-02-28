Return-Path: <SRS0=CNOd=RD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4245CC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Feb 2019 10:34:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 18EB42171F
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Feb 2019 10:34:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730524AbfB1Keu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 28 Feb 2019 05:34:50 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:42395 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726918AbfB1Keu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Feb 2019 05:34:50 -0500
Received: by mail-vk1-f196.google.com with SMTP id j195so4608860vkj.9;
        Thu, 28 Feb 2019 02:34:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L6dS5yBs0z3sO4LGUBbe5xXUJUWp5lsMcUaoD+wK+LU=;
        b=bSCLx3aGp8zBmFoeWEmMqugr3Qk2Xx0VCUEmHM7azZ5Ws4zE8W1IZ/xZjxH21NVTyk
         kz+K6b1FVP7+gMqeWyG0OtIzHEH5xtAW1z4fm29tNFX76viwQlZfU47jXbrCeZOCE/ul
         08gxWw53j37+3BX384SIwp7K4Px2u3zdX+Il3jBnVWsSTvFKq2OvHAcOvdX8YBXwrh4H
         4K64QurTdu/M7ro46M2exOYHpfKVmQ5er34mPf+B70wkv7/lv/ciUPyzvoeC3Jy5+yC7
         9wof/g6/KoGW7R8t+x8fBZg6MX7YLAm41+2BPzg0AwtXdNIXPAVbfMoBgbtLt1mn1vTy
         896A==
X-Gm-Message-State: AHQUAuaQUFEKtuIQFVKOJ5x4fU0EAchhzxEkI8joxfLPle64F331UpCh
        nUI5RQb1T3vJ7dSTkJV0sNdqua5+5QpPi2uveXc=
X-Google-Smtp-Source: AHgI3IZRRdzX9VQ6OXpe4tPaiR4nyS3F/5vqdk29rm8xXDco9WzFxv4ArnLx1snOABWN07Py0bIKTDFYW0OmCaXRTIg=
X-Received: by 2002:a1f:a5d3:: with SMTP id o202mr3428444vke.40.1551350089132;
 Thu, 28 Feb 2019 02:34:49 -0800 (PST)
MIME-Version: 1.0
References: <20180731160855.6758-1-geert+renesas@glider.be>
 <20180731160855.6758-5-geert+renesas@glider.be> <CAMuHMdWSsjO731VwMeLXqDjCboH=7k546PjovN5yPEHwn8zu9g@mail.gmail.com>
In-Reply-To: <CAMuHMdWSsjO731VwMeLXqDjCboH=7k546PjovN5yPEHwn8zu9g@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Feb 2019 11:34:36 +0100
Message-ID: <CAMuHMdW2U_UmMNXdmG27FBmY7PYtQ=Pju6ZhDtxVSTQFzh+j6w@mail.gmail.com>
Subject: Re: [PATCH/RFC 4/4] [WIP] ARM: shmobile: Enable ARM_GLOBAL_TIMER on
 Cortex-A9 MPCore SoCs
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 21, 2018 at 9:37 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Jul 31, 2018 at 6:08 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > SH-Mobile AG5 and R-Car H1 SoCs are based on the Cortex-A9 MPCore, which
> > includes a global timer.
> >
> > Enable the ARM global timer on these SoCs, which will be used for:
> >   - the scheduler clock, improving scheduler accuracy from 10 ms to 3 or
> >     4 ns,
> >   - delay loops, allowing removal of calls to shmobile_init_delay() from
> >     the corresponding machine vectors.
> >
> > Note that when using an old DTB lacking the global timer, the kernel
> > will still work.  However, loops-per-jiffies will no longer be preset,
> > and the delay loop will need to be calibrated during boot.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> This seems to cause random system resume issues on the venerable SH-Mobile
> AG5, ranging from plain lockups to RCU warnings:
>
> WARNING: suspicious RCU usage
> 4.18.0-kzm9g-00218-gaf4425056bd09e9e #38 Not tainted
> -----------------------------
> kernel/sched/fair.c:6231 suspicious rcu_dereference_check() usage!
>
> other info that might help us debug this:
>
>
> RCU used illegally from offline CPU!
> rcu_scheduler_active = 2, debug_locks = 1
> 3 locks held by swapper/1/0:
>  #0: 6d7f5781 ((cpu_died).wait.lock){....}, at: complete+0x14/0x48
>  #1: 84ce6f8e (&p->pi_lock){-.-.}, at: try_to_wake_up+0x30/0x3cc
>  #2: 93591133 (rcu_read_lock){....}, at: select_task_rq_fair+0x5c/0xe8c
>
> stack backtrace:
> CPU: 1 PID: 0 Comm: swapper/1 Not tainted
> 4.18.0-kzm9g-00218-gaf4425056bd09e9e #38
> Hardware name: Generic SH73A0 (Flattened Device Tree)
> [<c010f22c>] (unwind_backtrace) from [<c010bab0>] (show_stack+0x10/0x14)
> [<c010bab0>] (show_stack) from [<c0599750>] (dump_stack+0x9c/0xd4)
> [<c0599750>] (dump_stack) from [<c01542c8>] (select_task_rq_fair+0x140/0xe8c)
> [<c01542c8>] (select_task_rq_fair) from [<c0149494>]
> (try_to_wake_up+0x210/0x3cc)
> [<c0149494>] (try_to_wake_up) from [<c016355c>] (__wake_up_common+0xcc/0x140)
> [<c016355c>] (__wake_up_common) from [<c01636a8>] (__wake_up_locked+0x14/0x1c)
> [<c01636a8>] (__wake_up_locked) from [<c016450c>] (complete+0x38/0x48)
> [<c016450c>] (complete) from [<c010d66c>] (arch_cpu_idle_dead+0x2c/0x8c)
> [<c010d66c>] (arch_cpu_idle_dead) from [<c014edec>] (do_idle+0x98/0x148)
> [<c014edec>] (do_idle) from [<c014f1fc>] (cpu_startup_entry+0x18/0x1c)
> [<c014f1fc>] (cpu_startup_entry) from [<4010246c>] (0x4010246c)
>
> Given secondary CPU startup is already quite flaky on this SoC, perhaps
> it's best to leave it alone?

Last time I saw that was on v4.19-rc7 in October.
Presumably that was fixed in the big RCU update in v4.20-rc1, so I think
it's safe to use the Global Timer on SH Mobile AG5 now.

Thoughts?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
