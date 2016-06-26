Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:35144 "EHLO
	mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751842AbcFZQhC (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sun, 26 Jun 2016 12:37:02 -0400
Received: by mail-lf0-f48.google.com with SMTP id l188so141816735lfe.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 26 Jun 2016 09:37:01 -0700 (PDT)
Subject: Re: [PATCH v4 07/13] ARM: shmobile: apmu: Add APMU DT support via
 Enable method
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1466072862-28030-1-git-send-email-geert+renesas@glider.be>
 <1466072862-28030-8-git-send-email-geert+renesas@glider.be>
 <b524c939-d546-65b8-72da-359136c2aebe@cogentembedded.com>
 <CAMuHMdWrwnNxfAh-AHA+Q5AfgYy89nmj-yVSj-E4jMx5cHYi3g@mail.gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Keita Kobayashi <keita.kobayashi.ym@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Magnus Damm <damm+renesas@opensource.se>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <cf46c1dc-5ccd-fa5f-d2c6-321b284e35eb@cogentembedded.com>
Date: Sun, 26 Jun 2016 19:36:57 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWrwnNxfAh-AHA+Q5AfgYy89nmj-yVSj-E4jMx5cHYi3g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 06/24/2016 10:44 AM, Geert Uytterhoeven wrote:

>>> From: Magnus Damm <damm+renesas@opensource.se>
>>> Allow DT configuration of the APMU hardware in the case when the APMU is
>>> pointed out in the DTB via the enable-method. The ability to configure
>>> the APMU via C code is still kept intact to prevent DTB breakage for older
>>> SoCs that do not rely on the enable-method for SMP support.
>>>
>>> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>>> [geert: Fix CONFIG_SMP=n build]
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>> [...]
>>
>>> diff --git a/arch/arm/mach-shmobile/platsmp-apmu.c
>>> b/arch/arm/mach-shmobile/platsmp-apmu.c
>>> index c1558ef0c590dd3e..0c6bb458b7a45128 100644
>>> --- a/arch/arm/mach-shmobile/platsmp-apmu.c
>>> +++ b/arch/arm/mach-shmobile/platsmp-apmu.c
>>
>> [...]
>>>
>>> +static int shmobile_smp_apmu_boot_secondary_md21(unsigned int cpu,
>>> +                                                struct task_struct *idle)
>>> +{
>>> +       /* Error out when hardware debug mode is enabled */
>>> +       if (rcar_gen2_read_mode_pins() & BIT(21)) {
>>> +               pr_warn("Unable to boot CPU%u when MD21 is set\n", cpu);
>>> +               return -ENOTSUPP;
>>> +       }
>>> +
>>> +       return shmobile_smp_apmu_boot_secondary(cpu, idle);
>>> +}
>>> +
>>> +static struct smp_operations apmu_smp_ops __initdata = {
>>> +       .smp_prepare_cpus       = shmobile_smp_apmu_prepare_cpus_dt,
>>> +       .smp_boot_secondary     = shmobile_smp_apmu_boot_secondary_md21,
>>> +#ifdef CONFIG_HOTPLUG_CPU
>>> +       .cpu_can_disable        = shmobile_smp_cpu_can_disable,
>>> +       .cpu_die                = shmobile_smp_apmu_cpu_die,
>>> +       .cpu_kill               = shmobile_smp_apmu_cpu_kill,
>>>  #endif
>>
>>
>>    For the record: it turned out that I tested my non-DT SMP on
>> R8A7792/Blanche with MD21 bit set. And I've just made sure it still works
>> with this implementation (by commenting out the check above.
>>    Also, I was going to try the workaround for MD21 I saw in the BSP tree --

> Which workaround? I only saw the BSP removed the check, but it didn't mention
> why (because E2 and V2H don't need it, or...?).

    I'm looking at the <soc>_smp_prepare_cpus() in 
arch/arm/mach-shmobile/setup-<soc>.c in the 
'bsp/v3.10.31-ltsi/rcar-gen2-1.9.6' branch of Simon's renesas-backport.git. 
The all have the code to handle MD21 bit set (by setting some bits in 
CA{7,15}DBGRCR.

>> perhaps it'll help get R8A7791 working w/MD21 set...
>
> Does your Porter work with the other MD21 setting (and the check commented
> out, of coutse)?

    Yes, I've made sure it works now.

> Gr{oetje,eeting}s,
>
>                         Geert

MBR, Sergei
