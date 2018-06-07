Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:36285 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752570AbeFGHFo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jun 2018 03:05:44 -0400
Received: by mail-wr0-f194.google.com with SMTP id f16-v6so8816403wrm.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Jun 2018 00:05:44 -0700 (PDT)
Date: Thu, 7 Jun 2018 08:05:40 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-kernel@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Brown <broonie@kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 04/14] mfd: da9063: Use REGMAP_IRQ_REG
Message-ID: <20180607070540.GA22841@dell>
References: <20180606100003.17067-1-marek.vasut+renesas@gmail.com>
 <20180606100003.17067-4-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180606100003.17067-4-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, 06 Jun 2018, Marek Vasut wrote:

> Convert the regmap_irq table to use REGMAP_IRQ_REG().
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Steve Twiss <stwiss.opensource@diasemi.com>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>
> ---
> V3: New patch
> Note: A sed oneliner was used:
>       sed -i "/\[DA9063_IRQ_/ {N;N;N;s/\n//g;s/.*\[\(DA9063_IRQ_[^]]\+\)].*reg_offset = \([^,]\+\),.* = \([^,]\+\),.*/\tREGMAP_IRQ_REG(\1, \2, \3),/}" drivers/mfd/da9063-irq.c
> V4: Formatting fixes with "s/,/&\r\t\t      /" on the array
>     Drop extra newline in da9063_irq_chip
> V5: No change
> ---
>  drivers/mfd/da9063-irq.c | 175 ++++++++++++++++-------------------------------
>  1 file changed, 58 insertions(+), 117 deletions(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
