Return-Path: <SRS0=hAs+=QY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BF7C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Feb 2019 02:48:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C311221917
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Feb 2019 02:48:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HNvwcrAR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbfBQCsP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 16 Feb 2019 21:48:15 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45134 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbfBQCsP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Feb 2019 21:48:15 -0500
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2848949;
        Sun, 17 Feb 2019 03:48:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1550371693;
        bh=1VMKsv0n+GsDtYOuT/0WQX2NMZz002lJEQHv7YY+vHI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HNvwcrARh9SkyLAgPFsFp6SHaU6+PwOmuAZ/Qz29Cukzmlzcg0yO2xwtgcHkiax4H
         HkOkEqm3QKpJvIl2cmnr2wF326ZUvWYsOluTtTlQEvP8pBcUoIpMcyymeBy6t7Os4T
         gfwtzGPsFVpOW28+B0KsztFIGg5kK/cLl6xNEniM=
Date:   Sun, 17 Feb 2019 04:48:09 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [VSP-Tests PATCH 3/7] vsp-lib: Provide command line argument
 parsing
Message-ID: <20190217024809.GD20463@pendragon.ideasonboard.com>
References: <20181204155146.9726-1-kieran.bingham@ideasonboard.com>
 <20181204155146.9726-4-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20181204155146.9726-4-kieran.bingham@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Tue, Dec 04, 2018 at 03:51:42PM +0000, Kieran Bingham wrote:
> Extend the vsp-lib to support command line parsing for all tests.  The
> arguments parsed here should be common to all tests, and initially
> provide shell level verbose debug output, and the option to easily keep
> frames output by the VSP1.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  scripts/vsp-lib.sh | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
> index 0f3992a7827e..56969606382f 100755
> --- a/scripts/vsp-lib.sh
> +++ b/scripts/vsp-lib.sh
> @@ -1094,3 +1094,37 @@ test_complete() {
>  test_run() {
>  	test_main | ./logger.sh error >> $logfile
>  }
> +
> +# ------------------------------------------------------------------------------
> +# Common argument parsing
> +#
> +# non-recognised arguments are restored, to allow tests to implement their own
> +# parsing if necessary.
> +
> +POSITIONAL=()

This work in bash only :-( Any chance to implement a solution that would
work in ash too ?

> +while [[ $# -gt 0 ]]
> +do
> +case $1 in
> +	-x|--debug)
> +		set -x;
> +		shift
> +		;;
> +	-k|--keep-frames)
> +		export VSP_KEEP_FRAMES=1
> +		shift
> +		;;
> +	-h|--help)
> +		echo "$(basename $0): VSP Test library"
> +		echo "  -x|--debug          enable shell debug"
> +		echo "  -k|--keep-frames    keep generated and captured frames"
> +		echo "  -h|--help           this help"
> +		exit
> +		shift
> +		;;
> +	*)    # unknown option
> +		POSITIONAL+=("$1") # save it in an array for later
> +		shift # past argument
> +		;;
> +esac
> +done
> +set -- "${POSITIONAL[@]}" # restore positional parameters

-- 
Regards,

Laurent Pinchart
