Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:46264 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752752AbeEKLUR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 May 2018 07:20:17 -0400
Received: by mail-lf0-f67.google.com with SMTP id x7-v6so7351334lff.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 May 2018 04:20:16 -0700 (PDT)
Date: Fri, 11 May 2018 13:20:14 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/5] gen3-links: Support linking for digital input
Message-ID: <20180511112014.GG18974@bigcity.dyn.berto.se>
References: <1526032839-14536-1-git-send-email-jacopo@jmondi.org>
 <1526032839-14536-4-git-send-email-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1526032839-14536-4-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,


On 2018-05-11 12:00:37 +0200, Jacopo Mondi wrote:
> Add support for linking the digital subdevice to a vin instance. This is
> useful for D3 board.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

As you might have noticed the vin-tests are in need of a big rework. But 
for now I'm happy with the digital property in board.sh. Or maybe we 
should start the renaming process of s/digital/parallel/ as it was a 
really bad name on my behalf to begin with. In any case.

Acked-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  gen3-links.sh | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/gen3-links.sh b/gen3-links.sh
> index cfcdeb7..0ec30e4 100755
> --- a/gen3-links.sh
> +++ b/gen3-links.sh
> @@ -8,8 +8,14 @@ source $base/scripts/vin-tests.sh
>  source $base/scripts/boards.sh
>  
>  mc_reset
> -mc_set_link "$csi40name" 1 "$vinname0" 1
> -mc_set_link "$csi20name" 1 "$vinname1" 1
>  
> -mc_propagate_hdmi "$vinname0"
> -mc_propagate_cvbs "$vinname1"
> +if [[ $digital -eq 1 ]]; then
> +	mc_set_link "$hdminame" 1  "$vinname4" 1
> +	mc_propagate_hdmi_digital "$vinname4"
> +else
> +	mc_set_link "$csi40name" 1 "$vinname0" 1
> +	mc_set_link "$csi20name" 1 "$vinname1" 1
> +
> +	mc_propagate_hdmi "$vinname0"
> +	mc_propagate_cvbs "$vinname1"
> +fi
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
