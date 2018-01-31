Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:36422 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755364AbeAaXKK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jan 2018 18:10:10 -0500
Received: by mail-lf0-f68.google.com with SMTP id t79so23306873lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2018 15:10:09 -0800 (PST)
Date: Thu, 1 Feb 2018 00:10:07 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] gmsl-yavta: Save output frames to .ppm files
Message-ID: <20180131231007.GB14701@bigcity.dyn.berto.se>
References: <20180131210116.28098-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180131210116.28098-1-laurent.pinchart@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thanks for your patch.

On 2018-01-31 23:01:16 +0200, Laurent Pinchart wrote:
> The script produces the PPM variant of PNM, the correct file extension
> is .ppm.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Applied.

> ---
>  gmsl-yavta.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/gmsl-yavta.sh b/gmsl-yavta.sh
> index a123bf52a16d..0ec0560441d8 100755
> --- a/gmsl-yavta.sh
> +++ b/gmsl-yavta.sh
> @@ -83,5 +83,5 @@ wait
>  
>  for f in $out/*bin; do
>      name=$(basename $f .bin)
> -    raw2rgbpnm -f YUYV -s 1280x800 $out/$name.bin $out/$name.pnm
> +    raw2rgbpnm -f YUYV -s 1280x800 $out/$name.bin $out/$name.ppm
>  done
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Regards,
Niklas S�derlund
