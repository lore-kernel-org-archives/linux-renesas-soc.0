Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35727 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbeHXTru (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 15:47:50 -0400
Received: by mail-lj1-f193.google.com with SMTP id p10-v6so7292638ljg.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Aug 2018 09:12:31 -0700 (PDT)
Date: Fri, 24 Aug 2018 18:12:29 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] vin-tests: Add support for D3 Draak
Message-ID: <20180824161228.GD1493@bigcity.dyn.berto.se>
References: <1535106262-13004-1-git-send-email-jacopo@jmondi.org>
 <1535106262-13004-2-git-send-email-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1535106262-13004-2-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thanks for your work.

On 2018-08-24 12:24:19 +0200, Jacopo Mondi wrote:
> Add support for D3 Draak board.
> 
> Draak has its HDMI input connected to an ADV7612 which connects to VIN4
> parallel data inputs.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  scripts/boards.sh | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/scripts/boards.sh b/scripts/boards.sh
> index 26fdab9..7eb3a27 100644
> --- a/scripts/boards.sh
> +++ b/scripts/boards.sh
> @@ -29,6 +29,13 @@ case $info in
>          # for V3M, but results in an image.
>          parallelformat="YUYV8_1X16"
>          ;;
> +    "Renesas Draak board based on r8a77995")
> +        gen="gen3"
> +        vins="4"
> +        parallelname="adv7612 0-004c"
> +        # FIXME: This is a hackfor D3, but results in an image.
> +        parallelformat="YUYV8_1X16"
> +        ;;
>      "Koelsch")
>          gen="gen2"
>  
> @@ -70,6 +77,8 @@ if [[ "$gen" == "gen3" ]]; then
>  
>          txaname="adv748x 0-0070 txa"
>          txbname="adv748x 0-0070 txb"
> +    elif [[ "$info" == "Renesas Draak board based on r8a77995" ]]; then
> +        hdminame="adv7612 0-004c"

I don't have the D3 schematics at hand but this feels wrong. Why do you 
define the adv7612 as both a parallel and CSI-2 source? IIRC the D3 have 
no CSI-2 IP?

The reason this exists for V3M is that it has both parallel input in the 
form of a adv7612 and a CSI-2 input in the for of a adv7482 connected to 
the CSI40 IP.

>      else
>          cvbsname="adv748x 4-0070 afe"
>          hdminame="adv748x 4-0070 hdmi"
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
