Return-Path: <SRS0=SaFT=QM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA010C282D7
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 08:10:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 798912145D
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 08:10:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="eXC0ehae"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728192AbfBEIKd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Feb 2019 03:10:33 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:40347 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728181AbfBEIKb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Feb 2019 03:10:31 -0500
Received: by mail-ua1-f66.google.com with SMTP id n7so844064uao.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Feb 2019 00:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i0j1f/7ELLhI89wgaZXD9QSuujo2YuCpG10Bl7Mn71Y=;
        b=eXC0ehaeA5Xz0wOqIgKHsZV4s3GVAREioJmEUCemm9BTlCyF2DzpzrR8201tipR1+q
         7jMYoR+O4W8Bpymd/ypX3S8dO8Lv/nDQeb40omhPIMaqf1xLw32q1y9IbwIuWbl2gfGV
         JEcBbjd7AqnT+AKHdWT5WvupQUVcSWFnfX0Ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i0j1f/7ELLhI89wgaZXD9QSuujo2YuCpG10Bl7Mn71Y=;
        b=GwHJ8kwIVmK+kGRsnqUKwVNMLMKvqniygmX2x536Da93iVkOfS/oxm1NFRcuFoO+Ps
         5rgcXQ6adn3hrdCNTK06MVD+fItZtztjQmdrhRwKPun0BhUHmnfrERPK0yhuR7CyK5jh
         ttLYA0hBpE/QHNkdEjnq/MacWjDTZcwlHhf+EGH74MPITCy+/nqx0HtBSNQqPYS2L+nZ
         T5tiK3SNAz6kXA7d/4r9LrhesymV6u0SHyerHqPeHBDCflCWsWeAQWmrPSJwfaNbac0y
         LNXYsC69BT+yq9nzjUk7cPCI+J0NPqHqqXjYLmIk+gbnxRV2Y+XDwnhb3XKxdbT/+ZBL
         BCGA==
X-Gm-Message-State: AHQUAuaSnjGDWh+9iEbgjUYekeyTb1OlXnkpRvl3Klsr0IP/tTn5dnCW
        c9PsYue7/WtVz7lv1LSGG9GNrYM3y4SDErJ22oy5mg==
X-Google-Smtp-Source: AHgI3IbVvZx/jLvXMDvjzGiW8jzC0rA+HNa8/r+YA/SdzydQDZftHCs6Qx0Ak5BKmzHgFg2Pyg2VcQ6C5WIqCJJmYgo=
X-Received: by 2002:a9f:2244:: with SMTP id 62mr1331326uad.119.1549354230688;
 Tue, 05 Feb 2019 00:10:30 -0800 (PST)
MIME-Version: 1.0
References: <1549297553-17647-1-git-send-email-vincent.guittot@linaro.org> <1549297553-17647-3-git-send-email-vincent.guittot@linaro.org>
In-Reply-To: <1549297553-17647-3-git-send-email-vincent.guittot@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 5 Feb 2019 09:09:54 +0100
Message-ID: <CAPDyKFqNgnvHM0hpgzy-oY+oj0_q72LDybgZJ5r8BugDM97Oqg@mail.gmail.com>
Subject: Re: [PATCH 2/2] PM-runtime: update time accounting only when enabled
To:     Vincent Guittot <vincent.guittot@linaro.org>
Cc:     Linux PM <linux-pm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 4 Feb 2019 at 17:26, Vincent Guittot <vincent.guittot@linaro.org> wrote:
>
> Update accounting_timestamp field only when PM runtime is enable
> and don't forget to account the last state before disabling it.
>
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
>  drivers/base/power/runtime.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index 50740da..ed62cca 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -66,11 +66,14 @@ static int rpm_suspend(struct device *dev, int rpmflags);
>   */
>  void update_pm_runtime_accounting(struct device *dev)
>  {
> -       u64 now = ktime_get_mono_fast_ns();
> -       u64 last = dev->power.accounting_timestamp;
> -       u64 delta;
> +       u64 now, last, delta;
>
> -       dev->power.accounting_timestamp = now;
> +       if (dev->power.disable_depth > 0)
> +               return;
> +
> +       last = dev->power.accounting_timestamp;
> +
> +       dev->power.accounting_timestamp = now = ktime_get_mono_fast_ns();
>
>         /*
>          * Because ktime_get_mono_fast_ns() is not monotonic during
> @@ -82,9 +85,6 @@ void update_pm_runtime_accounting(struct device *dev)
>
>         delta = now - last;
>
> -       if (dev->power.disable_depth > 0)
> -               return;
> -
>         if (dev->power.runtime_status == RPM_SUSPENDED)
>                 dev->power.suspended_time += delta;
>         else
> @@ -1298,6 +1298,9 @@ void __pm_runtime_disable(struct device *dev, bool check_resume)
>                 pm_runtime_put_noidle(dev);
>         }
>
> +       /* Update time accounting before disabling pm runtime */
> +       update_pm_runtime_accounting(dev);
> +
>         if (!dev->power.disable_depth++)
>                 __pm_runtime_barrier(dev);
>
> @@ -1521,7 +1524,6 @@ void pm_runtime_init(struct device *dev)
>         dev->power.request_pending = false;
>         dev->power.request = RPM_REQ_NONE;
>         dev->power.deferred_resume = false;
> -       dev->power.accounting_timestamp = 0;
>         INIT_WORK(&dev->power.work, pm_runtime_work);
>
>         dev->power.timer_expires = 0;
> --
> 2.7.4
>
