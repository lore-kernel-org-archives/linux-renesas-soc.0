Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:40128 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751453AbeFEHVk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jun 2018 03:21:40 -0400
Received: by mail-wm0-f67.google.com with SMTP id n5-v6so2920979wmc.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jun 2018 00:21:40 -0700 (PDT)
Date: Tue, 5 Jun 2018 08:21:37 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-kernel@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Brown <broonie@kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 04/10] mfd: da9063: Replace model with type
Message-ID: <20180605072137.GJ21163@dell>
References: <20180602101155.26375-1-marek.vasut+renesas@gmail.com>
 <20180602101155.26375-4-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180602101155.26375-4-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, 02 Jun 2018, Marek Vasut wrote:

> The model number stored in the struct da9063 is the same for all
> variants of the da9063 since it is the chip ID, which is always
> the same. Replace that with a separate identifier instead, which
> allows us to discern the DA9063 variants by setting the type
> based on either DT match or otherwise.
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
> V2: Drop useless cast of id->driver_data
> V3: Fix kernel 0day error , s/dev_model/type/
> ---
>  drivers/mfd/da9063-core.c            | 1 -
>  drivers/mfd/da9063-i2c.c             | 5 +++--
>  drivers/regulator/da9063-regulator.c | 6 +++---
>  include/linux/mfd/da9063/core.h      | 6 +++++-
>  4 files changed, 11 insertions(+), 7 deletions(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
