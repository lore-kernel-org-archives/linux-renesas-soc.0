Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34408 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbeHXTxf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 15:53:35 -0400
Received: by mail-lj1-f193.google.com with SMTP id f8-v6so7332904ljk.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Aug 2018 09:18:15 -0700 (PDT)
Date: Fri, 24 Aug 2018 18:18:13 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] vin-tests: Add capture format for parallel input
Message-ID: <20180824161812.GF1493@bigcity.dyn.berto.se>
References: <1535106262-13004-1-git-send-email-jacopo@jmondi.org>
 <1535106262-13004-4-git-send-email-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1535106262-13004-4-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thanks for your work.

On 2018-08-24 12:24:21 +0200, Jacopo Mondi wrote:
> Add configurable capture format to propagate_parallel() function.
> The capture format is the image format set on the VIN nodes.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  scripts/boards.sh    | 2 ++
>  scripts/vin-tests.sh | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/boards.sh b/scripts/boards.sh
> index 7eb3a27..b379af6 100644
> --- a/scripts/boards.sh
> +++ b/scripts/boards.sh
> @@ -28,6 +28,7 @@ case $info in
>          # FIXME: This is a hack and not the correct mbus format
>          # for V3M, but results in an image.
>          parallelformat="YUYV8_1X16"
> +	parallel_captureformat="RGB565"

I'm sorry I don't see the value of this change, am I missing something?  
There is no functional change but I assume you use this for something 
but until I figure out what I will leave this change hanging.

>          ;;
>      "Renesas Draak board based on r8a77995")
>          gen="gen3"
> @@ -35,6 +36,7 @@ case $info in
>          parallelname="adv7612 0-004c"
>          # FIXME: This is a hackfor D3, but results in an image.
>          parallelformat="YUYV8_1X16"
> +	parallel_captureformat="RGB565"
>          ;;
>      "Koelsch")
>          gen="gen2"
> diff --git a/scripts/vin-tests.sh b/scripts/vin-tests.sh
> index 0c5b29a..e7b7a48 100644
> --- a/scripts/vin-tests.sh
> +++ b/scripts/vin-tests.sh
> @@ -111,5 +111,5 @@ mc_propagate_parallel() {
>      echo "format: $format size: $size/$vinsize field: $field/$vinfield vdev: $vdev"
>  
>      $mediactl -d $mdev -V "$cam [fmt:$format/$size field:$field]"
> -    yavta -f RGB565 -s $vinsize --field $vinfield $vdev
> +    yavta -f $parallel_captureformat -s $vinsize --field $vinfield $vdev
>  }
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
