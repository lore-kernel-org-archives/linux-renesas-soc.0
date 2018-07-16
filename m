Return-Path: <linux-i2c-owner@vger.kernel.org>
Subject: Re: [PATCH] i2c: recovery: make pin init look like STOP
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20180712174919.14447-1-wsa+renesas@sang-engineering.com>
From: Peter Rosin <peda@axentia.se>
Message-ID: <06ee47cb-16d0-99df-e18b-80e5a6e4eae9@axentia.se>
Date: Mon, 16 Jul 2018 11:40:55 +0200
MIME-Version: 1.0
In-Reply-To: <20180712174919.14447-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-07-12 19:49, Wolfram Sang wrote:
> When we we initialize the pins, make sure it looks like STOP by dividing
> the delay into halves. It shouldn't matter because SDA is expected to be
> held low by a device, but for super-safety, let's do it.
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
>  		bri->prepare_recovery(adap);
>  
>  	bri->set_scl(adap, scl);

For me, it would be more natural to have

	bri->set_scl(adap, 1);

> +	ndelay(RECOVERY_NDELAY / 2);
>  	if (bri->set_sda)
> -		bri->set_sda(adap, 1);
> -	ndelay(RECOVERY_NDELAY);
> +		bri->set_sda(adap, scl);

instead of changing this "1" to "scl"? Same-same, but it looks odd
to use scl as argument to sda (at least without that comment about
sda following scl that is present inside the loop below).

At the same time, your version make the code inside the loop the
same as this initializing code. Oh well, your call...

Either way

Reviewed-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

> +	ndelay(RECOVERY_NDELAY / 2);
>  
>  	/*
>  	 * By this time SCL is high, as we need to give 9 falling-rising edges
> 
