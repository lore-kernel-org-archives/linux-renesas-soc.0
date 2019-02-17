Return-Path: <SRS0=hAs+=QY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08AFC43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Feb 2019 02:47:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6548621917
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Feb 2019 02:47:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F+1zcO8b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726790AbfBQCr1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 16 Feb 2019 21:47:27 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45124 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbfBQCr1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Feb 2019 21:47:27 -0500
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 692DA49;
        Sun, 17 Feb 2019 03:47:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1550371645;
        bh=I/o3HCQNgpjHsCQBeJFiPZAl4FDpmZUEAnWvClT7UkI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F+1zcO8bHzmFKOz/7i+MuUp8dBW4TxTf31KEz6l1hj28Ps41b7tvW+S+MuAoxezDK
         lhXFXjfiIv3DNIyjljdjJon8Iq7kDmq7NnTPB+rabx4oTz1P4ncln6yZoa172k4/PZ
         +m8uE63K6xXG37Ev8bGfmyWaaYk6Nb+Z2l73Q9Tg=
Date:   Sun, 17 Feb 2019 04:47:22 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [VSP-Tests PATCH 2/7] tests: Provide copy test to validate 1xN
 streams
Message-ID: <20190217024722.GC20463@pendragon.ideasonboard.com>
References: <20181204155146.9726-1-kieran.bingham@ideasonboard.com>
 <20181204155146.9726-3-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20181204155146.9726-3-kieran.bingham@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Tue, Dec 04, 2018 at 03:51:41PM +0000, Kieran Bingham wrote:
> Validate that a 1xN stream can be read through the RPF and written
> through the WPF.
> 
> The test framework does not currently support processing images where
> the stride does not match the output width - so the testing is currently
> limited to testing only the vertical direction in this aspect.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  tests/vsp-unit-test-0025.sh | 45 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100755 tests/vsp-unit-test-0025.sh
> 
> diff --git a/tests/vsp-unit-test-0025.sh b/tests/vsp-unit-test-0025.sh
> new file mode 100755
> index 000000000000..57a1fac6e369
> --- /dev/null
> +++ b/tests/vsp-unit-test-0025.sh
> @@ -0,0 +1,45 @@
> +#!/bin/sh
> +
> +#
> +# Test pipelines which have a single pixel dimension. Use a RPF -> WPF
> +# pipeline with identical input and output formats to generate our output.
> +#
> +
> +. ./vsp-lib.sh
> +
> +features="rpf.0 uds wpf.0"
> +formats="RGB24 ARGB32"
> +
> +# Input is directly copied to the output. No change in format or size.
> +test_copy() {
> +	local format=$1
> +	local insize=$2
> +
> +	test_start "copying $insize in $format"
> +
> +	pipe_configure rpf-wpf 0 0
> +	format_configure rpf-wpf 0 0 $format $insize $format
> +
> +	vsp_runner rpf.0 &
> +	vsp_runner wpf.0
> +
> +	local result=$(compare_frames)
> +
> +	test_complete $result
> +}
> +
> +test_main() {
> +	local format
> +
> +	for format in $formats ; do
> +		test_copy $format 1024x768
> +		test_copy $format 128x128
> +		test_copy $format 128x1

If the purpose is to test Nx1 and 1xN, do we need the first two
resolutions ? Shouldn't the test_start message describe the exact
purpose ?

> +
> +		# Skipped : Test framework does not yet support strides != width
> +		#test_copy $format 1x128
> +	done
> +}
> +
> +test_init $0 "$features"
> +test_run

-- 
Regards,

Laurent Pinchart
