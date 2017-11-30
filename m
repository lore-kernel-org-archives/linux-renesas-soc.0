Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33031 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753296AbdK3QCz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Nov 2017 11:02:55 -0500
Received: by mail-lf0-f68.google.com with SMTP id 74so8490441lfs.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Nov 2017 08:02:54 -0800 (PST)
Date: Thu, 30 Nov 2017 17:02:52 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Kieran Bingham <kbingham@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] rcar-vin: Fix rvin_group_init
Message-ID: <20171130160252.GG22365@bigcity.dyn.berto.se>
References: <1512053944-14681-1-git-send-email-kbingham@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1512053944-14681-1-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thanks for your patch. I will squash this in with the original patch.

This was a left over from moving the video device registration from 
probe() to the async callbacks.

On 2017-11-30 14:59:04 +0000, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> rvin_group_init incorrectly calls rvin_group_update_links.
> 
> Repair by removing the call, and simply returning 0;
> 
> Fixes: 3135326aae2c ("rcar-vin: parse Gen3 OF and setup media graph")
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
> Hi Niklas,
> 
> A small fixup for your RCar VIN branch
> 
>  drivers/media/platform/rcar-vin/rcar-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index be2dfe2908e0..924722a0fdfa 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -926,7 +926,7 @@ static int rvin_group_init(struct rvin_dev *vin)
>  			goto error_vdev;
>  	}
>  
> -	return rvin_group_update_links(vin);
> +	return 0;
>  
>  error_vdev:
>  	rvin_v4l2_unregister(vin);
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
