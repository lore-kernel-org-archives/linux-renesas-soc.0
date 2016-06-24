Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:36538 "EHLO
	mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750972AbcFXHoc (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 24 Jun 2016 03:44:32 -0400
Received: by mail-it0-f67.google.com with SMTP id h190so1377623ith.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Jun 2016 00:44:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <b524c939-d546-65b8-72da-359136c2aebe@cogentembedded.com>
References: <1466072862-28030-1-git-send-email-geert+renesas@glider.be>
 <1466072862-28030-8-git-send-email-geert+renesas@glider.be> <b524c939-d546-65b8-72da-359136c2aebe@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Jun 2016 09:44:30 +0200
Message-ID: <CAMuHMdWrwnNxfAh-AHA+Q5AfgYy89nmj-yVSj-E4jMx5cHYi3g@mail.gmail.com>
Subject: Re: [PATCH v4 07/13] ARM: shmobile: apmu: Add APMU DT support via
 Enable method
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
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
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Tue, Jun 21, 2016 at 7:49 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 06/16/2016 01:27 PM, Geert Uytterhoeven wrote:
>> From: Magnus Damm <damm+renesas@opensource.se>
>> Allow DT configuration of the APMU hardware in the case when the APMU is
>> pointed out in the DTB via the enable-method. The ability to configure
>> the APMU via C code is still kept intact to prevent DTB breakage for older
>> SoCs that do not rely on the enable-method for SMP support.
>>
>> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>> [geert: Fix CONFIG_SMP=n build]
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> [...]
>
>> diff --git a/arch/arm/mach-shmobile/platsmp-apmu.c
>> b/arch/arm/mach-shmobile/platsmp-apmu.c
>> index c1558ef0c590dd3e..0c6bb458b7a45128 100644
>> --- a/arch/arm/mach-shmobile/platsmp-apmu.c
>> +++ b/arch/arm/mach-shmobile/platsmp-apmu.c
>
> [...]
>>
>> +static int shmobile_smp_apmu_boot_secondary_md21(unsigned int cpu,
>> +                                                struct task_struct *idle)
>> +{
>> +       /* Error out when hardware debug mode is enabled */
>> +       if (rcar_gen2_read_mode_pins() & BIT(21)) {
>> +               pr_warn("Unable to boot CPU%u when MD21 is set\n", cpu);
>> +               return -ENOTSUPP;
>> +       }
>> +
>> +       return shmobile_smp_apmu_boot_secondary(cpu, idle);
>> +}
>> +
>> +static struct smp_operations apmu_smp_ops __initdata = {
>> +       .smp_prepare_cpus       = shmobile_smp_apmu_prepare_cpus_dt,
>> +       .smp_boot_secondary     = shmobile_smp_apmu_boot_secondary_md21,
>> +#ifdef CONFIG_HOTPLUG_CPU
>> +       .cpu_can_disable        = shmobile_smp_cpu_can_disable,
>> +       .cpu_die                = shmobile_smp_apmu_cpu_die,
>> +       .cpu_kill               = shmobile_smp_apmu_cpu_kill,
>>  #endif
>
>
>    For the record: it turned out that I tested my non-DT SMP on
> R8A7792/Blanche with MD21 bit set. And I've just made sure it still works
> with this implementation (by commenting out the check above.
>    Also, I was going to try the workaround for MD21 I saw in the BSP tree --

Which workaround? I only saw the BSP removed the check, but it didn't mention
why (because E2 and V2H don't need it, or...?).

> perhaps it'll help get R8A7791 working w/MD21 set...

Does your Porter work with the other MD21 setting (and the check commented
out, of coutse)?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
