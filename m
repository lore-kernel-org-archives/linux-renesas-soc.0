Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36892 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032245AbeEZRb4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 May 2018 13:31:56 -0400
Received: by mail-wm0-f65.google.com with SMTP id l1-v6so22236029wmb.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 26 May 2018 10:31:56 -0700 (PDT)
Subject: Re: [PATCH 0/6] ravb/sh_eth: fix sleep in atomic by reusing shared
 ethtool handlers
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1527160318-10958-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <6ffa0c08-2210-379c-50f0-d5bf43ab569e@cogentembedded.com>
 <88a3af9d-7aa8-5c60-2625-6b529bd8d93c@cogentembedded.com>
 <22b370a7-0990-f1f5-196e-6e353a4e34ac@mentor.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <27025084-eee4-d851-7473-ea456a5e8168@cogentembedded.com>
Date: Sat, 26 May 2018 20:31:53 +0300
MIME-Version: 1.0
In-Reply-To: <22b370a7-0990-f1f5-196e-6e353a4e34ac@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05/25/2018 09:25 AM, Vladimir Zapolskiy wrote:

>>>> For ages trivial changes to RAVB and SuperH ethernet links by means of
>>>> standard 'ethtool' trigger a 'sleeping function called from invalid
>>>> context' bug, to visualize it on r8a7795 ULCB:
>>>>
>>>>   % ethtool -r eth0
>>>>   BUG: sleeping function called from invalid context at kernel/locking/mutex.c:747
>>>>   in_atomic(): 1, irqs_disabled(): 128, pid: 554, name: ethtool
>>>>   INFO: lockdep is turned off.
>>>>   irq event stamp: 0
>>>>   hardirqs last  enabled at (0): [<0000000000000000>]           (null)
>>>>   hardirqs last disabled at (0): [<ffff0000080e1d3c>] copy_process.isra.7.part.8+0x2cc/0x1918
>>>>   softirqs last  enabled at (0): [<ffff0000080e1d3c>] copy_process.isra.7.part.8+0x2cc/0x1918
>>>>   softirqs last disabled at (0): [<0000000000000000>]           (null)
>>>>   CPU: 5 PID: 554 Comm: ethtool Not tainted 4.17.0-rc4-arm64-renesas+ #33
>>>>   Hardware name: Renesas H3ULCB board based on r8a7795 ES2.0+ (DT)
>>>>   Call trace:
>>>>    dump_backtrace+0x0/0x198
>>>>    show_stack+0x24/0x30
>>>>    dump_stack+0xb8/0xf4
>>>>    ___might_sleep+0x1c8/0x1f8
>>>>    __might_sleep+0x58/0x90
>>>>    __mutex_lock+0x50/0x890
>>>>    mutex_lock_nested+0x3c/0x50
>>>>    phy_start_aneg_priv+0x38/0x180
>>>>    phy_start_aneg+0x24/0x30
>>>>    ravb_nway_reset+0x3c/0x68
>>>>    dev_ethtool+0x3dc/0x2338
>>>>    dev_ioctl+0x19c/0x490
>>>>    sock_do_ioctl+0xe0/0x238
>>>>    sock_ioctl+0x254/0x460
>>>>    do_vfs_ioctl+0xb0/0x918
>>>>    ksys_ioctl+0x50/0x80
>>>>    sys_ioctl+0x34/0x48
>>>>    __sys_trace_return+0x0/0x4
>>>>
>>>> The root cause is that an attempt to modify ECMR and GECMR registers
>>>> only when RX/TX function is disabled was too overcomplicated in its
>>>> original implementation, also processing of an optional Link Change
>>>> interrupt added even more complexity, as a result the implementation
>>>> was error prone.
>>>>
>>>> The new locking scheme is confirmed to be correct by dumping driver
>>>> specific and generic PHY framework function calls with aid of ftrace
>>>> while running more or less advanced tests.
>>>>
>>>> Please note that sh_eth patches from the series were built-tested only.
>>>>
>>>> On purpose I do not add Fixes tags, the reused PHY handlers were added
>>>> way later than the fixed problems were firstly found in the drivers.
>>>
>>>    I think you went one step too far with these fixes. On the first glance,
>>> the real fixes are to remove grabbing/releasing the spinlock for the duration
>>> of the phylib calls. Am I right? If so, making use of the new phylib APIs
>>> would be a further enhancement, it's not needed for fixing the splats per se...
>>
>>    Note that I hadn't looked at the patches #3/#6 at the time of writing this;
>> those seem to be more complicated than the rest.
> 
> Right, the simplistic approach of just removing the held spinlock does
> not fit well into the overall lame locking model found in the driver.

   Yet you only try fixing it in the patches #3 and #6. I was talking about
the patches #1 and #4 mostly (#2 and #5 turned out to be non-fixes).

> The thing is that I would prefer to exhibit 'remove custom callbacks'
> side of the changes as it is done now, and fixing severe 'invalid contex'
> bugs is left as a valuable side effect. I may attempt to find enough
> free time to follow your instructions, but frankly speaking I don't
> see it beneficial to split a single good all-sufficient change into
> three or more: removal of spinlocks, replacement of phy_start_aneg(),
> then a non-functional clean-up.
   Yes, I would prefer these step-by-step changes.

> Bikeshedding isn't my preference,

   This is not about bikeshedding. What you are trying to do clearly
violates the 2 basic principles of the kernel development: "don't mix
fixes and enhancements" and "do one thing per patch". 

> but a report about technical flaws related to the published changes
> is appreciated, otherwise let me ask you to accept the changes as is,
> secondary optimizations can be done on top of them.

   No, I'll certainly have to NAK patches #1/#3 in their current form.
I'm yet to review patches #3/#6... anyway, if you lack the time to do things
properly, I'll have to take this burden on my shoulders (giving you credits).
Yet I'm basically is in the same situation as you -- I have to spend my copiuos
free time on the large patch sets (like yours) and I'm still having some cleanups
to sh_eth cooking here (which I'll most probably have to defer)...

> --
> With best wishes,
> Vladimir

MBR, Sergei
