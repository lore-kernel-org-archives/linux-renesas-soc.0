Return-Path: <SRS0=APCG=RB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4764EC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 26 Feb 2019 08:19:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 15304213A2
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 26 Feb 2019 08:19:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nvwpunuS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbfBZITK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 26 Feb 2019 03:19:10 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:35466 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfBZITK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Feb 2019 03:19:10 -0500
Received: by mail-ua1-f68.google.com with SMTP id f88so11061718uaf.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Feb 2019 00:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gcqgnaCGr6lUNNTgMHEmrZ/ZV/HFzu1S4pUX3MNq4GI=;
        b=nvwpunuSotVJk0uLOEvvoz8rM1I3478EX0sSE2pjr3MoYYVh7k9L8eC9gffbjZZtB6
         JZ1O2rz3fyg7vN3Tz0vD0AvSCHLXCUZ3V0GMHNUtVVGQDz3H83Upb4ZkdseP0nzZfl03
         ddjSma90wT/cEGPbw25/N3nhQ148IKlvT/D5xwJI9vKro9Vux5mgY7tydr+bHrm7POM9
         zj2Hn76TeGeJSMMplh6a4ZDIAYTbUvnbOmM1gsjuv0a6XupumGhhgrF32pQzC0hQzZGa
         pja2XOabpcT5n+XG6nqWD6joa4HPBG1YBzfvtuwBOXCbxRrzp117AkY9m4/GfjIHs31A
         eJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gcqgnaCGr6lUNNTgMHEmrZ/ZV/HFzu1S4pUX3MNq4GI=;
        b=LZcumAu/YtG5MWiEhQBSshr6kntrJbxLDTOORkj64UBvMzD56WJGg0Jne1PtVPETP+
         QfgtRUDMKLVY1oaAhPoSn70ayTdiH+RRLSgKpM8sa+R3LDJYP53mTT7uV8I5ibRfywRU
         k7BNyExOTO949Bud5gPdPI+8YYDM/uvpKFi98G94DFoEntDXpGlaqYzJpRsrB3wbrRDz
         4I3DLvx9qEBeUdAYXxmLV1SdimcrforC0ul4sAUp0zTK3NnvtNOK2ri4cTouZvEr5dwv
         kEX9TAmmiaFwq1LiPTwoBQqDA1a1KP5Iau20pRTWAloNk2/2+9mH/Ge4Nd/hV+mXWmtM
         csOQ==
X-Gm-Message-State: AHQUAuae4nDJxjrlyx3/opRO5OYAsOcmVyHyz0Ex+lrWSsi4gpDke5SC
        4RtRSzArz1O8lfnkA5i5zO7g2yzbEl5Z94ZRU9t1CQ==
X-Google-Smtp-Source: AHgI3IY3k7aMkvSI4k4BlDEIii/Q9nlNc0HXnQ8koK7diz6BPAy1fLM6c7JhYcXQdSctbEkV9KJInBiHwc2E0IqZAHU=
X-Received: by 2002:ab0:7650:: with SMTP id s16mr10912043uaq.77.1551169149404;
 Tue, 26 Feb 2019 00:19:09 -0800 (PST)
MIME-Version: 1.0
References: <20190221193805.1427-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190221193805.1427-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 26 Feb 2019 09:18:33 +0100
Message-ID: <CAPDyKFr9_LUW2Z6sewpZwMu2MDyq2JU3aM+EMJc+WZCeB3ChOA@mail.gmail.com>
Subject: Re: [PATCH] mmc: tmio: fix access width of Block Count Register
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 21 Feb 2019 at 20:38, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> From: Takeshi Saito <takeshi.saito.xv@renesas.com>
>
> In R-Car Gen2 or later, the maximum number of transfer blocks are
> changed from 0xFFFF to 0xFFFFFFFF. Therefore, Block Count Register
> should use iowrite32().
>
> If another system (U-boot, Hypervisor OS, etc) uses bit[31:16], this
> value will not be cleared. So, SD/MMC card initialization fails.
>
> So, check for the bigger register and use apropriate write. Also, mark
> the register as extended on Gen2.
>
> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> [wsa: use max_blk_count in if(), add Gen2, update commit message]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: stable@kernel.org

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>
> No Fixes tag because it is hard to point to a specific commit. So, just a
> stable tag. I think as long as it applies, we are good to go.
>
> Yamada-san, please check if your driver needs to set max_blk_count, too.
>
> Tested on a Renesas Lager board (R-Car H2) and Salvator-XS (R-Car M3N).
> Verified with debug prints that the correct code path was executed, no
> regressions encountered when checksumming large files.
>
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c | 1 +
>  drivers/mmc/host/tmio_mmc.h              | 5 +++++
>  drivers/mmc/host/tmio_mmc_core.c         | 5 ++++-
>  3 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> index 8471160316e0..02cd878e209f 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -65,6 +65,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen2_compatible = {
>         .scc_offset     = 0x0300,
>         .taps           = rcar_gen2_scc_taps,
>         .taps_num       = ARRAY_SIZE(rcar_gen2_scc_taps),
> +       .max_blk_count  = 0xffffffff,
>  };
>
>  /* Definitions for sampling clocks */
> diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
> index c03529e3f01a..2adb0d24360f 100644
> --- a/drivers/mmc/host/tmio_mmc.h
> +++ b/drivers/mmc/host/tmio_mmc.h
> @@ -277,6 +277,11 @@ static inline void sd_ctrl_write32_as_16_and_16(struct tmio_mmc_host *host,
>         iowrite16(val >> 16, host->ctl + ((addr + 2) << host->bus_shift));
>  }
>
> +static inline void sd_ctrl_write32(struct tmio_mmc_host *host, int addr, u32 val)
> +{
> +       iowrite32(val, host->ctl + (addr << host->bus_shift));
> +}
> +
>  static inline void sd_ctrl_write32_rep(struct tmio_mmc_host *host, int addr,
>                                        const u32 *buf, int count)
>  {
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index 085a0fab769c..198c811b478c 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -700,7 +700,10 @@ static int tmio_mmc_start_data(struct tmio_mmc_host *host,
>
>         /* Set transfer length / blocksize */
>         sd_ctrl_write16(host, CTL_SD_XFER_LEN, data->blksz);
> -       sd_ctrl_write16(host, CTL_XFER_BLK_COUNT, data->blocks);
> +       if (host->mmc->max_blk_count >= SZ_64K)
> +               sd_ctrl_write32(host, CTL_XFER_BLK_COUNT, data->blocks);
> +       else
> +               sd_ctrl_write16(host, CTL_XFER_BLK_COUNT, data->blocks);
>
>         tmio_mmc_start_dma(host, data);
>
> --
> 2.11.0
>
