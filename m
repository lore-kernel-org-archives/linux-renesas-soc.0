Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:37104 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751771AbeFEISl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jun 2018 04:18:41 -0400
Received: by mail-wm0-f67.google.com with SMTP id r125-v6so3158981wmg.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jun 2018 01:18:40 -0700 (PDT)
Date: Tue, 5 Jun 2018 09:18:36 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-kernel@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Brown <broonie@kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 10/10] mfd: da9063: Add DA9063L support
Message-ID: <20180605081836.GP21163@dell>
References: <20180602101155.26375-1-marek.vasut+renesas@gmail.com>
 <20180602101155.26375-10-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180602101155.26375-10-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, 02 Jun 2018, Marek Vasut wrote:

> Add support for DA9063L, which is a reduced variant of the DA9063
> with less regulators and without RTC.
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
>  drivers/mfd/da9063-i2c.c | 2 ++
>  1 file changed, 2 insertions(+)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
