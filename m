Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:49224 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758877AbdKOQbs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Nov 2017 11:31:48 -0500
Received: by mail-lf0-f66.google.com with SMTP id w21so26895513lfc.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Nov 2017 08:31:47 -0800 (PST)
Date: Wed, 15 Nov 2017 17:31:45 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Kieran Bingham <kbingham@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH 2/3] tools: 8camera-status: Expand to 9 cameras
Message-ID: <20171115163145.GH12677@bigcity.dyn.berto.se>
References: <1510756711-6488-1-git-send-email-kbingham@kernel.org>
 <1510756711-6488-3-git-send-email-kbingham@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1510756711-6488-3-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thanks for your patch, applied.

On 2017-11-15 14:38:30 +0000, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> The 8th camera has an address conflict on the Salvator-X.
> As such it has been moved to the right by one address,
> Include this '9th' camera in the reporting status
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  tools/8camera-status | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/8camera-status b/tools/8camera-status
> index cdfe76ef286f..846673578f09 100755
> --- a/tools/8camera-status
> +++ b/tools/8camera-status
> @@ -1,7 +1,7 @@
>  #!/usr/bin/awk -f
>  
>  BEGIN {
> -	for (x = 0; x <= 8; x++)
> +	for (x = 0; x <= 9; x++)
>  		cameras[x] = "-"
>  }
>  
> @@ -67,15 +67,15 @@ function ParseProbe ( line )
>  
>  function PrintCameras()
>  {
> -	print "===================================="
> -	print "| 1 | 2 | 3 | 4 |  | 5 | 6 | 7 | 8 |"
> -	for (x=1; x <= 8; x++) {
> +	print "========================================"
> +	print "| 1 | 2 | 3 | 4 |  | 5 | 6 | 7 | 8 | 9 |"
> +	for (x=1; x <= 9; x++) {
>  		printf "| " cameras[x] " "
>  		if (x == 4)
>  			printf("|  ")
>  	}
>  	printf "|\n"
> -	print "===================================="
> +	print "======================================="
>  }
>  
>  function Summarise() {
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
