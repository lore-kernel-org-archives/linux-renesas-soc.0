Return-Path: <SRS0=dpDL=QG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC52C282D7
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jan 2019 12:15:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 712B520882
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jan 2019 12:15:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="UxVzKZW5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbfA3MPX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 30 Jan 2019 07:15:23 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:46851 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726857AbfA3MPX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jan 2019 07:15:23 -0500
Received: by mail-vs1-f66.google.com with SMTP id n10so14072380vso.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Jan 2019 04:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yhJIweRM2BZxSTmYhsNSrIUGbPfdVazOuW402hLMoKk=;
        b=UxVzKZW5aZmGz307vl6v9NV3GscZ6l+KqNMlR4pyFyllXfciQTJVBcUk5h5bYcBl2o
         4FoAQcQVPzqt2J4W1rJCI7kMllk5fvaQda0yYh0dSlJaUu6dN/vHnE5/3NmmEUv4Qp+T
         /7O9TbFkTvwQYZVSIfxeTVDLR/YIO3N9wCGss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yhJIweRM2BZxSTmYhsNSrIUGbPfdVazOuW402hLMoKk=;
        b=Fp8jWpRscRT1fyC4de3mKjR3nuaXadvF4KZkZmNoNhTZ8psAa5jpcnTCKfxq6mrVCd
         qfbnDPxV7YokXQq2oaJvw8EnCSbtIn/37B0VKaJTSHu6uDNhKV3vYJa7V+EcRcvTJRiI
         uPxDZZdHtbKTnlmFs6WFLGE+lz5Rq9CErgq3CEuHRP+gjxAv04M8voCMl+JaGZ17Jdd3
         yCkZnsGRaMN7an+4ysq62hHjW++ryqGYdPmHLthhSS6KU/0RnrVrfnGFaTW5ya8Cjbs2
         VuqkIpnoE3Hffpp4zlL/dZL0lPqPH7Bo7oYerchIJ49Lntty3ilsdtqkgEwYZ84E5yM+
         fI/A==
X-Gm-Message-State: AJcUukf+VUoxiUf8oRg5I/EbZfaunHk1X0/U1VbvZJzKVCv5mTZIiVTD
        Ezv9IGmK9uBg+hElRftSMFKXxhlCFDuLArka39F/Ug==
X-Google-Smtp-Source: ALg8bN5QbH0Ql4qXN7O9XHvt/0NWaNloJutDmm0PPaU0Qp8kFtS2lvjorhUfQWeYhGA7xuldxvOFgabR9w6eokQLpP8=
X-Received: by 2002:a67:b245:: with SMTP id s5mr12414544vsh.200.1548850522081;
 Wed, 30 Jan 2019 04:15:22 -0800 (PST)
MIME-Version: 1.0
References: <1548846984-2044-1-git-send-email-vincent.guittot@linaro.org>
In-Reply-To: <1548846984-2044-1-git-send-email-vincent.guittot@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 30 Jan 2019 13:14:46 +0100
Message-ID: <CAPDyKFpyg7oGoDZA+=SG7R3yL874Geeqs5LWrsAf50csxsE05A@mail.gmail.com>
Subject: Re: [PATCH v2 ] PM-runtime: fix deadlock with ktime
To:     Vincent Guittot <vincent.guittot@linaro.org>
Cc:     Linux PM <linux-pm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Biju Das <biju.das@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 30 Jan 2019 at 12:16, Vincent Guittot
<vincent.guittot@linaro.org> wrote:
>
> A deadlock has been seen when swicthing clocksources which use PM runtime.
> The call path is:
> change_clocksource
>     ...
>     write_seqcount_begin
>     ...
>     timekeeping_update
>         ...
>         sh_cmt_clocksource_enable
>             ...
>             rpm_resume

Hmm, isn't this already a problem in genpd then?

In genpd's ->runtime_resume() callback (genpd_runtime_resume()) we
call ktime_get() to measure the latency of running the callback.

Or, perhaps irq_safe_dev_in_no_sleep_domain() returns true for the
genpd + device in question, which means the ktime thingy is skipped.

Geert?


>                 pm_runtime_mark_last_busy
>                     ktime_get
>                         do
>                             read_seqcount_begin
>                         while read_seqcount_retry
>     ....
>     write_seqcount_end
>
> Although we should be safe because we haven't yet changed the clocksource
> at that time, we can't because of seqcount protection.
>
> Use ktime_get_mono_fast_ns() instead which is lock safe for such case
>
> With ktime_get_mono_fast_ns, the timestamp is not guaranteed to be
> monotonic across an update and as a result can goes backward. According to
> update_fast_timekeeper() description: "In the worst case, this can
> result is a slightly wrong timestamp (a few nanoseconds)". For
> PM runtime autosuspend, this means only that the suspend decision can
> be slightly sub optimal.
>
> Fixes: 8234f6734c5d ("PM-runtime: Switch autosuspend over to using hrtimers")
> Reported-by: Biju Das <biju.das@bp.renesas.com>
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>
> - v2: Updated commit message to explain the impact of using
>   ktime_get_mono_fast_ns()
>
>  drivers/base/power/runtime.c | 10 +++++-----
>  include/linux/pm_runtime.h   |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index 457be03..708a13f 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -130,7 +130,7 @@ u64 pm_runtime_autosuspend_expiration(struct device *dev)
>  {
>         int autosuspend_delay;
>         u64 last_busy, expires = 0;
> -       u64 now = ktime_to_ns(ktime_get());
> +       u64 now = ktime_get_mono_fast_ns();
>
>         if (!dev->power.use_autosuspend)
>                 goto out;
> @@ -909,7 +909,7 @@ static enum hrtimer_restart  pm_suspend_timer_fn(struct hrtimer *timer)
>          * If 'expires' is after the current time, we've been called
>          * too early.
>          */
> -       if (expires > 0 && expires < ktime_to_ns(ktime_get())) {
> +       if (expires > 0 && expires < ktime_get_mono_fast_ns()) {
>                 dev->power.timer_expires = 0;
>                 rpm_suspend(dev, dev->power.timer_autosuspends ?
>                     (RPM_ASYNC | RPM_AUTO) : RPM_ASYNC);
> @@ -928,7 +928,7 @@ static enum hrtimer_restart  pm_suspend_timer_fn(struct hrtimer *timer)
>  int pm_schedule_suspend(struct device *dev, unsigned int delay)
>  {
>         unsigned long flags;
> -       ktime_t expires;
> +       u64 expires;
>         int retval;
>
>         spin_lock_irqsave(&dev->power.lock, flags);
> @@ -945,8 +945,8 @@ int pm_schedule_suspend(struct device *dev, unsigned int delay)
>         /* Other scheduled or pending requests need to be canceled. */
>         pm_runtime_cancel_pending(dev);
>
> -       expires = ktime_add(ktime_get(), ms_to_ktime(delay));
> -       dev->power.timer_expires = ktime_to_ns(expires);
> +       expires = ktime_get_mono_fast_ns() + (u64)delay * NSEC_PER_MSEC);
> +       dev->power.timer_expires = expires;
>         dev->power.timer_autosuspends = 0;
>         hrtimer_start(&dev->power.suspend_timer, expires, HRTIMER_MODE_ABS);
>
> diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
> index 54af4ee..fed5be7 100644
> --- a/include/linux/pm_runtime.h
> +++ b/include/linux/pm_runtime.h
> @@ -105,7 +105,7 @@ static inline bool pm_runtime_callbacks_present(struct device *dev)
>
>  static inline void pm_runtime_mark_last_busy(struct device *dev)
>  {
> -       WRITE_ONCE(dev->power.last_busy, ktime_to_ns(ktime_get()));
> +       WRITE_ONCE(dev->power.last_busy, ktime_get_mono_fast_ns());
>  }
>
>  static inline bool pm_runtime_is_irq_safe(struct device *dev)
> --
> 2.7.4
>
