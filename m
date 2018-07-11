Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr70095.outbound.protection.outlook.com ([40.107.7.95]:7824
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726294AbeGKGDl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jul 2018 02:03:41 -0400
Subject: Re: [PATCH v2 3/3] i2c: recovery: refactor recovery function
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eddie James <eajames@linux.vnet.ibm.com>
References: <20180710214217.1336-1-wsa+renesas@sang-engineering.com>
 <20180710214217.1336-4-wsa+renesas@sang-engineering.com>
From: Peter Rosin <peda@axentia.se>
Message-ID: <0229b6da-7036-2b95-4fc4-8cf57d0b7c08@axentia.se>
Date: Wed, 11 Jul 2018 08:00:51 +0200
MIME-Version: 1.0
In-Reply-To: <20180710214217.1336-4-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-07-10 23:42, Wolfram Sang wrote:
> After exiting the while loop, we checked if recovery was successful and
> sent a STOP to the clients. Meanwhile however, we send a STOP after
> every pulse, so it is not needed after the loop. If we move the check
> for a free bus to the end of the while loop, we can shorten and simplify
> the logic. It is still ensured that at least one STOP will be sent to
> the wire even if SDA was not stuck low.

Well, there will be no STOP if ->set_sda isn't implemented, but that case
is also handled equivalently after this patch AFAICT, so

Reviewed-by: Peter Rosin <peda@axentia.se>

> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/i2c-core-base.c | 24 ++++++------------------
>  1 file changed, 6 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 871a9731894f..c7995efd58ea 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -191,9 +191,6 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
>  				ret = -EBUSY;
>  				break;
>  			}
> -			/* Break if SDA is high */
> -			if (bri->get_sda && bri->get_sda(adap))
> -				break;
>  		}
>  
>  		val = !val;
> @@ -209,22 +206,13 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
>  		if (bri->set_sda)
>  			bri->set_sda(adap, val);
>  		ndelay(RECOVERY_NDELAY / 2);
> -	}
> -
> -	/* check if recovery actually succeeded */
> -	if (bri->get_sda && !bri->get_sda(adap))
> -		ret = -EBUSY;
>  
> -	/* If all went well, send STOP for a sane bus state. */
> -	if (ret == 0 && bri->set_sda) {
> -		bri->set_scl(adap, 0);
> -		ndelay(RECOVERY_NDELAY / 2);
> -		bri->set_sda(adap, 0);
> -		ndelay(RECOVERY_NDELAY / 2);
> -		bri->set_scl(adap, 1);
> -		ndelay(RECOVERY_NDELAY / 2);
> -		bri->set_sda(adap, 1);
> -		ndelay(RECOVERY_NDELAY / 2);
> +		/* Break if SDA is high */
> +		if (val && bri->get_sda) {
> +			ret = bri->get_sda(adap) ? 0 : -EBUSY;
> +			if (ret == 0)
> +				break;
> +		}
>  	}
>  
>  	if (bri->unprepare_recovery)
> 
