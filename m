Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-by2nam01on0078.outbound.protection.outlook.com ([104.47.34.78]:42836
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750796AbeBEWfl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 17:35:41 -0500
Subject: Re: [PATCH 4/4] net: amd-xgbe: fix comparison to bitshift when
 dealing with a mask
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
        linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
        David Miller <davem@davemloft.net>
References: <20180205201002.23621-1-wsa+renesas@sang-engineering.com>
 <20180205201002.23621-5-wsa+renesas@sang-engineering.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
Message-ID: <048aded0-9b5e-60f5-ec67-a00a4858ffac@amd.com>
Date: Mon, 5 Feb 2018 16:35:34 -0600
MIME-Version: 1.0
In-Reply-To: <20180205201002.23621-5-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2/5/2018 2:10 PM, Wolfram Sang wrote:
> Due to a typo, the mask was destroyed by a comparison instead of a bit
> shift.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Excellent find.

Acked-by: Tom Lendacky <thomas.lendacky@amd.com>

David, this should also be applied to the 4.14 and 4.15 stable releases.

Thanks,
Tom

> ---
> Only build tested. To be applied individually per subsystem.
> 
>  drivers/net/ethernet/amd/xgbe/xgbe-drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-drv.c b/drivers/net/ethernet/amd/xgbe/xgbe-drv.c
> index 7a3ebfd236f5eb..100adee778dfd6 100644
> --- a/drivers/net/ethernet/amd/xgbe/xgbe-drv.c
> +++ b/drivers/net/ethernet/amd/xgbe/xgbe-drv.c
> @@ -595,7 +595,7 @@ static void xgbe_isr_task(unsigned long data)
>  
>  		reissue_mask = 1 << 0;
>  		if (!pdata->per_channel_irq)
> -			reissue_mask |= 0xffff < 4;
> +			reissue_mask |= 0xffff << 4;
>  
>  		XP_IOWRITE(pdata, XP_INT_REISSUE_EN, reissue_mask);
>  	}
> 
