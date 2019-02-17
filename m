Return-Path: <SRS0=hAs+=QY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D393C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Feb 2019 02:42:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0BEC721A4A
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Feb 2019 02:42:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jSJhaim+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbfBQCmB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 16 Feb 2019 21:42:01 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45086 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbfBQCmB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Feb 2019 21:42:01 -0500
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA5C149;
        Sun, 17 Feb 2019 03:41:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1550371318;
        bh=bxyvWqFWzuq50LOabmXHGmfHI82sO4IB6C8UpKTOQhI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jSJhaim+Up6QPwTJEP5ONVHYQANy/PbaiZz6Q4eBEuQ8wmySXEmuUV2dUmcgMvRGJ
         HeZdqUiryVyBaSX7wZnrR8HhKOJS8pL1RxkSPfncewCor8gRw1BdUozoZHUnaEu3JL
         eojS0lHywI0KWmf/cGLFbPwcFTUbuOY8aMHvIIrw=
Date:   Sun, 17 Feb 2019 04:41:55 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [VSP-Tests PATCH 1/7] tests: add pseudo platform test
Message-ID: <20190217024155.GA20463@pendragon.ideasonboard.com>
References: <20181204155146.9726-1-kieran.bingham@ideasonboard.com>
 <20181204155146.9726-2-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20181204155146.9726-2-kieran.bingham@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Tue, Dec 04, 2018 at 03:51:40PM +0000, Kieran Bingham wrote:
> Provide an initial test which can run as part of the test suite.
> This test will report the platform and kernel version, along with
> the identified paths of required utilities.
> 
> This will aid in ensuring that required tools are available on a
> running platform - and report the kernel and platform details in
> any test suite output for clarification of results.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  tests/vsp-unit-test-0000.sh | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100755 tests/vsp-unit-test-0000.sh
> 
> diff --git a/tests/vsp-unit-test-0000.sh b/tests/vsp-unit-test-0000.sh
> new file mode 100755
> index 000000000000..144cfc677b32
> --- /dev/null
> +++ b/tests/vsp-unit-test-0000.sh
> @@ -0,0 +1,20 @@
> +#!/bin/sh
> +
> +# Report testing conditions
> +
> +model=`cat /sys/firmware/devicetree/base/model`

Please use $(...) instead of `...`, it's more readable.

> +
> +echo "Test Conditions:"
> +
> +function check_all() {
> +	echo "  Platform: " "$model"
> +	echo "  Kernel release: " `uname -r`
> +	echo "  convert: " `which convert`
> +	echo "  compare: " `which compare`
> +	echo "  killall: " `which killall`
> +	echo "  raw2rgbpnm: " `which raw2rgbpnm`
> +	echo "  stress: " `which stress`
> +	echo "  yavta: " `which yavta`
> +}
> +
> +check_all | column -ts ":"

Could we remove the dependency on the column tool ? I don't have it in
my buildroot environment :-) I could of course add it, but in this case
I think it's easy enough to align the columns manually.

With these fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
