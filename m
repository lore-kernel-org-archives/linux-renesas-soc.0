Return-Path: <SRS0=a0xC=QF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1411AC169C4
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 29 Jan 2019 08:06:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D5F03217F5
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 29 Jan 2019 08:06:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="Io/cSLhV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725468AbfA2IGT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 29 Jan 2019 03:06:19 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:36834 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbfA2IGT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Jan 2019 03:06:19 -0500
Received: by mail-vs1-f65.google.com with SMTP id v205so11437656vsc.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Jan 2019 00:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=G05/+vfagZRO4toeGcDcphmuXM4dwR3FcasqAA8KZZI=;
        b=Io/cSLhV4nAuX2VqG9rC8wGfXbm/b4UaQFfbxK75hEGN7zceEaUeWQRgwklx/GglJp
         cntgcq78cP8ps4G1ZMbcQYw7NnO0j0YQep2aJhMb/oT6T26U/IjXVOGTAKJ65v0kT64I
         04NSOOVeY6uyprPl5sNYKV1b6vkM7L/phDzVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=G05/+vfagZRO4toeGcDcphmuXM4dwR3FcasqAA8KZZI=;
        b=eK0rttFGiQ2nenyuwHBwmv1R1p0vhnHJjO0RDNua3/G18V233eRMiqoYRpeWWh91xu
         ypPehsqwMVJXRtIS6rB4mI+l3iagAgfS6XwZ424bmc6SYXgdW9JlmWpv5rG44HCdLmHx
         jajlXuSm+r51q1BTcRs/fApM2cgXeSrHAaGDV6Et7PZufJKpkEYR+17PZdbz5f8zdqdR
         n1PcnYOy6k0hTQ46NcbLvtedxQ8mBaKM1J4xrcsfThBT2nsPEaURM76KijMZ8NPT5/qS
         bpSalIjI1238JuQ9fNE9oGkG1uF/KFWOPUHnRxK3KoWLDtQVY7VmKHdbkHVpHWHG0EK8
         PadA==
X-Gm-Message-State: AJcUukdF4Anl8SRsFKnucbJvRhBYhi4v5QUQ1yE88WKPdVKID1LDgf67
        3cmdPK0FUCzqZC+C1J5r8XTyJI9bCu7kYS1Qu70Q2w==
X-Google-Smtp-Source: ALg8bN5QKWsphfTzltJz36PGLrwSab2GoUedmikci01kQdZoX59CfBKzVjOCyNCS403PFb/O11TApZyN9UUyAEh3Bfk=
X-Received: by 2002:a67:1a84:: with SMTP id a126mr10427350vsa.165.1548749177762;
 Tue, 29 Jan 2019 00:06:17 -0800 (PST)
MIME-Version: 1.0
References: <20190129054039.15278-1-marek.vasut@gmail.com>
In-Reply-To: <20190129054039.15278-1-marek.vasut@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 29 Jan 2019 09:05:41 +0100
Message-ID: <CAPDyKFpa=q+oSES115SBUnpFVq+nUGwH7sY5F=go4-rZp6EasQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: Fix card initialization failure in
 high speed mode
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 29 Jan 2019 at 06:40, <marek.vasut@gmail.com> wrote:
>
> From: Takeshi Saito <takeshi.saito.xv@renesas.com>
>
> This fixes card initialization failure in high speed mode.
>
> If U-Boot uses SDR or HS200/400 mode before starting Linux and Linux
> DT does not enable SDR/HS200/HS400 mode, card initialization fails in
> high speed mode.
>
> It is necessary to initialize SCC registers during card initialization
> phase. HW reset function is registered only for a port with either of
> SDR/HS200/HS400 properties in device tree. If SDR/HS200/HS400 properties
> are not present in device tree, SCC registers will not be reset. In SoC
> that support SCC registers, HW reset function should be registered
> regardless of the configuration of device tree.
>
> Reproduction procedure:
> - Use U-Boot that support MMC HS200/400 mode.
> - Delete HS200/HS400 properties in device tree.
>   (Delete mmc-hs200-1_8v and mmc-hs400-1_8v)
> - MMC port works high speed mode and all commands fail.
>
> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org
> To: linux-mmc@vger.kernel.org

Is this a regression? Should it be tagged for stable?

Kind regards
Uffe

> --
> NOTE: Marek: - Reworded commit message
>              - Updated patch to next/master
> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index 31a351a20dc0..7e2a75c4f36f 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -723,6 +723,13 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>                 host->ops.start_signal_voltage_switch =3D
>                         renesas_sdhi_start_signal_voltage_switch;
>                 host->sdcard_irq_setbit_mask =3D TMIO_STAT_ALWAYS_SET_27;
> +
> +               /* SDR and HS200/400 registers requires HW reset */
> +               if (of_data && of_data->scc_offset) {
> +                       priv->scc_ctl =3D host->ctl + of_data->scc_offset=
;
> +                       host->mmc->caps |=3D MMC_CAP_HW_RESET;
> +                       host->hw_reset =3D renesas_sdhi_hw_reset;
> +               }
>         }
>
>         /* Orginally registers were 16 bit apart, could be 32 or 64 nowad=
ays */
> @@ -775,8 +782,6 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>                 const struct renesas_sdhi_scc *taps =3D of_data->taps;
>                 bool hit =3D false;
>
> -               host->mmc->caps |=3D MMC_CAP_HW_RESET;
> -
>                 for (i =3D 0; i < of_data->taps_num; i++) {
>                         if (taps[i].clk_rate =3D=3D 0 ||
>                             taps[i].clk_rate =3D=3D host->mmc->f_max) {
> @@ -789,12 +794,10 @@ int renesas_sdhi_probe(struct platform_device *pdev=
,
>                 if (!hit)
>                         dev_warn(&host->pdev->dev, "Unknown clock rate fo=
r SDR104\n");
>
> -               priv->scc_ctl =3D host->ctl + of_data->scc_offset;
>                 host->init_tuning =3D renesas_sdhi_init_tuning;
>                 host->prepare_tuning =3D renesas_sdhi_prepare_tuning;
>                 host->select_tuning =3D renesas_sdhi_select_tuning;
>                 host->check_scc_error =3D renesas_sdhi_check_scc_error;
> -               host->hw_reset =3D renesas_sdhi_hw_reset;
>                 host->prepare_hs400_tuning =3D
>                         renesas_sdhi_prepare_hs400_tuning;
>                 host->hs400_downgrade =3D renesas_sdhi_disable_scc;
> --
> 2.19.2
>
