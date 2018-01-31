Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:34426 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754837AbeAaXJd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jan 2018 18:09:33 -0500
Received: by mail-lf0-f68.google.com with SMTP id k19so23324307lfj.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2018 15:09:32 -0800 (PST)
Date: Thu, 1 Feb 2018 00:09:30 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] gmsl-yavta: Remove bash-isms
Message-ID: <20180131230930.GA14701@bigcity.dyn.berto.se>
References: <20180131210108.28048-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180131210108.28048-1-laurent.pinchart@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thanks for your patch.

On 2018-01-31 23:01:08 +0200, Laurent Pinchart wrote:
> The script contains two bash-specific constructs:
> 
> - Replace ${!var} expansion with eval
> - Initialize conf1234 and conf5678 variables to avoid empty argument to
>   -ne test
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Applied.

> ---
>  gmsl-yavta.sh | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/gmsl-yavta.sh b/gmsl-yavta.sh
> index 635ab72feb07..a123bf52a16d 100755
> --- a/gmsl-yavta.sh
> +++ b/gmsl-yavta.sh
> @@ -22,13 +22,17 @@ function conf() {
>  
>  function capture() {
>      VID="$1"
> +    vid=$(eval echo \$$VID)
>  
> -    yavta -f YUYV -s 1280x800 -c10 --skip 7 --file="$out/$VID-#.bin" /dev/${!VID} &
> +    yavta -f YUYV -s 1280x800 -c10 --skip 7 --file="$out/$VID-#.bin" /dev/$vid &
>  }
>  
>  mc_reset
>  
>  # Need to configure all formats going through each MAX9286
> +conf1234=0
> +conf5678=0
> +
>  for cam in "$@"; do
>  	case $cam in
>          1|2|3|4)
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Regards,
Niklas S�derlund
