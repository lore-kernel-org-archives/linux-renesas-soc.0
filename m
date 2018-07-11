Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr40112.outbound.protection.outlook.com ([40.107.4.112]:21983
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726360AbeGKGEy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jul 2018 02:04:54 -0400
Subject: Re: [PATCH v2] i2c: recovery: rename variable for easier
 understanding
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20180710222722.7852-1-wsa+renesas@sang-engineering.com>
From: Peter Rosin <peda@axentia.se>
Message-ID: <988eca90-88c3-1b52-ed97-af4a47d8f591@axentia.se>
Date: Wed, 11 Jul 2018 08:01:54 +0200
MIME-Version: 1.0
In-Reply-To: <20180710222722.7852-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-07-11 00:27, Wolfram Sang wrote:
> While refactoring the routine before, it occured to me that this will
> make the code much easier to understand.

Acked-by: Peter Rosin <peda@axentia.se>
 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Change since V1:
> * rebased to the new recovery refactoring
> 
> Branch is here:
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i2c/recovery/write-byte-fix
> 
>  drivers/i2c/i2c-core-base.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 59f8dfc5be36..57538d72f2e5 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -185,12 +185,12 @@ static int i2c_generic_bus_free(struct i2c_adapter *adap)
>  int i2c_generic_scl_recovery(struct i2c_adapter *adap)
>  {
>  	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
> -	int i = 0, val = 1, ret;
> +	int i = 0, scl = 1, ret;
>  
>  	if (bri->prepare_recovery)
>  		bri->prepare_recovery(adap);
>  
> -	bri->set_scl(adap, val);
> +	bri->set_scl(adap, scl);
>  	if (bri->set_sda)
>  		bri->set_sda(adap, 1);
>  	ndelay(RECOVERY_NDELAY);
> @@ -199,7 +199,7 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
>  	 * By this time SCL is high, as we need to give 9 falling-rising edges
>  	 */
>  	while (i++ < RECOVERY_CLK_CNT * 2) {
> -		if (val) {
> +		if (scl) {
>  			/* SCL shouldn't be low here */
>  			if (!bri->get_scl(adap)) {
>  				dev_err(&adap->dev,
> @@ -209,8 +209,8 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
>  			}
>  		}
>  
> -		val = !val;
> -		bri->set_scl(adap, val);
> +		scl = !scl;
> +		bri->set_scl(adap, scl);
>  
>  		/*
>  		 * If we can set SDA, we will always create STOP here to ensure
> @@ -220,10 +220,10 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
>  		 */
>  		ndelay(RECOVERY_NDELAY / 2);
>  		if (bri->set_sda)
> -			bri->set_sda(adap, val);
> +			bri->set_sda(adap, scl);
>  		ndelay(RECOVERY_NDELAY / 2);
>  
> -		if (val) {
> +		if (scl) {
>  			ret = i2c_generic_bus_free(adap);
>  			if (ret == 0)
>  				break;
> 
