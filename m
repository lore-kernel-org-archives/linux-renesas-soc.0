Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:41601 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1031974AbeEXQkG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 May 2018 12:40:06 -0400
Received: by mail-wr0-f196.google.com with SMTP id u12-v6so4284828wrn.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 May 2018 09:40:06 -0700 (PDT)
Subject: Re: [PATCH 0/6] ravb/sh_eth: fix sleep in atomic by reusing shared
 ethtool handlers
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1527160318-10958-1-git-send-email-vladimir_zapolskiy@mentor.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <6ffa0c08-2210-379c-50f0-d5bf43ab569e@cogentembedded.com>
Date: Thu, 24 May 2018 19:40:03 +0300
MIME-Version: 1.0
In-Reply-To: <1527160318-10958-1-git-send-email-vladimir_zapolskiy@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05/24/2018 02:11 PM, Vladimir Zapolskiy wrote:

> For ages trivial changes to RAVB and SuperH ethernet links by means of
> standard 'ethtool' trigger a 'sleeping function called from invalid
> context' bug, to visualize it on r8a7795 ULCB:
> 
>   % ethtool -r eth0
>   BUG: sleeping function called from invalid context at kernel/locking/mutex.c:747
>   in_atomic(): 1, irqs_disabled(): 128, pid: 554, name: ethtool
>   INFO: lockdep is turned off.
>   irq event stamp: 0
>   hardirqs last  enabled at (0): [<0000000000000000>]           (null)
>   hardirqs last disabled at (0): [<ffff0000080e1d3c>] copy_process.isra.7.part.8+0x2cc/0x1918
>   softirqs last  enabled at (0): [<ffff0000080e1d3c>] copy_process.isra.7.part.8+0x2cc/0x1918
>   softirqs last disabled at (0): [<0000000000000000>]           (null)
>   CPU: 5 PID: 554 Comm: ethtool Not tainted 4.17.0-rc4-arm64-renesas+ #33
>   Hardware name: Renesas H3ULCB board based on r8a7795 ES2.0+ (DT)
>   Call trace:
>    dump_backtrace+0x0/0x198
>    show_stack+0x24/0x30
>    dump_stack+0xb8/0xf4
>    ___might_sleep+0x1c8/0x1f8
>    __might_sleep+0x58/0x90
>    __mutex_lock+0x50/0x890
>    mutex_lock_nested+0x3c/0x50
>    phy_start_aneg_priv+0x38/0x180
>    phy_start_aneg+0x24/0x30
>    ravb_nway_reset+0x3c/0x68
>    dev_ethtool+0x3dc/0x2338
>    dev_ioctl+0x19c/0x490
>    sock_do_ioctl+0xe0/0x238
>    sock_ioctl+0x254/0x460
>    do_vfs_ioctl+0xb0/0x918
>    ksys_ioctl+0x50/0x80
>    sys_ioctl+0x34/0x48
>    __sys_trace_return+0x0/0x4
> 
> The root cause is that an attempt to modify ECMR and GECMR registers
> only when RX/TX function is disabled was too overcomplicated in its
> original implementation, also processing of an optional Link Change
> interrupt added even more complexity, as a result the implementation
> was error prone.
> 
> The new locking scheme is confirmed to be correct by dumping driver
> specific and generic PHY framework function calls with aid of ftrace
> while running more or less advanced tests.
> 
> Please note that sh_eth patches from the series were built-tested only.
> 
> On purpose I do not add Fixes tags, the reused PHY handlers were added
> way later than the fixed problems were firstly found in the drivers.

   I think you went one step too far with these fixes. On the first glance,
the real fixes are to remove grabbing/releasing the spinlock for the duration
of the phylib calls. Am I right? If so, making use of the new phylib APIs
would be a further enhancement, it's not needed for fixing the splats per se...

MBR, Sergei
