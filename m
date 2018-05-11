Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:36774 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753106AbeEKLWE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 May 2018 07:22:04 -0400
Received: by mail-lf0-f66.google.com with SMTP id t129-v6so7407426lff.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 May 2018 04:22:03 -0700 (PDT)
Date: Fri, 11 May 2018 13:22:01 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 5/5] convert: Accept destination format as parameter
Message-ID: <20180511112201.GI18974@bigcity.dyn.berto.se>
References: <1526032839-14536-1-git-send-email-jacopo@jmondi.org>
 <1526032839-14536-6-git-send-email-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1526032839-14536-6-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thanks for your work.

On 2018-05-11 12:00:39 +0200, Jacopo Mondi wrote:
> Accept the destination image format as thrid parameter of the convert
> function.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Acked-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  convert.sh | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/convert.sh b/convert.sh
> index 4059868..878ac63 100755
> --- a/convert.sh
> +++ b/convert.sh
> @@ -2,6 +2,7 @@
>  
>  F=$(dirname $1)/$(basename $1 .bin)
>  FRAME_SIZE=${2:-1280x720}
> +FORMAT=${3:-RGB565}
>  
> -raw2rgbpnm -f RGB565 -s $FRAME_SIZE $F.bin $F.pnm
> +raw2rgbpnm -f $FORMAT -s $FRAME_SIZE $F.bin $F.pnm
>  convert $F.pnm $F.png
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
