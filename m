Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60944 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751242AbdH3JdG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Aug 2017 05:33:06 -0400
Subject: Re: [PATCH 1/3] vsp-lib: Use the correct media device name to count
 BRU inputs
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
References: <20170824093043.8606-1-laurent.pinchart@ideasonboard.com>
 <20170824093043.8606-2-laurent.pinchart@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <2a3255f3-b082-2abb-fd00-c9f47d187c0c@ideasonboard.com>
Date: Wed, 30 Aug 2017 10:33:01 +0100
MIME-Version: 1.0
In-Reply-To: <20170824093043.8606-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thanks for the patch.

On 24/08/17 10:30, Laurent Pinchart wrote:
> Use the media device under test, not the default media0.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Looks good, and looks like this is the only use of media-ctl directly.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  scripts/vsp-lib.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
> index 726ff793b2ce..fa4a6984e1bb 100755
> --- a/scripts/vsp-lib.sh
> +++ b/scripts/vsp-lib.sh
> @@ -54,7 +54,7 @@ vsp1_count_wpfs() {
>  }
>  
>  vsp1_count_bru_inputs() {
> -	local num_pads=`media-ctl -p | grep 'entity.*bru' | sed 's/.*(\([0-9]\) pads.*/\1/'`
> +	local num_pads=`$mediactl -d $mdev -p | grep 'entity.*bru' | sed 's/.*(\([0-9]\) pads.*/\1/'`
>  	echo $((num_pads-1))
>  }
>  
> 
