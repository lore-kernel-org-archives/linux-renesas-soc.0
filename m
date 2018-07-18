Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:46511 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbeGRHwb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jul 2018 03:52:31 -0400
Received: by mail-vk0-f66.google.com with SMTP id b14-v6so1948852vke.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Jul 2018 00:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <1530874968-5960-1-git-send-email-sudeep.holla@arm.com>
 <1530874968-5960-6-git-send-email-sudeep.holla@arm.com> <CAMuHMdXw9My+P1UCJ19Qdjq4O9gY_0QVFZaw6C5Ytmpyac59Vw@mail.gmail.com>
 <20180717140536.GA27323@e107155-lin> <CAMuHMdUnL=XyoSfRU+ebVUjsiP89V4vcoN=O4xc0VwHmLP72HA@mail.gmail.com>
 <1c47b3fd-59ba-aba4-43b2-ed98e750887b@arm.com> <5a23f1c8-27cb-b09c-90fc-edab3eec99f9@arm.com>
 <20180717170121.GA14049@e107155-lin>
In-Reply-To: <20180717170121.GA14049@e107155-lin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Jul 2018 09:15:54 +0200
Message-ID: <CAMuHMdWv4BjXshBbqacebjbOz2eQM=1cBSjit8c2p7dmQP4ZxA@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] arm64: smp: remove cpu and numa topology
 information when hotplugging out CPU
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Hanjun Guo <hanjun.guo@linaro.org>,
        ganapatrao.kulkarni@cavium.com, morten.rasmussen@arm.com,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sudeep,

On Tue, Jul 17, 2018 at 7:02 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> On Tue, Jul 17, 2018 at 04:55:22PM +0100, Sudeep Holla wrote:
> > Going through the code again, I think I understand the problem here.
> > We use the topology_core_mask pointers which are stashed in cpu_groups[]
> > But, the cpumask themselves will be getting modified as the cpus go up
> > and down, so we need to make a copy instead of just using the pointer.
> > I will see what we can do to fix that.
>
> This is what I could come up with. I haven't tested this but just compiled
> it. Let me know if this resolves the issue.

Thanks, it did!

> From: Sudeep Holla <sudeep.holla@arm.com>
> Date: Tue, 17 Jul 2018 17:45:20 +0100
> Subject: [PATCH] drivers/firmware: psci_checker: stash and use topology_core_cpumask for hotplug tests
>
> Commit 7f9545aa1a91 ("arm64: smp: remove cpu and numa topology information
> when hotplugging out CPU") updates the cpu topology when the CPU is
> hotplugged out. However the PSCI checker code uses the topology_core_cpumask
> pointers for some of the cpu hotplug testing. Since the pointer to the
> core_cpumask of the first CPU in the group is used, which when that CPU
> itself is hotpugged out is just set to itself, the testing terminates
> after that particular CPU is tested out. But the intention of this tests
> is to cover all the CPU in the group.
>
> In order to support that, we need to stash the topology_core_cpumask
> before the start of the test and use that value instead of pointer to a
> cpumask which will be updated on CPU hotplug.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Fixes: 7f9545aa1a91a9a4 ("arm64: smp: remove cpu and numa topology
information when hotplugging out CPU")
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
