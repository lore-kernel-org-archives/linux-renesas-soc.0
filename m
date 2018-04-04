Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp1.de.adit-jv.com ([62.225.105.245]:46768 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751749AbeDDVUc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Apr 2018 17:20:32 -0400
Date: Wed, 4 Apr 2018 23:20:18 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
CC: <linux-i2c@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH] i2c: rcar: initialize earlier using subsys_initcall()
Message-ID: <20180404212018.GA29865@vmlxhi-102.adit-jv.com>
References: <1521197932-2073-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <20180403155524.f7bjynyrr2uaxbvb@ninjato>
 <a3d7b5d2-3a1c-7bc6-dc5c-4dc4d658ba40@mentor.com>
 <20180403170829.iaieac5wk4hkleme@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180403170829.iaieac5wk4hkleme@ninjato>
To: unlisted-recipients:; (no To-header on input)
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Wolfram, Vladimir,

Thanks for your precious inputs.

I think you outlined two topics in your comments (based on the
description submitted with the patch). One (primary?) is related to
async probing and one (secondary, but still interesting) is related to
the minor (~7ms -> ~1ms) startup improvement of the rcar-i2c driver.

I did a little bit of research to understand what's behind the startup
improvement (hoping it is simpler to explain) and I think I reached some
conclusions. I used vanilla v4.16 kernel/defconfig/dtb and the
h3-es20-salvator-X target. The only configuration change was to enable
CONFIG_DEBUG_DRIVER and to increase CONFIG_LOG_BUF_SHIFT from 17 to 22
to avoid overwriting the printk buffer. Kernel was boot-ed "quiet"-ly.

With this HW/SW setup, I am able to confirm (based on 5 dmesg logs with
and w/o the submitted patch) that:

[1] W/o the submitted patch, rcar_i2c_driver_init takes around 7092 us
[2] With the submitted patch, rcar_i2c_driver_init takes around 1241 us

Comparing the <CONTENTS> marked below in the two cases:
   calling  rcar_i2c_driver_init
   <CONTENTS>
   initcall rcar_i2c_driver_init+0x0/0x20 returned 0 after X us

I notice that w/o the proposed patch, <CONTENTS> is consistently more
rich, containing output related to additional three drivers:
* cs2000-cp
* rcar-dmac
* ohci-platform

These additional lines cumulatively consume around 5-6 ms, which
is exactly the difference between [1] and [2] seen above.

To explain why these lines are present in [1], but not in [2], I checked
the order of initialization of the mentioned drivers. Here is what I see:

[11] W/o the submitted patch (in the order of execution):
Initcall                Time (us)
cs2000_driver_init         30
rcar_dmac_driver_init    8107
ohci_platform_init     178199
rcar_i2c_driver_init     7092
                 SUM   193428

[22] With the submitted patch (in the order of execution):
Initcall                Time (us)
rcar_i2c_driver_init     1241
cs2000_driver_init       5667
rcar_dmac_driver_init    8160
ohci_platform_init     178110
                SUM    193178

So, the idea is that the startup improvement of rcar_i2c_driver_init()
comes at the cost of a slower cs2000_driver_init(). In the end,
there is no benefit and this doesn't work as an argument why the patch
should go upstream.

With regard to the primary argument, that the proposed patch
reduces/minimizes the boot time variance when switching certain drivers
like rcar-du from synchronous to asynchronous probing, I can clearly
sense this in my measurements, but I'm afraid I won't be able to provide
a simple and comprehensive explanation why this happens, since we
enter the territory of concurrent/parallel driver initialization.

If evidence in the form of measurements showing improved behavior
is not enough for the patch to be accepted, then we have no choice but
to keep the patch out-of-tree as a "workaround", hoping that we'll be able
to come up with a better/cleaner solution in future.

If you ever stumble upon a mailing list discussing how to "stabilize"
the boot time as a consequence of using asynchronous probing, then
please drop a link and this will be appreciated.

Many thanks,
Eugeniu.
