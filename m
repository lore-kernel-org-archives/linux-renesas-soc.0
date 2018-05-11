Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:40622 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750852AbeEKLQq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 May 2018 07:16:46 -0400
Received: by mail-lf0-f67.google.com with SMTP id p85-v6so7376530lfg.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 May 2018 04:16:45 -0700 (PDT)
Date: Fri, 11 May 2018 13:16:43 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/5] boards: Add R8A77995 D3 Draak board
Message-ID: <20180511111643.GE18974@bigcity.dyn.berto.se>
References: <1526032839-14536-1-git-send-email-jacopo@jmondi.org>
 <1526032839-14536-2-git-send-email-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1526032839-14536-2-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thanks for your patch.

On 2018-05-11 12:00:35 +0200, Jacopo Mondi wrote:
> Add support for R-Car Gen3 Draak board based on R8A77995 SoC.
> Define additional variables such as which vin should be used to perform
> capture operations and which is the destination image format for each
> board. These variables will be used later to generalize the image
> scripts.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  scripts/boards.sh | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/scripts/boards.sh b/scripts/boards.sh
> index e078ba5..f265463 100644
> --- a/scripts/boards.sh
> +++ b/scripts/boards.sh
> @@ -16,6 +16,8 @@ case $info in
>          vin6=$(basename /sys/devices/platform/soc/e6ef6000.video/video4linux/video*)
>          vin7=$(basename /sys/devices/platform/soc/e6ef7000.video/video4linux/video*)
>  
> +        capture_vin="${vin0}"
> +

I don't like this I'm afraid :-(

I think if there is a need to switch which VIN is used to capture from 
it should be an argument to the capture function and not a variable in 
board.sh.

>          vinname0="VIN0 output"
>          vinname1="VIN1 output"
>          vinname2="VIN2 output"
> @@ -35,6 +37,8 @@ case $info in
>  
>          txaname="adv748x 4-0070 txa"
>          txbname="adv748x 4-0070 txb"
> +
> +        convert_format="RGB565"
>          ;;
>  
>      "Renesas Salvator-X 2nd version board based on r8a7795 ES2.0+")
> @@ -50,6 +54,8 @@ case $info in
>          vin6=$(basename /sys/devices/platform/soc/e6ef6000.video/video4linux/video*)
>          vin7=$(basename /sys/devices/platform/soc/e6ef7000.video/video4linux/video*)
>  
> +        capture_vin="${vin0}"
> +
>          vinname0="VIN0 output"
>          vinname1="VIN1 output"
>          vinname2="VIN2 output"
> @@ -68,6 +74,8 @@ case $info in
>  
>          txaname="adv748x 4-0070 txa"
>          txbname="adv748x 4-0070 txb"
> +
> +        convert_format="RGB565"
>          ;;
>  
>      "Renesas Salvator-X board based on r8a7796")
> @@ -82,6 +90,8 @@ case $info in
>          vin6=$(basename /sys/devices/platform/soc/e6ef6000.video/video4linux/video*)
>          vin7=$(basename /sys/devices/platform/soc/e6ef7000.video/video4linux/video*)
>  
> +        capture_vin="${vin0}"
> +
>          vinname0="VIN0 output"
>          vinname1="VIN1 output"
>          vinname2="VIN2 output"
> @@ -99,6 +109,8 @@ case $info in
>  
>          txaname="adv748x 4-0070 txa"
>          txbname="adv748x 4-0070 txb"
> +
> +        convert_format="RGB565"
>          ;;
>  
>      "Renesas Eagle board based on r8a77970")
> @@ -109,6 +121,8 @@ case $info in
>          vin2=$(basename /sys/devices/platform/soc/e6ef2000.video/video4linux/video*)
>          vin3=$(basename /sys/devices/platform/soc/e6ef3000.video/video4linux/video*)
>  
> +        capture_vin="${vin0}"
> +
>          vinname0="VIN0 output"
>          vinname1="VIN1 output"
>          vinname2="VIN2 output"
> @@ -121,6 +135,23 @@ case $info in
>  
>          txaname="adv748x 0-0070 txa"
>          txbname="adv748x 0-0070 txb"
> +
> +        convert_format="RGB565"
> +        ;;
> +
> +    "Renesas Draak board based on r8a77995")
> +        echo "Board: D3"
> +        gen="gen3"
> +        digital=1
> +        vin4=$(basename /sys/devices/platform/soc/e6ef4000.video/video4linux/video*)
> +
> +        capture_vin="${vin4}"
> +
> +        vinname4="VIN4 output"
> +
> +        hdminame="adv7612 0-004c"
> +
> +        convert_format="BGR32"
>          ;;
>  
>      "Koelsch")
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
