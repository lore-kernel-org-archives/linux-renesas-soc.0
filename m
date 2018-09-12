Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46467 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725738AbeILJ7u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Sep 2018 05:59:50 -0400
Received: by mail-pl1-f193.google.com with SMTP id t19-v6so348512ply.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Sep 2018 21:57:07 -0700 (PDT)
Date: Wed, 12 Sep 2018 10:27:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Biju Das <biju.das@bp.renesas.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-pm@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 10/10] cpufreq: dt: Add support for r8a7744
Message-ID: <20180912045704.alomwjhexxvmgqso@vireshk-i7>
References: <1536660771-32278-1-git-send-email-biju.das@bp.renesas.com>
 <1536660771-32278-11-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1536660771-32278-11-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11-09-18, 11:12, Biju Das wrote:
> Add the compatible strings for supporting the generic cpufreq driver on
> the Renesas RZ/G1N (R8A7744) SoC.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index fe14c57..805f8a0 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -58,6 +58,7 @@ static const struct of_device_id whitelist[] __initconst = {
>  	{ .compatible = "renesas,r8a73a4", },
>  	{ .compatible = "renesas,r8a7740", },
>  	{ .compatible = "renesas,r8a7743", },
> +	{ .compatible = "renesas,r8a7744", },
>  	{ .compatible = "renesas,r8a7745", },
>  	{ .compatible = "renesas,r8a7778", },
>  	{ .compatible = "renesas,r8a7779", },

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
