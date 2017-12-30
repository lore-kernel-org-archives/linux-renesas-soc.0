Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:40393 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750920AbdL3Arf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Dec 2017 19:47:35 -0500
MIME-Version: 1.0
In-Reply-To: <1514547423-18965-4-git-send-email-ulf.hansson@linaro.org>
References: <1514547423-18965-1-git-send-email-ulf.hansson@linaro.org> <1514547423-18965-4-git-send-email-ulf.hansson@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Sat, 30 Dec 2017 01:47:34 +0100
Message-ID: <CAJZ5v0hoakc1_CwFXu5EE8SU8NstVv2aod+qpb4w4gjHE81X4A@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] PM / Domains: Take WAKEUP_PATH driver flag into
 account in genpd
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Linux PM <linux-pm@vger.kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Dec 29, 2017 at 12:37 PM, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> In case the WAKEUP_PATH flag has been set in a later phase than from the
> ->suspend() callback, the PM core don't set the ->power.wakeup_path status
> flag for the device. Therefore, let's be safe and check it explicitly.
>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/base/power/domain.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
> index f9dcc98..32b4ba7 100644
> --- a/drivers/base/power/domain.c
> +++ b/drivers/base/power/domain.c
> @@ -1038,7 +1038,9 @@ static int genpd_finish_suspend(struct device *dev, bool poweroff)
>         if (IS_ERR(genpd))
>                 return -EINVAL;
>
> -       if (dev->power.wakeup_path && genpd_is_active_wakeup(genpd))
> +       if ((dev->power.wakeup_path ||
> +           dev_pm_test_driver_flags(dev, DPM_FLAG_WAKEUP_PATH)) &&

Shouldn't dev->power.wakeup_path be always set if DPM_FLAG_WAKEUP_PATH
is set as per the second patch in the series?

> +           genpd_is_active_wakeup(genpd))
>                 return 0;
>
>         if (poweroff)
> @@ -1093,7 +1095,9 @@ static int genpd_resume_noirq(struct device *dev)
>         if (IS_ERR(genpd))
>                 return -EINVAL;
>
> -       if (dev->power.wakeup_path && genpd_is_active_wakeup(genpd))
> +       if ((dev->power.wakeup_path ||
> +           dev_pm_test_driver_flags(dev, DPM_FLAG_WAKEUP_PATH)) &&
> +           genpd_is_active_wakeup(genpd))
>                 return 0;
>
>         genpd_lock(genpd);
> --
> 2.7.4
>
