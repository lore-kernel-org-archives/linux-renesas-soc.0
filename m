Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33950 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbeHXUC1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 16:02:27 -0400
Received: by mail-lj1-f193.google.com with SMTP id f8-v6so7352106ljk.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Aug 2018 09:27:04 -0700 (PDT)
Date: Fri, 24 Aug 2018 18:27:02 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/4] vin-tests: yavta-hdmi: Add VIN4 and parallel link
Message-ID: <20180824162702.GG1493@bigcity.dyn.berto.se>
References: <1535106262-13004-1-git-send-email-jacopo@jmondi.org>
 <1535106262-13004-5-git-send-email-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1535106262-13004-5-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thanks for your patch.

On 2018-08-24 12:24:22 +0200, Jacopo Mondi wrote:
> Add support for VIN4 to yavta-hdmi and check if format propagation should
> go through 'mc_propagate_parallel()' if the HDMI receiver chip is an
> ADV7612 one.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  yavta-hdmi | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/yavta-hdmi b/yavta-hdmi
> index fdec546..2e3b625 100755
> --- a/yavta-hdmi
> +++ b/yavta-hdmi
> @@ -33,14 +33,23 @@ case $vc in
>          dev=/dev/$vin3
>          csipad=4
>          ;;
> +    4)
> +        vinname=$vinname4
> +        dev=/dev/$vin4

I think you should also add a csipad declaration here as if the script 
is used on a board which is not D3 VIN4 would be connected to a CSI-2 
bus. Writing that I realise a new var 'csidev' or something would be 
needed here to expand this to cover the full range of VIN0-VIN7.

> +        ;;
>      *)
>          echo "Unkown VC '$vc'"
>          exit 1
>  esac
>  
>  mc_reset
> -mc_set_link "$csi40name" $csipad "$vinname" 1
> -mc_propagate_format "$hdminame" 1 "$txaname" 0 "$csi40name" $csipad "$vinname"
> +if [[ "$hdminame" == "adv7612 0-004c" ]]; then


You should use $parallelname here not $hdminame. Furthermore I thin you 
should check if the variable is empty or not and not target it for a 
specific board.

A good (or only) example of how I think this should be done can be found 
in test-qv4l2.sh.

         if [[ "$csi20name" != "" ]]; then
             mc_set_link "$csi20name" 1 "$vinname1" 1
             mc_propagate_cvbs "$vinname1"
             qv4l2 -d /dev/$vin1
         fi

         if [[ "$parallelname" != "" ]]; then
             mc_reset
             mc_set_link "$parallelname" 1 "$vinname0" 1
             mc_propagate_parallel "$vinname0"
             qv4l2 -d /dev/$vin0
         fi

> +	mc_set_link "$hdminame" 1  "$vinname" 1
> +	mc_propagate_parallel "$vinname"
> +else
> +	mc_set_link "$csi40name" $csipad "$vinname" 1
> +	mc_propagate_format "$hdminame" 1 "$txaname" 0 "$csi40name" $csipad "$vinname"
> +fi
>  
>  out=/tmp/vin-tests
>  rm -fr $out
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
