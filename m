Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:38936 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751704AbeFRQDX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jun 2018 12:03:23 -0400
MIME-Version: 1.0
In-Reply-To: <20180616133757.5994-3-wsa+renesas@sang-engineering.com>
References: <20180616133757.5994-1-wsa+renesas@sang-engineering.com> <20180616133757.5994-3-wsa+renesas@sang-engineering.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 18 Jun 2018 12:03:22 -0400
Message-ID: <CADnq5_Nfee+r-FC_c94-ByWqC9GBONr+Acr15ATb+5yAw_bWMA@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: algos: bit: mention our experience about initial states
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux I2C <linux-i2c@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Maling list - DRI developers
        <dri-devel@lists.freedesktop.org>,
        Sergey Larin <cerg2010cerg2010@mail.ru>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Jun 16, 2018 at 9:37 AM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> So, if somebody wants to re-implement this in the future, we pinpoint to
> a problem case.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/i2c/algos/i2c-algo-bit.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/i2c/algos/i2c-algo-bit.c b/drivers/i2c/algos/i2c-algo-bit.c
> index 0c0eb16d710f..6ec65adaba49 100644
> --- a/drivers/i2c/algos/i2c-algo-bit.c
> +++ b/drivers/i2c/algos/i2c-algo-bit.c
> @@ -647,6 +647,11 @@ static int __i2c_bit_add_bus(struct i2c_adapter *adap,
>         if (bit_adap->getscl == NULL)
>                 adap->quirks = &i2c_bit_quirk_no_clk_stretch;
>
> +       /*
> +        * We tried forcing SCL/SDA to an initial state here. But that caused a
> +        * regression, sadly. Check Bugzilla #200045 for details.
> +        */
> +
>         ret = add_adapter(adap);
>         if (ret < 0)
>                 return ret;
> --
> 2.11.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
