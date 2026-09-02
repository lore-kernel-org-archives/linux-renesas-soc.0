Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36926468C0A
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Sep 2026 11:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349952; cv=none; b=snl1OgzmLFVk3TmeYcIDhGlM+/CR3uhOWnz4J778j/PsJjshgAsBmb/MGawWTuvXuo4AJjJXKw3N2WoSrF5fBcTcfp72eG3N2l/MwR00oWgJVgbQkLsbpKFtB0t+OSPDuzrcJnI8miM9s9iz8ge3s/NLpueedxpvIIgV+2bWiW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349952; c=relaxed/simple;
	bh=endY7gqq13GqgdJ/KG96fwZoTEb/cAVplHkhFQcBGpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d6MupcNLg0MNbvY3YM/wn15SLr2vIzjXu3Uhu18FlQrCn8wK8SbqIwD6teczFqGVSNBvUZn40BZ8UuENJxCqy/ZNZRJwklnlpr9s2PxW6N/p/1S8U9JO7LrLml/CNJHTdv2umIrsSsCzIilv96lCZs6Ck15O6sjd7H6lt7gh9nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93959320373so79320985a.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Sep 2026 04:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788349938; x=1788954738;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d33A2cRSMy14qLiB29N4dNiBSipjfdSlz1gXIdUUM+M=;
        b=dWQG9w3BUtNwv7MznqpIUi0cILD1tBA2Spi20Uzb0FDgz8liUYJBHaJkuHHs5QBgcp
         02NZNs4GtH1J2/rZCUo75ICc0Yh4HW0ZHILL2QNBHhayU8dajpH5V6Euel5DEdDCyNKl
         5rp7Rr+atjpKfncIn2q3KJs77wnTu2jt7XpqTttD0EfiBNK8aOUv4GszjksVsy0jYun9
         dT0HXNHYHDYv+pBYr+jM4fC8UuVlGrEE5Xz/c389E9fYT9QU1yz+UEBZTmutq6xEzI/k
         t70zkIGFxQHlNJ0aul0lfK3KcWrtqPGzE5VoOYIu50GxRCbtO5U7QPZpTnoRDEyKkydf
         qlYg==
X-Forwarded-Encrypted: i=1; AHgh+Rq3at3ZbwrWcfnwNlYqdbQvWuEhmqgDB/FnW2boEO/SI749D3m9swyXHHs3c/Q0ZYkYARUwHpwfKQGfb6SwP9uotg==@vger.kernel.org
X-Gm-Message-State: AFuF++lwrSPGNuMjNnPGmf4cCXl7tYXNPdhpbDQW3u+gzmxp5NQ1l5Lu
	1E3IOmlfabXS2P3h1vWFZFiAh437Mkzl6hPWEhcmC/erIFpLTSuD0+wzcEcw3smF
X-Gm-Gg: AR+sD12IaO+P8ZNV4MpAvO4JEvVnZyPJTnBE0VwnUUnmv2wbN9DaKDrYphfwmL/usGm
	wkc62M506uG+w3y1pnnvtBD2C4kCJ/WN2AAducRbHQo0t7lPlFMz+ucj4h0SQGx4cRkATOD6KkX
	LLB24IzWd02oPymHo/O/SaVJwP/cgafv5awnhdJw+1m7I9ggVAqnR6hYQYIgA3DOeE2RMN67fKE
	xIJXZ7inz1zQUPN6h8T00+HCID4WVtubYL79xRMhy03UzjVFnD38ucyLimc3IqVztDR2gj3l97f
	/ySipdkVn8qqXSJlUueQmT/uq9bgmadYmWgmwJWqgmde9g+rcv9OCoXn4BB8LqpmQQZQS/wO86r
	1aEnwGTuA4nlXu2sVU85tV1Cj6bb4hyEJHLIqx7QumzJqZt+woyLc8ZTKI4EngbFV4vsKm/rKe2
	4cOnScoQUddfAqPgMwUnsuJWfmUs4MaQDwuLW372ZD+R8fhJtdXT9CZZrXlFc8YFgpoLjGslaZt
	7FH9zkjK5vevhO5Y+oz04jeCPzX1GEwzvO1FMHe
X-Received: by 2002:a05:620a:688e:b0:938:e95e:9377 with SMTP id af79cd13be357-93960fafb8emr538283385a.30.1788349938006;
        Wed, 02 Sep 2026 04:52:18 -0700 (PDT)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f157adesm188102385a.1.2026.09.02.04.52.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 04:52:17 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-936e393176fso81831385a.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Sep 2026 04:52:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrdJf6Y0cWZLjYzuVHX5RmxlEzQFixHCf+286AsevJm5EcLtlPr+mVpdpW2daJenvii5bYDfbisoKkub81wZW6qsw==@vger.kernel.org
X-Received: by 2002:a05:6102:2997:b0:784:a169:194a with SMTP id
 ada2fe7eead31-78a1f437b62mr1623913137.10.1788349475087; Wed, 02 Sep 2026
 04:44:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788338320.git.geert+renesas@glider.be> <619a6e41495adfdae3e2e6c0fee97e0550a5c404.1788338320.git.geert+renesas@glider.be>
In-Reply-To: <619a6e41495adfdae3e2e6c0fee97e0550a5c404.1788338320.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 13:44:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVstZYufZWdD-ajwg74kU6pWtQE3WueCg-XUw9Lye5DAA@mail.gmail.com>
X-Gm-Features: AcwNN1UuztEnaQfQ-OMWO4Fx0VqCWe7sLpxq0iVHzvAi1AhVOPaRJUxDUVxmfIc
Message-ID: <CAMuHMdVstZYufZWdD-ajwg74kU6pWtQE3WueCg-XUw9Lye5DAA@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] reset: Add reset_control_get_from_provider_exclusive()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Saravana Kannan <saravanak@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sept 2026 at 13:30, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> When stacking two reset controllers, the upper one should go through the
> proper channels: request exclusive reset controls and use them via the
> reset_control_*() APIs.  However, unlike the clock subsystem, which has
> of_clk_get_from_provider(), the reset subsystem does not offer a way to
> lookup and obtain a reset from a reset provider.
>
> Hence add a public helper reset_control_get_from_provider_exclusive()
> to lookup and obtain an exclusive reference to a reset controller, based
> on the recently introduced __reset_control_get_from_provider() helper.
> This will be used by the R-Car X5H Module Controller driver.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - Replace reset_controller_get_provider() by
>     reset_control_get_from_provider_exclusive(),
>   - Add kerneldoc,
>
> v2:
>   - No changes.
> ---
>  drivers/reset/core.c  | 37 ++++++++++++++++++++++++++++++++-----
>  include/linux/reset.h |  8 ++++++++
>  2 files changed, 40 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 8af7cd2e8a5029df..6d4c95b3edb18248 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -1141,6 +1141,7 @@ __reset_control_get_from_provider(const struct fwnode_reference_args *args,
>                                   bool gpio_fallback,
>                                   enum reset_control_flags flags)
>  {
> +       struct fwnode_handle *fwnode = consumer ?: args->fwnode;
>         struct reset_control *rstc = ERR_PTR(-EINVAL);
>         struct reset_controller_dev *rcdev;
>         int rstc_id = -EINVAL;
> @@ -1154,18 +1155,26 @@ __reset_control_get_from_provider(const struct fwnode_reference_args *args,
>         if (WARN_ON(args->nargs != rcdev->fwnode_reset_n_cells))
>                 return ERR_PTR(-EINVAL);
>
> -       if (rcdev->of_xlate && is_of_node(consumer)) {
> -               struct device_node *np = to_of_node(consumer);
> +       if (rcdev->of_xlate && is_of_node(fwnode)) {
> +               struct device_node *np = to_of_node(fwnode);
>                 struct of_phandle_args of_args;
>                 int ret;
>
> -               ret = of_parse_phandle_with_args(np,
> +               if (consumer) {
> +                       ret = of_parse_phandle_with_args(np,
>                                          gpio_fallback ? "reset-gpios" : "resets",
>                                          gpio_fallback ? "#gpio-cells" : "#reset-cells",
>                                          gpio_fallback ? 0 : index,
>                                          &of_args);
> -               if (ret)
> -                       return ERR_PTR(ret);
> +                       if (ret)
> +                               return ERR_PTR(ret);
> +               } else {
> +                       of_args.np = of_node_get(np);
> +                       of_args.args_count = args->nargs;
> +
> +                       for (unsigned int i = 0; i < args->nargs; i++)
> +                               of_args.args[i] = args->args[i];
> +               }
>
>                 rstc_id = rcdev->of_xlate(rcdev, &of_args);
>                 of_node_put(of_args.np);
> @@ -1257,6 +1266,24 @@ struct reset_control *__reset_control_get(struct device *dev, const char *id,
>  }
>  EXPORT_SYMBOL_GPL(__reset_control_get);
>
> +/**
> + * reset_control_get_from_provider_exclusive - Lookup and obtain an exclusive
> + *                                            reference to a reset controller.
> + * @args: Reference to the reset controller provider with all the args like
> + *       reset number
> + *
> + * Returns a struct reset_control or IS_ERR() condition containing errno.
> + * If this function is called more than once for the same reset control it will
> + * return -EBUSY.
> + */
> +struct reset_control *
> +reset_control_get_from_provider_exclusive(const struct fwnode_reference_args *args)
> +{
> +       return __reset_control_get_from_provider(args, NULL, 0, false,
> +                                                RESET_CONTROL_EXCLUSIVE);
> +}
> +EXPORT_SYMBOL_GPL(reset_control_get_from_provider_exclusive);
> +
>  int __reset_control_bulk_get(struct device *dev, int num_rstcs,
>                              struct reset_control_bulk_data *rstcs,
>                              enum reset_control_flags flags)
> diff --git a/include/linux/reset.h b/include/linux/reset.h
> index 9c391cf0c82298a0..09ee47b27f88d3b1 100644
> --- a/include/linux/reset.h
> +++ b/include/linux/reset.h
> @@ -90,6 +90,8 @@ struct reset_control *__fwnode_reset_control_get(struct fwnode_handle *fwnode,
>                                      const char *id, int index, enum reset_control_flags flags);
>  struct reset_control *__reset_control_get(struct device *dev, const char *id,
>                                           int index, enum reset_control_flags flags);
> +struct reset_control *reset_control_get_from_provider_exclusive(
> +                               const struct fwnode_reference_args *args);
>  void reset_control_put(struct reset_control *rstc);
>  int __reset_control_bulk_get(struct device *dev, int num_rstcs,
>                              struct reset_control_bulk_data *rstcs,
> @@ -173,6 +175,12 @@ static inline struct reset_control *__reset_control_get(
>         return optional ? NULL : ERR_PTR(-ENOTSUPP);
>  }
>
> +static inline struct reset_control *reset_control_get_from_provider_exclusive(
> +                               const struct fwnode_reference_args *args)
> +{
> +       return NULL;

As reported by Sashiko, this dummy should return ERR_PTR(-ENOTSUPP)
instead.

> +}
> +
>  static inline int
>  reset_control_bulk_reset(int num_rstcs, struct reset_control_bulk_data *rstcs)
>  {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
