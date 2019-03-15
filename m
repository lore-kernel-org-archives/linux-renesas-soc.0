Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B7E1C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 07:46:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4458721872
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 07:46:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbfCOHqz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 03:46:55 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:42596 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728314AbfCOHqz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 03:46:55 -0400
Received: by mail-vs1-f66.google.com with SMTP id c189so4837082vsd.9;
        Fri, 15 Mar 2019 00:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MJfhxcgkuZ68J6FXsZ+9iQnXNOo0Mv5y6Fb3rh3YHVI=;
        b=Nr81ip8inx+8SACq1s8kTPe/v15lrxiGTC9o5Qv/MbxYWwSTjIu2rdFX8z4fOBw/lG
         AwDWO0JcE/WR0bogM/CKTKbGbS3zzyd6D1hZztmFtovajnpjonSO3WnfwGRUD6Xvmk1K
         owuhkqB0R+KfQxDiMpjuZDYElIPzNqK/N2ftaywX5Wb2qmuZwMvLJTSzpX85FmdCwgMP
         +C2pqZkXgxKyhGqbHeUiKdJzyDYCMPYik0lajc1ctmcWvHJ7JSpL/SU7GJI3KEUI1XUl
         enXFOG8jWLX1bnjKZZvCIdmzPwPL9ZKnCZoqaD1HIe1ycTjKcUtV95uvBhxsWk5374VP
         UjjA==
X-Gm-Message-State: APjAAAWUsjMes8Ko+olOd5dyy8GjZTqSUZwEnD+MIZGEJWmU2BlBJR3L
        NEaEhxu6wBSjb3NR0NczI2lHKSZiL0uGRBYxkrk=
X-Google-Smtp-Source: APXvYqzORX7ZwQB6Fi/24dF/qtLqygBRgGUwAoatoqn6S5ll5MQCUsOKOsVe4EyeKuoNHMwHCvXfMLdSANFU+4JEGks=
X-Received: by 2002:a67:f2d0:: with SMTP id a16mr1120124vsn.96.1552636014152;
 Fri, 15 Mar 2019 00:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190314223130.31802-1-wsa+renesas@sang-engineering.com> <20190314223130.31802-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190314223130.31802-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 Mar 2019 08:46:41 +0100
Message-ID: <CAMuHMdWvCUJ4S1U-jR2fG=JSXO3KMbbO2=hWPOxqQDXzGMXi0g@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] mmc: renesas_sdhi: prevent overflow for max_req_size
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Thu, Mar 14, 2019 at 11:35 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
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

Thanks for your patch!

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

I have mixed feelings about this change:
  1. You're lying about the actual maximum (yes, there's a comment that
     mentions the real limit),
  2. This fixes the problem in this single (set of) drivers only, while about
     every other driver (not the mmc core) calculates
     "max_blk_size * max_blk_count", too.
  3. Some drivers use different limits (e.g. 2048, 4095, or 4096), so
     eventually having a common upper limit is not easy.

BTW, drivers/mmc/host/usdhi6rol0.c does it the other way around:

    mmc->max_blk_count = mmc->max_req_size / mmc->max_blk_size;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
