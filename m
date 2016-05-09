Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:33686 "EHLO
	mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751252AbcEILIy (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 9 May 2016 07:08:54 -0400
Received: by mail-lf0-f42.google.com with SMTP id y84so196423001lfc.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 May 2016 04:08:53 -0700 (PDT)
Subject: Re: [PATCH 04/10] arm: renesas: r8a7791: Obtain MD pin value using
 boot-mode-reg
To: Dirk Behme <dirk.behme@de.bosch.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org
References: <1462778041-19595-1-git-send-email-dirk.behme@de.bosch.com>
 <1462778041-19595-5-git-send-email-dirk.behme@de.bosch.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <6959335f-9d64-9b1f-affa-8d9367bc4bfe@cogentembedded.com>
Date: Mon, 9 May 2016 14:08:51 +0300
MIME-Version: 1.0
In-Reply-To: <1462778041-19595-5-git-send-email-dirk.behme@de.bosch.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 5/9/2016 10:13 AM, Dirk Behme wrote:

> From: Simon Horman <horms+renesas@verge.net.au>
>
> Use new boot mode reg infrastructure to obtain the mode pin
> value when initialising SMP for r8a7791 SoC.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm/mach-shmobile/smp-r8a7791.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-shmobile/smp-r8a7791.c b/arch/arm/mach-shmobile/smp-r8a7791.c
> index 2d6417a..df784d6 100644
> --- a/arch/arm/mach-shmobile/smp-r8a7791.c
> +++ b/arch/arm/mach-shmobile/smp-r8a7791.c
[...]
> @@ -45,8 +47,17 @@ static void __init r8a7791_smp_prepare_cpus(unsigned int max_cpus)
>  static int r8a7791_smp_boot_secondary(unsigned int cpu,
>  				      struct task_struct *idle)
>  {
> +	int err;
> +	u32 mode;
> +
> +	err = boot_mode_reg_get(&mode);
> +	if (err) {
> +		pr_warn("Unable retrieve boot mode register\n");

    Unable to retrieve?

[...]

MBR, Sergei
