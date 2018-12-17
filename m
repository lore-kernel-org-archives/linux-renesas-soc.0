Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 915FDC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 08:08:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 60A5A20645
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 08:08:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cj+UsPnY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731686AbeLQIIP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 03:08:15 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:36918 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731685AbeLQIIM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 03:08:12 -0500
Received: by mail-vs1-f65.google.com with SMTP id h18so7151702vsj.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Dec 2018 00:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2vyBTa9d1fbO1CSmayznBy09h06Na31rJyn+pVPXfpo=;
        b=Cj+UsPnYkzwCv2azc1+tNPiR6LVLH3EHfjLLmFSwwqxR1o/kNxfhiIjRNIjHhikLpI
         JTcpGJKCrSE7Du6vbGy5921WVzuhRTB2/MmrbhksPVrReajOSACXGIVKae+RX9qT6+wN
         +9QcCp0XbCNf0ZLLNI5+vHKfi2uy/TGMPFIAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2vyBTa9d1fbO1CSmayznBy09h06Na31rJyn+pVPXfpo=;
        b=DJId7u3v1/pApKrOCyiMflvsGl18d77+CuiECXzP5V/aaHdg//nkel8N1LQpq+BwLd
         dOcoQAoe7l1brqmpXnMMGY/a8dVNj1qNMAWJlL1BGgKG1oPXyhuc0VYLYm/FWEi593Ni
         GNrB/sEZK8tp/g6RwEs6hfFcdqd0S7yNtxP8vt1+Z101t+h4hO5N+WigtOyzEIDxpZ9L
         RU5Qqv7RaosR43f6n5pB5RpdkozH6Wd5iK1ZPJHS66RZ4oyGKI8PHpgcECbG4WMOeyOc
         BAjCXizwyE822htAyZf9BueCywdVou+maKGHhmtmgwW1FVVos81MZwHcO4SIcKLMRytF
         pTVA==
X-Gm-Message-State: AA+aEWa2mORUONkrChO3iHNDfClDOVLj6P8qBA8NsI9Qk/UQKh87KSVZ
        /l2K5tyjlCMkwBR5VfpSyATt03saJ+dFnFDET73Mxw==
X-Google-Smtp-Source: AFSGD/U33Se7XQtAoOZKN+doayL/xpYyXhSRxYFMFNn+X///2TTCmS8NvFAe4Stptid7mFRUEGZPxccg/cZgGuorlDM=
X-Received: by 2002:a67:e002:: with SMTP id c2mr5986572vsl.34.1545034091333;
 Mon, 17 Dec 2018 00:08:11 -0800 (PST)
MIME-Version: 1.0
References: <1544732547-7094-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1544732547-7094-1-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 17 Dec 2018 09:07:35 +0100
Message-ID: <CAPDyKFpKhweSQtt+LAukZXCuABsAhUyh=gL31h8_6uLps3sLCA@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: Whitelist r8a774c0
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 13 Dec 2018 at 21:22, Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
>
> From: Biju Das <biju.das@bp.renesas.com>
>
> We need r8a774c0 to be whitelisted for SDHI to work on the RZ/G2E,
> but we don't care about the revision of the SoC, so just whitelist
> the generic part number.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index b6f5410..909a5c9 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -298,6 +298,7 @@ static const struct soc_device_attribute soc_whitelist[] = {
>           .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },
>         /* generic ones */
>         { .soc_id = "r8a774a1" },
> +       { .soc_id = "r8a774c0" },
>         { .soc_id = "r8a77470" },
>         { .soc_id = "r8a7795" },
>         { .soc_id = "r8a7796" },
> --
> 2.7.4
>
