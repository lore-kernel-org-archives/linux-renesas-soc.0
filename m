Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:36735 "EHLO
	mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753268AbcFQP6J (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 17 Jun 2016 11:58:09 -0400
Received: by mail-oi0-f67.google.com with SMTP id d132so14480444oig.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2016 08:58:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1466072862-28030-7-git-send-email-geert+renesas@glider.be>
References: <1466072862-28030-1-git-send-email-geert+renesas@glider.be> <1466072862-28030-7-git-send-email-geert+renesas@glider.be>
From: Ulrich Hecht <ulrich.hecht@gmail.com>
Date: Fri, 17 Jun 2016 17:58:02 +0200
Message-ID: <CAO3366wf2KTgmuO6qOBxOfDHwW8Y8Rpa0eLmPW6rjvBizdWSJg@mail.gmail.com>
Subject: Re: [PATCH v4 06/13] ARM: shmobile: apmu: Move #ifdef CONFIG_SMP to
 cover more functions
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Keita Kobayashi <keita.kobayashi.ym@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-renesas-soc@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jun 16, 2016 at 12:27 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> shmobile_smp_apmu_prepare_cpus() is used only if CONFIG_SMP=y.
>
> Hence move the #ifdef to cover shmobile_smp_apmu_prepare_cpus() and all
> functions only called by it (apmu_init_cpu() and apmu_parse_cfg()).
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v4:
>   - New.
> ---
>  arch/arm/mach-shmobile/platsmp-apmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-shmobile/platsmp-apmu.c b/arch/arm/mach-shmobile/platsmp-apmu.c
> index aba75c89f9c1c5eb..c1558ef0c590dd3e 100644
> --- a/arch/arm/mach-shmobile/platsmp-apmu.c
> +++ b/arch/arm/mach-shmobile/platsmp-apmu.c
> @@ -74,6 +74,7 @@ static int __maybe_unused apmu_wrap(int cpu, int (*fn)(void __iomem *p, int cpu)
>         return p ? fn(p, apmu_cpus[cpu].bit) : -EINVAL;
>  }
>
> +#ifdef CONFIG_SMP
>  static void apmu_init_cpu(struct resource *res, int cpu, int bit)
>  {
>         if ((cpu >= ARRAY_SIZE(apmu_cpus)) || apmu_cpus[cpu].iomem)
> @@ -128,7 +129,6 @@ void __init shmobile_smp_apmu_prepare_cpus(unsigned int max_cpus,
>         apmu_parse_cfg(apmu_init_cpu, apmu_config, num);
>  }
>
> -#ifdef CONFIG_SMP
>  int shmobile_smp_apmu_boot_secondary(unsigned int cpu, struct task_struct *idle)
>  {
>         /* For this particular CPU register boot vector */
> --
> 1.9.1
>

Reviewed-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

CU
Uli
