Return-Path: <SRS0=eQV7=6G=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A82C55185
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 22 Apr 2020 16:04:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6244F2082E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 22 Apr 2020 16:04:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fjSGtm0/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgDVQEd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 22 Apr 2020 12:04:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgDVQEd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Apr 2020 12:04:33 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9C5CC03C1A9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2020 09:04:31 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id f59so2183190uaf.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2020 09:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N/DzD0X/BMyf3OryfRPRnpiI0NbDoH57OGhKb89rpyQ=;
        b=fjSGtm0/EMllifvmFSA2KUULYP8Qwf5y20wtI2lc4Xl36Gtj9mY4UWEI+YNSu4Pj66
         kPy0fnocmhU3Xk84p19s4RLHeywaHiv7pZEISXnNA9pO/Xo/ibE2qdOxEpXrtAhiu0WO
         aiA7BbXBrlEtkGPfyblYvS3W+YKSSoq1J+VeKYWq6FHPedjvzuJDjowS7vCRBEmPz1MO
         blABk9SQ7sqsZeD2DKWszQMcxCz2M97WCXx7zCa6J7ABrIOu1YCL7ceml8P/TPYU3q1U
         UUmrSAsMuCOo63PsHjzb3MXfZdWVaiaBI3oOjWTaoOGno/A2Xz4pLleHgt3GdGxsR2fa
         TGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N/DzD0X/BMyf3OryfRPRnpiI0NbDoH57OGhKb89rpyQ=;
        b=CMbcQrIXYWJ9FIs8oqr/lUjwy2azHtNupvbVN1vhXBw1C78AZEJxx4RgbvS/NpiF7G
         bFvG8xPBy7sHtpjJ6uk9ehfjJH5FOHcJJ5bmoT4PzRSdEdSKGBlTz7bOFsU12VW0WZWk
         JknVn2gc6W6Koz/8o+WTls5HwyscnoxLzqW/8UqF/mYiZSzUBO0QQkKympVi+AhtjPNF
         0gD9Z1x9bA+ab18BSmNysvZd3Kof6RTAlEDU/RL3BCeCJ+fJysoZ8JzSO+PNOCsVI1TW
         VnmUN/kXxt1kBaWHHnPG3jhqyA9RHzPXxqvRjmcBsSed9tSmHnK6AIKVgm9Ci2pVKnGh
         IDyA==
X-Gm-Message-State: AGi0PuaRhz73tSlYSfbiRlTvfAelyFwF/8tx3lGylsu2slGCjLupFuLq
        7HEZIz6NQe3Y16Z+PwJ4AgAOyILY6Orhua9r+yTRShvl
X-Google-Smtp-Source: APiQypJRz8Ztz3+8zVfMbngW1c9C1Q6q/wYoCLpdck9AjY9Dn921DWWB5j2qGn96kuNvaCnjHF/KKjU+X11mYT95QVw=
X-Received: by 2002:ab0:6588:: with SMTP id v8mr16741509uam.100.1587571469221;
 Wed, 22 Apr 2020 09:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200420170230.9091-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200420170230.9091-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 22 Apr 2020 18:03:53 +0200
Message-ID: <CAPDyKFqidj2fNt8C_EnNTz8Ldz08y43PSDyHY1Z0=ysZ8ozY1Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: shorten types after refactorization
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 20 Apr 2020 at 19:02, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> After TAP refactorization, we can use 'unsigned int' for two more
> variables because all the calculations work on this type now.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/renesas_sdhi.h      | 2 +-
>  drivers/mmc/host/renesas_sdhi_core.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
> index 12d8016672b0..86efa9d5cd6d 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -64,7 +64,7 @@ struct renesas_sdhi {
>         /* Sampling data comparison: 1 for match, 0 for mismatch */
>         DECLARE_BITMAP(smpcmp, BITS_PER_LONG);
>         unsigned int tap_num;
> -       unsigned long tap_set;
> +       unsigned int tap_set;
>  };
>
>  #define host_to_priv(host) \
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 1dfe6c32280b..28b0830c4251 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -527,7 +527,7 @@ static int renesas_sdhi_execute_tuning(struct tmio_mmc_host *host, u32 opcode)
>  static bool renesas_sdhi_manual_correction(struct tmio_mmc_host *host, bool use_4tap)
>  {
>         struct renesas_sdhi *priv = host_to_priv(host);
> -       unsigned long new_tap = priv->tap_set;
> +       unsigned int new_tap = priv->tap_set;
>         u32 val;
>
>         val = sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSREQ);
> --
> 2.20.1
>
