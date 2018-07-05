Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f67.google.com ([209.85.213.67]:35311 "EHLO
        mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752851AbeGEHVb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Jul 2018 03:21:31 -0400
MIME-Version: 1.0
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
In-Reply-To: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Jul 2018 09:21:19 +0200
Message-ID: <CAMuHMdXd2MUbXj5Rqq9O8DXDAyVuGd+_nkKUh1aFYOkMzSGT6A@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] ravb/sh_eth: fix sleep in atomic by reusing
 shared ethtool handlers
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew@lunn.ch>, netdev <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Vladimir,

On Wed, Jul 4, 2018 at 10:13 AM Vladimir Zapolskiy
<vladimir_zapolskiy@mentor.com> wrote:
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
>
> Changes from v1 to v2:
> * the original patches are split to bugfixes and enhancements only,
>   both v1 and v2 series are absolutely equal in total, thus I omit
>   description of changes in individual patches,
> * the latter implies that there should be no strict need for retesting,
>   but because formally two series are different, I have to drop the tags
>   given by Geert and Andrew, please send your tags again.

Thank for your series!

I've retested this on both R-Car M2-W (sh_eth) and R-Car H3 ES2.0 (ravb),
and the BUG disappeared.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
