Return-Path: <SRS0=zXAj=RV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A988C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 10:52:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 59FF62082F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 10:52:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tDcl+tVD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbfCRKwl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Mar 2019 06:52:41 -0400
Received: from mail-vk1-f196.google.com ([209.85.221.196]:40176 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbfCRKwl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Mar 2019 06:52:41 -0400
Received: by mail-vk1-f196.google.com with SMTP id l17so3662227vke.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Mar 2019 03:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OQqGRKRamK+17ljCTtw3G/UQoHxjr+2JjESwRzUNLBw=;
        b=tDcl+tVDxFKtWBHaqdpeximc7QXNf5RBDcbQ3WSSy7eci23VFEVmo1d/CSxJzuElia
         dh/O/MDvObGQAcdJJG71sZRRwWf3kKNzREX9sLqWcGU3im86APqgsFSYAB3hlEFF0h8t
         5oWgNug+cyjNaTNNeZIrnJk5gjSYadxbvPNtPmS20NofOtIwIEV2kNd/PoR2GN8cL+Pe
         mklZUv9L9n+9Qe7+p0os9v9qzh++ohMJkHVoqXgAmbEuLOMoJ36NGIIeD862r//wRCe8
         ssVyc5T/dH6iCL9cAM45FN1RW4LqjHYzR9BJvmZU52CD2aOubQ4eY7VR1lVmKtCMpFEV
         feVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OQqGRKRamK+17ljCTtw3G/UQoHxjr+2JjESwRzUNLBw=;
        b=UNNbEocUJuSKoF1O1shQPMvjN3t+Pi8i7JqVPj9abFnN2Ws/Lz2F2A751OBlrhrxUj
         k9Q6WwED/h3Pick5zQw2lce6jrjq82fK9JLJy8E6PBKVIIcwDIK9MywY7+fDaVR2Xyia
         Zy9XLJEwCmYx3+ufAnYMp80SpkZVFkUGtFQ4dO9r61z/vpi1VtdpukljhQ9rNf2o7cC3
         LqwFOcZtucnpe1o+wNb7iOVGH7LipfBBDN1cZ07C0VAOU1hWzTyjNMiQm2KJ82WVL33W
         X9PX64aaSirNDQkAfiFz6Ui1EdNg5lX81Ue4wxK1H7zac9x0M+PPePy8ht3xlFMvldCi
         NbHw==
X-Gm-Message-State: APjAAAU741pNVtat8o3E5taWlpP0HyFjzIFXmk7R2nzwWkgMm7cKPBcx
        8xnJaTsIj5dQwFs1GThaDsdlpiUls1ILFbcC/E3rbA==
X-Google-Smtp-Source: APXvYqyAoADbbx6I8KunSDLnPRSJybDu6uGofaj5YF2OazqLQWeLCUYmJLFGEoHhlP4zxVfwrHpbansYhbsj5NzQuQY=
X-Received: by 2002:a1f:a5d3:: with SMTP id o202mr8913352vke.40.1552906360379;
 Mon, 18 Mar 2019 03:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190314225441.310-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190314225441.310-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 18 Mar 2019 11:52:04 +0100
Message-ID: <CAPDyKFqW3tQjKNEVcL==k6tk1PQxDtTMONDp_M3PBE8C0nXzYg@mail.gmail.com>
Subject: Re: [PATCH RFC] mmc: renesas_sdhi: update copyright information
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 14 Mar 2019 at 23:54, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Mostly year updates, but one addition as well.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> I checked the git history to back up these changes to the best of my knowledge.
> I chose to not modify the copyright information of other people but give them
> here the chance to speak up :)
>
>
>  drivers/mmc/host/renesas_sdhi.h               | 2 +-
>  drivers/mmc/host/renesas_sdhi_core.c          | 4 ++--
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 3 ++-
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 4 ++--
>  drivers/mmc/host/tmio_mmc.h                   | 4 ++--
>  drivers/mmc/host/tmio_mmc_core.c              | 4 ++--
>  6 files changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
> index 8394a7bb1fc1..c0504aa90857 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -3,7 +3,7 @@
>   * Renesas Mobile SDHI
>   *
>   * Copyright (C) 2017 Horms Solutions Ltd., Simon Horman
> - * Copyright (C) 2017 Renesas Electronics Corporation
> + * Copyright (C) 2017-19 Renesas Electronics Corporation
>   */
>
>  #ifndef RENESAS_SDHI_H
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 71e13844df6c..923719e1282a 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -2,8 +2,8 @@
>  /*
>   * Renesas SDHI
>   *
> - * Copyright (C) 2015-17 Renesas Electronics Corporation
> - * Copyright (C) 2016-17 Sang Engineering, Wolfram Sang
> + * Copyright (C) 2015-19 Renesas Electronics Corporation
> + * Copyright (C) 2016-19 Sang Engineering, Wolfram Sang
>   * Copyright (C) 2016-17 Horms Solutions, Simon Horman
>   * Copyright (C) 2009 Magnus Damm
>   *
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index af0288f04200..751fe91c7571 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -2,8 +2,9 @@
>  /*
>   * DMA support for Internal DMAC with SDHI SD/SDIO controller
>   *
> - * Copyright (C) 2016-17 Renesas Electronics Corporation
> + * Copyright (C) 2016-19 Renesas Electronics Corporation
>   * Copyright (C) 2016-17 Horms Solutions, Simon Horman
> + * Copyright (C) 2018-19 Sang Engineering, Wolfram Sang
>   */
>
>  #include <linux/bitops.h>
> diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> index bfbf36634faa..1d29b822efb8 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -2,8 +2,8 @@
>  /*
>   * DMA support use of SYS DMAC with SDHI SD/SDIO controller
>   *
> - * Copyright (C) 2016-17 Renesas Electronics Corporation
> - * Copyright (C) 2016-17 Sang Engineering, Wolfram Sang
> + * Copyright (C) 2016-19 Renesas Electronics Corporation
> + * Copyright (C) 2016-19 Sang Engineering, Wolfram Sang
>   * Copyright (C) 2017 Horms Solutions, Simon Horman
>   * Copyright (C) 2010-2011 Guennadi Liakhovetski
>   */
> diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
> index 64e00d8f3a88..c5ba13fae399 100644
> --- a/drivers/mmc/host/tmio_mmc.h
> +++ b/drivers/mmc/host/tmio_mmc.h
> @@ -4,8 +4,8 @@
>   *
>   * TC6393XB TC6391XB TC6387XB T7L66XB ASIC3
>   *
> - * Copyright (C) 2015-17 Renesas Electronics Corporation
> - * Copyright (C) 2016-17 Sang Engineering, Wolfram Sang
> + * Copyright (C) 2015-19 Renesas Electronics Corporation
> + * Copyright (C) 2016-19 Sang Engineering, Wolfram Sang
>   * Copyright (C) 2016-17 Horms Solutions, Simon Horman
>   * Copyright (C) 2007 Ian Molton
>   * Copyright (C) 2004 Ian Molton
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index dfc15ce41191..130b91cb0f8a 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -4,8 +4,8 @@
>   *
>   * TC6393XB, TC6391XB, TC6387XB, T7L66XB, ASIC3, SH-Mobile SoCs
>   *
> - * Copyright (C) 2015-17 Renesas Electronics Corporation
> - * Copyright (C) 2016-17 Sang Engineering, Wolfram Sang
> + * Copyright (C) 2015-19 Renesas Electronics Corporation
> + * Copyright (C) 2016-19 Sang Engineering, Wolfram Sang
>   * Copyright (C) 2017 Horms Solutions, Simon Horman
>   * Copyright (C) 2011 Guennadi Liakhovetski
>   * Copyright (C) 2007 Ian Molton
> --
> 2.11.0
>
