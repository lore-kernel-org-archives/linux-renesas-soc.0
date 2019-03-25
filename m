Return-Path: <SRS0=tR/q=R4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CB3C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Mar 2019 13:27:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 628842070D
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Mar 2019 13:27:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fJDMvsn7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725747AbfCYN1B (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 25 Mar 2019 09:27:01 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:32961 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbfCYN1A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Mar 2019 09:27:00 -0400
Received: by mail-ua1-f66.google.com with SMTP id g8so2983028uaj.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Mar 2019 06:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=18wFd/vr6Xt6YoqrAZO7DMzeJLi+2Zcl2o4TWCLxaAE=;
        b=fJDMvsn7QWvt4ncEd0KlSkwzkbvX10PDQBBuVzymoa3j6StVVCw5rLEidzvaoCxZIi
         plpdhGrUSEInijg3dXSigW9GTRyIYxPUD20YiD4wsPcwAVdVdkNthVR6N8u7/cLY7ONy
         LYS/j7MKugIY4zdVkZmXKxbuslzV4+41GpwQY3BXVvxc497mMjV7UaZTcJ70jadEDInf
         hQocumdL4AmIM1LUgflYQx8gJ0Jg96flJTYYRhY1APgTK6DedQOdjIuERLAbWbsp7Nu2
         ibIyWgsiFyEE9z74QMzOQvC4biLiJ/P7uH+Rw40zbLaLT7XxlowIHo5qDjZ/ZfiA2kGw
         B3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=18wFd/vr6Xt6YoqrAZO7DMzeJLi+2Zcl2o4TWCLxaAE=;
        b=p2WqiDV4+Uh7bwUw+NBEMZpOP/JW/SUpQT3/zLP2WB695fHsy8S892MMVwNzFPf6RH
         Sx4Parqv4bKdEXzLkKV3lRevu6/ReiL92q6PnZ0Fu7LYXtjl7K3XFlclufEgOj4cV7E5
         glOF1jiJbnTrUZZZD2CCJ9iAteKwyTFOU6mBaak4xTBDuuAL3KxIAEg9/+fMKEAl2VdK
         QgTI5yocXdFrcG8eIiwpYU9BcfJ3fZ3P1PIMNfpxckKTh3/erZ6d6zP/ZuTGn31ECYQ5
         47fkOKReqfo8qGiacLBsbnACd0M00x4zvgajkeoIgvZh0bXo4SZbBq0TuFbYDBSYXqxC
         AiKg==
X-Gm-Message-State: APjAAAXlz/2I5RlcoF6vMgfQEG2BImQydWAZ9gn8leWtqUlZUbcPuOCy
        A4P1cIZ+Ecb1iTyozm0rBSg8kg9NF/NZshz9Gn2L8w==
X-Google-Smtp-Source: APXvYqw/KrN4wqTePgb5FDRcCiVTLb/qnyxuRzxQLtnRjtLWg0txXiUjS2XPwgn9FbvUhi6Q+/1EhJP6LBwYfhk1gU0=
X-Received: by 2002:ab0:2c0f:: with SMTP id l15mr13995623uar.100.1553520419581;
 Mon, 25 Mar 2019 06:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190314223130.31802-1-wsa+renesas@sang-engineering.com> <20190314223130.31802-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190314223130.31802-2-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 25 Mar 2019 14:26:23 +0100
Message-ID: <CAPDyKFpnHOP-q-w0NFQrgNiv8DmC0hyR8gYy0JXMRj8trFdZ=A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] mmc: tmio: introduce macro for max block size
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 14 Mar 2019 at 23:32, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> We will need it later for other calculations.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/tmio_mmc.h      | 2 ++
>  drivers/mmc/host/tmio_mmc_core.c | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
> index 2adb0d24360f..64e00d8f3a88 100644
> --- a/drivers/mmc/host/tmio_mmc.h
> +++ b/drivers/mmc/host/tmio_mmc.h
> @@ -105,6 +105,8 @@
>                 TMIO_STAT_CARD_REMOVE | TMIO_STAT_CARD_INSERT)
>  #define TMIO_MASK_IRQ     (TMIO_MASK_READOP | TMIO_MASK_WRITEOP | TMIO_MASK_CMD)
>
> +#define TMIO_MAX_BLK_SIZE 512
> +
>  struct tmio_mmc_data;
>  struct tmio_mmc_host;
>
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index 595949f1f001..dfc15ce41191 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -1186,7 +1186,7 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
>         mmc->caps |= MMC_CAP_4_BIT_DATA | pdata->capabilities;
>         mmc->caps2 |= pdata->capabilities2;
>         mmc->max_segs = pdata->max_segs ? : 32;
> -       mmc->max_blk_size = 512;
> +       mmc->max_blk_size = TMIO_MAX_BLK_SIZE;
>         mmc->max_blk_count = pdata->max_blk_count ? :
>                 (PAGE_SIZE / mmc->max_blk_size) * mmc->max_segs;
>         mmc->max_req_size = mmc->max_blk_size * mmc->max_blk_count;
> --
> 2.11.0
>
