Return-Path: <SRS0=s4Ke=QT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 485FAC282C4
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Feb 2019 16:33:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F16E820842
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Feb 2019 16:33:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="G8QlyMhW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727442AbfBLQdn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Feb 2019 11:33:43 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:54049 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727372AbfBLQdn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Feb 2019 11:33:43 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 99AA925B7DA;
        Wed, 13 Feb 2019 03:33:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549989221; bh=f20b1i4cffJJ5ka9LDTXAdSd9V8QcrZoIDoY0A13LLA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G8QlyMhWC1KSZsADt7i3jit//uLnPIWHz1ZSYroCWrQy6i1I4pBib64A65uYz0o6Y
         nCUSaup5Q4WYAKBlF9EFZwjQPKnunKCd/wekRorL9ahTGkkbB0CT8pKI5/mz7bbvC3
         hGL8EIyOPq4ScQ2ihzoalX3XvkFqKgt5mWKsqhBQ=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id DBEB8940362; Tue, 12 Feb 2019 17:33:39 +0100 (CET)
Date:   Tue, 12 Feb 2019 17:33:39 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Add GPIO expander
Message-ID: <20190212163339.oqxixynflcfquwkt@verge.net.au>
References: <20190212142000.4312-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190212142000.4312-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Feb 12, 2019 at 03:20:00PM +0100, Geert Uytterhoeven wrote:
> Describe the ON Semiconductor PCA9654 I/O expander on the first I2C
> bus, which provides 8 extra GPIOs.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> GPIOs 5-7 are accessible on test points CP16, CP17, and CP72.
> 
> Output tested with a multi-meter using /sys/class/gpio/.
> Input and interrupt capability tested using gpio-keys.
> ---
>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> index 5ac159b7830d58c1..b5c0dbf4982febd0 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -337,6 +337,15 @@
>  &i2c0 {
>  	status = "okay";
>  
> +	io_expander: gpio@20 {
> +		compatible = "onnn,pca9654";
> +		reg = <0x20>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&gpio2>;
> +		interrupts = <22 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
>  	hdmi-encoder@39 {
>  		compatible = "adi,adv7511w";
>  		reg = <0x39>;
> -- 
> 2.17.1
> 
