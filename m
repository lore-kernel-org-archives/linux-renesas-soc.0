Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr80122.outbound.protection.outlook.com ([40.107.8.122]:42736
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726102AbeGKFsu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jul 2018 01:48:50 -0400
Subject: Re: [PATCH v2 1/3] i2c: recovery: if possible send STOP with recovery
 pulses
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eddie James <eajames@linux.vnet.ibm.com>
References: <20180710214217.1336-1-wsa+renesas@sang-engineering.com>
 <20180710214217.1336-2-wsa+renesas@sang-engineering.com>
From: Peter Rosin <peda@axentia.se>
Message-ID: <d7ed18c1-a45b-e27d-ca9f-23685364454d@axentia.se>
Date: Wed, 11 Jul 2018 07:46:07 +0200
MIME-Version: 1.0
In-Reply-To: <20180710214217.1336-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-07-10 23:42, Wolfram Sang wrote:
> I2C clients may misunderstand recovery pulses if they can't read SDA to
> bail out early. In the worst case, as a write operation. To avoid that
> and if we can write SDA, try to send STOP to avoid the
> misinterpretation.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/i2c-core-base.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 31d16ada6e7d..301285c54603 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -198,7 +198,16 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
>  
>  		val = !val;
>  		bri->set_scl(adap, val);
> -		ndelay(RECOVERY_NDELAY);
> +
> +		/*
> +		 * If we can set SDA, we will always create STOP here to ensure
> +		 * the additional pulses will do no harm. This is achieved by
> +		 * letting SDA follow SCL half a cycle later.
> +		 */
> +		ndelay(RECOVERY_NDELAY / 2);
> +		if (bri->set_sda)
> +			bri->set_sda(adap, val);
> +		ndelay(RECOVERY_NDELAY / 2);
>  	}
>  
>  	/* check if recovery actually succeeded */
> 
Hmmm, should not the ndelay before the loop also be split up in two like
this, with one ndelay(... / 2) on either side of the (possible) set_sda.
Not that it should matter, since SDA is presumably stuck low. But what if
it isn't?

I would also change the while (...) to

	for (i = 0; i < RECOVERY_CLK_CNT * 2; i++)

but both these "issues" are perhaps not related to this patch...

Either way,

Reviewed-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter
