Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail1.bemta25.messagelabs.com ([195.245.230.66]:23116 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751849AbeFETun (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jun 2018 15:50:43 -0400
From: Steve Twiss <stwiss.opensource@diasemi.com>
To: Marek Vasut <marek.vasut@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Support Opensource <Support.Opensource@diasemi.com>
Subject: RE: [PATCH v3 05/10] mfd: da9063: Add DA9063L type
Date: Tue, 5 Jun 2018 19:50:40 +0000
Message-ID: <6ED8E3B22081A4459DAC7699F3695FB701941AD6DD@SW-EX-MBX02.diasemi.com>
References: <20180602101155.26375-1-marek.vasut+renesas@gmail.com>
 <20180602101155.26375-5-marek.vasut+renesas@gmail.com>
In-Reply-To: <20180602101155.26375-5-marek.vasut+renesas@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02 June 2018 11:12, Marek Vasut wrote,

> Subject: [PATCH v3 05/10] mfd: da9063: Add DA9063L type
> 
> Add type for DA9063L, which is a reduced variant of the DA9063
> without RTC block and with less regulators.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Steve Twiss <stwiss.opensource@diasemi.com>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> V2: No change
> V3: No change
> ---
>  include/linux/mfd/da9063/core.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/mfd/da9063/core.h b/include/linux/mfd/da9063/core.h
> index eb234582dcb2..c3e917dd1860 100644
> --- a/include/linux/mfd/da9063/core.h
> +++ b/include/linux/mfd/da9063/core.h
> @@ -33,6 +33,7 @@
> 
>  enum da9063_type {
>  	PMIC_TYPE_DA9063 = 0,
> +	PMIC_TYPE_DA9063L,
>  };
> 
>  enum da9063_variant_codes {
> --
> 2.16.2

Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>
