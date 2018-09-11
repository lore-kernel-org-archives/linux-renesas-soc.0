Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:44239 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726601AbeIKP6O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Sep 2018 11:58:14 -0400
MIME-Version: 1.0
References: <1536660771-32278-1-git-send-email-biju.das@bp.renesas.com> <1536660771-32278-11-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1536660771-32278-11-git-send-email-biju.das@bp.renesas.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 11 Sep 2018 12:59:13 +0200
Message-ID: <CAJZ5v0j_oiTuuGvZDH=GRvtbW+KAUu4BC-3bRNFKGtJ7SDhnQg@mail.gmail.com>
Subject: Re: [PATCH 10/10] cpufreq: dt: Add support for r8a7744
To: biju.das@bp.renesas.com
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris.Paterson2@renesas.com, fabrizio.castro@bp.renesas.com,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 11, 2018 at 12:20 PM Biju Das <biju.das@bp.renesas.com> wrote:
>
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
>         { .compatible = "renesas,r8a73a4", },
>         { .compatible = "renesas,r8a7740", },
>         { .compatible = "renesas,r8a7743", },
> +       { .compatible = "renesas,r8a7744", },
>         { .compatible = "renesas,r8a7745", },
>         { .compatible = "renesas,r8a7778", },
>         { .compatible = "renesas,r8a7779", },
> --

Since this is the last patch in a series of 10, do you want me to
apply it or should it go in along with the rest?

Thanks,
Rafael
