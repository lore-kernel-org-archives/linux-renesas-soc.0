Return-Path: <SRS0=hAs+=QY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CA0C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Feb 2019 11:59:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EB1142195D
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Feb 2019 11:59:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bG2NeW7l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727467AbfBQL7N (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 17 Feb 2019 06:59:13 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49840 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725795AbfBQL7N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Feb 2019 06:59:13 -0500
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2D9249;
        Sun, 17 Feb 2019 12:59:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1550404751;
        bh=M3Ts8S6GohAgLfmTiFbq6s6I4mya3RRHlQKNnbzH058=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bG2NeW7lPYj5gN86vIxABhP6wAejdhlBwKTdJACaRMIrBsCOGzbFsnz1Y+qWIxnsD
         6uhLg/xCcQPT2QjgZRJQveajHdQBfgiPKwtAkCYoO4S/kze53ihmizx8Ftkz33385S
         TLB3fzbvjt5ilj0X0eFJewDmcNvGvwyr8K+QBJik=
Date:   Sun, 17 Feb 2019 13:59:07 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [VSP-Tests PATCH 5/7] vsp-lib: Allow forcing pixel perfect
 comparisons
Message-ID: <20190217115907.GA3514@pendragon.ideasonboard.com>
References: <20181204155146.9726-1-kieran.bingham@ideasonboard.com>
 <20181204155146.9726-6-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20181204155146.9726-6-kieran.bingham@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Tue, Dec 04, 2018 at 03:51:44PM +0000, Kieran Bingham wrote:
> Provide a means for the tester to request pixel perfect matches on tests.
> This can be either through setting the environment variable VSP_PIXEL_PERFECT, or
> by passing either '-p' or '--pixel-perfect' on the test command line.

What's the use case for this ?

> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  scripts/vsp-lib.sh | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
> index cf15a045ea8c..9140254c7459 100755
> --- a/scripts/vsp-lib.sh
> +++ b/scripts/vsp-lib.sh
> @@ -287,7 +287,11 @@ compare_frames() {
>  	params=${params//)/_}
>  	params=$pipe-$in_fmt-$out_fmt-$size$params
>  
> -	if [ x$__vsp_pixel_perfect != xtrue ] ; then
> +	# The system can hint when pixel-perfection is not supported,
> +	# however the user can override to force this requirement with
> +	# VSP_PIXEL_PERFECT=1 in the environment or by passing -p, or
> +	# --pixel-perfect on the commandline.
> +	if [ x$__vsp_pixel_perfect != xtrue -a x$VSP_PIXEL_PERFECT != x1 ] ; then
>  		method=fuzzy
>  	fi
>  
> @@ -1113,10 +1117,15 @@ case $1 in
>  		export VSP_KEEP_FRAMES=1
>  		shift
>  		;;
> +	-p|--pixel-perfect)
> +		export VSP_PIXEL_PERFECT=1
> +		shift
> +		;;
>  	-h|--help)
>  		echo "$(basename $0): VSP Test library"
>  		echo "  -x|--debug          enable shell debug"
>  		echo "  -k|--keep-frames    keep generated and captured frames"
> +		echo "  -p|--pixel-perfect  frames must match with pixel perfection"
>  		echo "  -h|--help           this help"
>  		exit
>  		shift

-- 
Regards,

Laurent Pinchart
