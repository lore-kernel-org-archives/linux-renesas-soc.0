Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:39723 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753106AbeFDM1C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jun 2018 08:27:02 -0400
Received: by mail-wm0-f68.google.com with SMTP id p11-v6so13996778wmc.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Jun 2018 05:27:01 -0700 (PDT)
Date: Mon, 4 Jun 2018 13:26:58 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-kernel@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Brown <broonie@kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 03/10] mfd: da9063: Rename PMIC_DA9063 to
 PMIC_CHIP_ID_DA9063
Message-ID: <20180604122658.GC21163@dell>
References: <20180602101155.26375-1-marek.vasut+renesas@gmail.com>
 <20180602101155.26375-3-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180602101155.26375-3-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, 02 Jun 2018, Marek Vasut wrote:

> The PMIC_DA9063 is a complete misnomer, it denotes the value of the
> DA9063 chip ID register, so rename it as such. It is also the value
> of chip ID register of DA9063L though, so drop the enum as all the
> DA9063 "models" share the same chip ID and thus the distinction will
> have to be made using DT or otherwise.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Steve Twiss <stwiss.opensource@diasemi.com>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Acked-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> V2: No change
> V3: No change
> ---
>  drivers/mfd/da9063-core.c            | 2 +-
>  drivers/mfd/da9063-i2c.c             | 2 +-
>  drivers/regulator/da9063-regulator.c | 2 +-
>  include/linux/mfd/da9063/core.h      | 4 +---
>  4 files changed, 4 insertions(+), 6 deletions(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
