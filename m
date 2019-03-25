Return-Path: <SRS0=tR/q=R4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75CAC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Mar 2019 13:26:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE6E92070D
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Mar 2019 13:26:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b40Eky7n"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725788AbfCYN0z (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 25 Mar 2019 09:26:55 -0400
Received: from mail-vk1-f196.google.com ([209.85.221.196]:46904 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbfCYN0z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Mar 2019 09:26:55 -0400
Received: by mail-vk1-f196.google.com with SMTP id x2so1923498vkx.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Mar 2019 06:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KBCuwX2e+SRZ5rivYN3n/xCg63bQoFrSme0pgs1f6T0=;
        b=b40Eky7nQin8Jv1a/9FYDu3t1AA4OePYPbgWG+SPGm6FIfIhRvRJsMRitoR55iujWJ
         cYYFp5k2KUUa5lnhlHIj2nVYd1FHYRW31xGYm/1RlT47gaT7B33ibb8LmsqoitV66uph
         7F2y83HTsh42H1Gu4KJH5jnf1JU2gYD19f3W06hgxzlWAnXEBOI/iAUvjAHAbnek4QzB
         mSogBr/xPQ3ISBwg8TRaC73bmRNVh1G9qaO86/JIDUBorgY5q/f6zh49HAmg89n00U5R
         Vbv0teu6wzizUdMz070siWr39MYYNj5tq36wqyq9+acxKIenVZSlECpkJxilXAbWCv2X
         jOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KBCuwX2e+SRZ5rivYN3n/xCg63bQoFrSme0pgs1f6T0=;
        b=ZoT1kBlVHYmhVcnyOLEQpFgFUVh0G3noE/cI4EEkVv6FHOfuphUELmoI0f5Slxndjd
         pOMcY6m1A93edXGGqZKaGb5eclG3UE1Hk72UceiQmIhikFwdlvD6h8Q96zO4sBrXHxmk
         Nrs4P8W+6w3/5TVjvLMioQQGZPQ1K5xAUYTP33Pv3i+9GiS0BH4NMQBVp8BgCxag32kY
         xDQXgi2KIowqJu1OZqmGbXC05tmIaG+x0UGsy+bXrMU6XMHptKTVzIjf/m08kLrbY9Ct
         9LW//z4+kE3Uqk7XeYYHDCqG7mxfG5dyhPOSLCwEh/Be6IAEKaS1a8iAi3wNmVwNHaD5
         PNSg==
X-Gm-Message-State: APjAAAUVw+bIeCYLNFPPHqGLmoh6AKU9jY0xnQDn3NRJv/u3lB1IdqLC
        qMIvPLWqotE1cwe0Jd17baFbNlG4JwkXw36eSsOPgQ==
X-Google-Smtp-Source: APXvYqyrJ3IQEx4EUmIk9bKnOFQ74ZiSTNLPauOiLabuuDk5aizbx37cgj6Xi5262gKG9CEIxSmWQY0a3W+kkgNFf2o=
X-Received: by 2002:a1f:c06:: with SMTP id 6mr6584866vkm.52.1553520414006;
 Mon, 25 Mar 2019 06:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190314223130.31802-1-wsa+renesas@sang-engineering.com> <20190314223130.31802-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190314223130.31802-3-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 25 Mar 2019 14:26:17 +0100
Message-ID: <CAPDyKFriY2YL=QegT+gzRr_-a=8zB-eq-FWEmseZeQo-ajNhRg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] mmc: renesas_sdhi: prevent overflow for max_req_size
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
> max_req_size is calculated by 'max_blk_size * max_blk_count' in the TMIO
> core. So, specifying U32_MAX as max_blk_count will overflow this
> calculation. It will cause no harm in practice because the immense high
> number will overflow into another immense high number. However, it is
> not good coding practice, so calculate max_blk_count so that
> max_req_size will fit into unsigned int on ARM32/64.
>
> Thanks to the Renesas BSP team for the bug report!
>
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 8 ++++----
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index 9dfafa2a90a3..af0288f04200 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -95,8 +95,8 @@ static const struct renesas_sdhi_of_data of_rza2_compatible = {
>         .scc_offset     = 0 - 0x1000,
>         .taps           = rcar_gen3_scc_taps,
>         .taps_num       = ARRAY_SIZE(rcar_gen3_scc_taps),
> -       /* DMAC can handle 0xffffffff blk count but only 1 segment */
> -       .max_blk_count  = 0xffffffff,
> +       /* DMAC can handle 32bit blk count but only 1 segment */
> +       .max_blk_count  = UINT_MAX / TMIO_MAX_BLK_SIZE,
>         .max_segs       = 1,
>  };
>
> @@ -110,8 +110,8 @@ static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
>         .scc_offset     = 0x1000,
>         .taps           = rcar_gen3_scc_taps,
>         .taps_num       = ARRAY_SIZE(rcar_gen3_scc_taps),
> -       /* DMAC can handle 0xffffffff blk count but only 1 segment */
> -       .max_blk_count  = 0xffffffff,
> +       /* DMAC can handle 32bit blk count but only 1 segment */
> +       .max_blk_count  = UINT_MAX / TMIO_MAX_BLK_SIZE,
>         .max_segs       = 1,
>  };
>
> diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> index 02cd878e209f..bfbf36634faa 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -65,7 +65,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen2_compatible = {
>         .scc_offset     = 0x0300,
>         .taps           = rcar_gen2_scc_taps,
>         .taps_num       = ARRAY_SIZE(rcar_gen2_scc_taps),
> -       .max_blk_count  = 0xffffffff,
> +       .max_blk_count  = UINT_MAX / TMIO_MAX_BLK_SIZE,
>  };
>
>  /* Definitions for sampling clocks */
> --
> 2.11.0
>
