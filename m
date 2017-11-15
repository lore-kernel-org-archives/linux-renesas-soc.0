Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:49090 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758861AbdKOQba (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Nov 2017 11:31:30 -0500
Received: by mail-lf0-f66.google.com with SMTP id r135so26935413lfe.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Nov 2017 08:31:30 -0800 (PST)
Date: Wed, 15 Nov 2017 17:31:27 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Kieran Bingham <kbingham@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH 1/3] tools: 8camera-status: Fix write failure
 mis-allocations
Message-ID: <20171115163127.GG12677@bigcity.dyn.berto.se>
References: <1510756711-6488-1-git-send-email-kbingham@kernel.org>
 <1510756711-6488-2-git-send-email-kbingham@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1510756711-6488-2-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thanks for your patch, applied.

On 2017-11-15 14:38:29 +0000, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Debug prints of the max9271_write call are appearing in the failure counts.
> 
> Fix the 'catcher' so that it is more specific to the failure
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  tools/8camera-status | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/8camera-status b/tools/8camera-status
> index 234b8a0cab2b..cdfe76ef286f 100755
> --- a/tools/8camera-status
> +++ b/tools/8camera-status
> @@ -21,7 +21,7 @@ BEGIN {
>  	print
>  }
>  
> -/max9271_write/ {
> +/max9271_write.*write failed/ {
>  	max9271_write_fail++
>  	print
>  }
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
