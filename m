Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:45318 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728025AbeGPJzi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jul 2018 05:55:38 -0400
MIME-Version: 1.0
In-Reply-To: <20180712174919.14447-1-wsa+renesas@sang-engineering.com>
References: <20180712174919.14447-1-wsa+renesas@sang-engineering.com>
From: Ulrich Hecht <ulrich.hecht@gmail.com>
Date: Mon, 16 Jul 2018 11:29:06 +0200
Message-ID: <CAO3366yzKTChKNFm-NrSfDRoQqVEKhxvRsvS7Stc0Ug1x8qUVQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: recovery: make pin init look like STOP
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 12, 2018 at 7:49 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> When we we initialize the pins, make sure it looks like STOP by dividing
> the delay into halves. It shouldn't matter because SDA is expected to be
> held low by a device,

Yeah, what could possibly go wrong? :)

>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/i2c-core-base.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 51cbb0c158f2..e57231ccb32a 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -191,9 +191,10 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
>                 bri->prepare_recovery(adap);
>
>         bri->set_scl(adap, scl);
> +       ndelay(RECOVERY_NDELAY / 2);
>         if (bri->set_sda)
> -               bri->set_sda(adap, 1);
> -       ndelay(RECOVERY_NDELAY);
> +               bri->set_sda(adap, scl);
> +       ndelay(RECOVERY_NDELAY / 2);
>
>         /*
>          * By this time SCL is high, as we need to give 9 falling-rising edges
> --
> 2.11.0
>

Reviewed-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

CU
Uli
