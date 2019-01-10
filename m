Return-Path: <SRS0=E4fS=PS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00669C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 12:58:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B3F2920879
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 12:58:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EFuKjXkt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728063AbfAJM6I (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 10 Jan 2019 07:58:08 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:48766 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726974AbfAJM6I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jan 2019 07:58:08 -0500
Received: from avalon.localnet (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 885B14F8;
        Thu, 10 Jan 2019 13:58:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1547125085;
        bh=4puNvOBoknhCNWs2atjqhIpgbrRg/eCecU28pHTvyTQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EFuKjXkthiKKJqoS51u3F6wg4ga0DPhcm169JHzCKuydY7s2W+4rDaciAVkU2DvAj
         olVlqD+fI2/1RBzJpW7TsZYESCyZpAY+xFWuxE7ku4vKW/1mVn/g1KW38u2w3UorZk
         D6P5YQ6Jv5s7txVUMhTPdN0pPP1K5nwLvFxRdwZA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     marek.vasut@gmail.com
Cc:     linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Fix backlight regulator numbering
Date:   Thu, 10 Jan 2019 14:59:15 +0200
Message-ID: <1816865.hhpKvpXsC4@avalon>
Organization: Ideas on Board Oy
In-Reply-To: <20190109140045.17449-1-marek.vasut@gmail.com>
References: <20190109140045.17449-1-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

Thank you for the patch.

On Wednesday, 9 January 2019 16:00:45 EET marek.vasut@gmail.com wrote:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> There are two regulator1 nodes in the Ebisu DTS right now, one 3.3V for
> the eMMC and one 12V for the backlight. This causes one to be overwritten
> by the other, ultimatelly resulting in inoperable eMMC, which depends on
> the former. Fix this by renumbering the backlight regulator to regulator2.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Reported-by: Simon Horman <horms+renesas@verge.net.au>
> Fixes: 9d16c4a10e07 ("arm64: dts: renesas: r8a77990: ebisu: Add backlight")

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Sorry for breaking this in the first place.

> ---
>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts index
> e0590c0af4c4..89383aa35d65 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -191,7 +191,7 @@
>  		clock-frequency = <24576000>;
>  	};
> 
> -	reg_12p0v: regulator1 {
> +	reg_12p0v: regulator2 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "D12.0V";
>  		regulator-min-microvolt = <12000000>;

-- 
Regards,

Laurent Pinchart



