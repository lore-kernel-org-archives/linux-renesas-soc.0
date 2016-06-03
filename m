Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:35181 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751963AbcFCIeK (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 3 Jun 2016 04:34:10 -0400
Received: by mail-wm0-f53.google.com with SMTP id a136so264874574wme.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Jun 2016 01:34:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1464351029-6863-1-git-send-email-wsa@the-dreams.de>
References: <1464351029-6863-1-git-send-email-wsa@the-dreams.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 3 Jun 2016 10:34:07 +0200
Message-ID: <CAPDyKFreujWc2YNO-xr+pZr2beKJegCsK_eSOQXTwHXRwEzAKw@mail.gmail.com>
Subject: Re: [PATCH] mmc: tmio: make a cast explicit
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-mmc <linux-mmc@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 27 May 2016 at 14:10, Wolfram Sang <wsa@the-dreams.de> wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Sparse complains about the implicit cast. Making it explicit is indeed
> better coding style.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, applied for next!

Kind regards
Uffe

> ---
>  drivers/mmc/host/tmio_mmc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
> index 7d1174c789219a..5f2919ceced12d 100644
> --- a/drivers/mmc/host/tmio_mmc.h
> +++ b/drivers/mmc/host/tmio_mmc.h
> @@ -265,7 +265,7 @@ static inline void sd_ctrl_write16_rep(struct tmio_mmc_host *host, int addr,
>
>  static inline void sd_ctrl_write32_as_16_and_16(struct tmio_mmc_host *host, int addr, u32 val)
>  {
> -       writew(val, host->ctl + (addr << host->bus_shift));
> +       writew(val & 0xffff, host->ctl + (addr << host->bus_shift));
>         writew(val >> 16, host->ctl + ((addr + 2) << host->bus_shift));
>  }
>
> --
> 2.8.1
>
