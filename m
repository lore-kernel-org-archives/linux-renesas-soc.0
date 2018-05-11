Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:37684 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753142AbeEKLVe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 May 2018 07:21:34 -0400
Received: by mail-lf0-f68.google.com with SMTP id r2-v6so7402982lff.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 May 2018 04:21:33 -0700 (PDT)
Date: Fri, 11 May 2018 13:21:31 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/5] yavta-hdmi: Generalize capture parameters
Message-ID: <20180511112131.GH18974@bigcity.dyn.berto.se>
References: <1526032839-14536-1-git-send-email-jacopo@jmondi.org>
 <1526032839-14536-5-git-send-email-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1526032839-14536-5-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thanks for your work.

On 2018-05-11 12:00:38 +0200, Jacopo Mondi wrote:
> Use the newly defined ${capture_vin} and ${convert_format} to generalize
> capture operations from HDMI sources.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  yavta-hdmi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/yavta-hdmi b/yavta-hdmi
> index a0a09a3..5806a0d 100755
> --- a/yavta-hdmi
> +++ b/yavta-hdmi
> @@ -11,10 +11,10 @@ out=/tmp/vin-tests
>  rm -fr $out
>  mkdir -p $out
>  
> -size=$(v4l2-ctl --all -d /dev/$vin0  | awk '/Width/{print $3}' | tr '/' 'x')
> +size=$(v4l2-ctl --all -d /dev/$capture_vin  | awk '/Width/{print $3}' | tr '/' 'x')
>  
> -yavta -n 4 --capture=10 /dev/$vin0 --file=$out/frame-#.bin $*
> +yavta -n 4 --capture=10 /dev/$capture_vin --file=$out/frame-#.bin $*
>  
>  strings $out/frame*.bin | head | wc -l
>  md5sum $out/frame*.bin
> -for f in $out/frame*.bin ; do $base/convert.sh $f $size ; done;
> +for f in $out/frame*.bin ; do $base/convert.sh $f $size $convert_format; done;

As stated before I don't like that $convert_format comes from board.sh 
but that it can be provided to convert.sh I do like.

Acked-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
