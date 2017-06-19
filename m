Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:36790 "EHLO
        mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751025AbdFSTqz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 15:46:55 -0400
Received: by mail-lf0-f44.google.com with SMTP id o83so61985351lff.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jun 2017 12:46:55 -0700 (PDT)
Date: Mon, 19 Jun 2017 21:46:52 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v1 07/12] media: rcar: vin: Add ID for parallel input on
 Gen3
Message-ID: <20170619194652.GG11365@bigcity.dyn.berto.se>
References: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
 <1497891889-8038-8-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1497891889-8038-8-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thanks for your patch.

On 2017-06-19 19:04:44 +0200, Jacopo Mondi wrote:
> Add an identifier for parallel input on Gen3.
> Also define the maximum number of available inputs on Gen3 boards.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/platform/rcar-vin/rcar-vin.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> index e7e600f..4361de9 100644
> --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> @@ -51,6 +51,8 @@ enum rvin_csi_id {
>  	RVIN_CSI40,
>  	RVIN_CSI41,
>  	RVIN_CSI_MAX,
> +	RVIN_PARALLEL_IN,
> +	RVIN_INPUT_MAX,

It feels a bit odd to add the parallel enum to the CSI-2 enums. If this 
is needed maybe the whole enum needs to be renamed?

>  	RVIN_NC, /* Not Connected */
>  };
>  
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
