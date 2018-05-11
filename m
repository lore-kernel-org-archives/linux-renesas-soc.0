Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:39245 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752866AbeEKLR4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 May 2018 07:17:56 -0400
Received: by mail-lf0-f68.google.com with SMTP id j193-v6so7387491lfg.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 May 2018 04:17:55 -0700 (PDT)
Date: Fri, 11 May 2018 13:17:53 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/5] vin-tests: Add function to propagate digital format
Message-ID: <20180511111753.GF18974@bigcity.dyn.berto.se>
References: <1526032839-14536-1-git-send-email-jacopo@jmondi.org>
 <1526032839-14536-3-git-send-email-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1526032839-14536-3-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thanks for your patch,

On 2018-05-11 12:00:36 +0200, Jacopo Mondi wrote:
> Add function to vin-tests.sh to propagate the HDMI format for the
> digital input use case. This is useful for D3 when capturing HDMI input
> from adv7612 at 640x480 resolution.

Why is there a need to hard code the HDMI capture format? Can't the 
existing propagate functions which checks the format of the video source 
be extended to support the parallel capture tests?

> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  scripts/vin-tests.sh | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/scripts/vin-tests.sh b/scripts/vin-tests.sh
> index 4a38d43..52e25b9 100644
> --- a/scripts/vin-tests.sh
> +++ b/scripts/vin-tests.sh
> @@ -206,3 +206,12 @@ mc_propagate_cvbs() {
>  
>      mc_propagate_format "$cvbsname" 8 "$txbname" 0 "$csi20name" 1 "$vin"
>  }
> +
> +# HDMI input from ADV7612 (D3 Draak)
> +mc_propagate_hdmi_digital() {
> +    vin="$1"
> +    vdev=$($mediactl -d $mdev -e "$vin" )
> +
> +    media-ctl -v -d $mdev -V "'$hdminame':1 [fmt:RGB888_1X24/640x480 field:none]"
> +    yavta -f XBGR32 -s 640x480 --field none $vdev
> +}
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
