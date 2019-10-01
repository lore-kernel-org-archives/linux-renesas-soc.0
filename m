Return-Path: <SRS0=Vibg=X2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D87ECE587
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  1 Oct 2019 18:18:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2FAC32168B
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  1 Oct 2019 18:18:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YFeP3MPk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732098AbfJASSf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 1 Oct 2019 14:18:35 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52880 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731354AbfJASSf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 14:18:35 -0400
Received: from pendragon.ideasonboard.com (modemcable151.96-160-184.mc.videotron.ca [184.160.96.151])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA38923F;
        Tue,  1 Oct 2019 20:18:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1569953914;
        bh=JIjgLkQjtAN6272dn7T6D9mmSggGxaQizxkQrL6WXAE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YFeP3MPkba+2xR96+W7zQUJAlA1Sg7oRXgEC3LojaIdlczM/vJoAFxJ0Y2FaudZyq
         sZCQQSjDX2QQzF5Le23he4oN4caqWZGOwVnuNo/2tRn+QHonvKXVRxISTZVsQkpuws
         rwhzaMT3Nek2JSFgJoXCuMGP1Auf2U/wH2UYFxuI=
Date:   Tue, 1 Oct 2019 21:18:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 7/8] arm64: dts: renesas: hihope-rzg2-ex: Enable backlight
Message-ID: <20191001181821.GI4735@pendragon.ideasonboard.com>
References: <1569932124-32010-1-git-send-email-biju.das@bp.renesas.com>
 <1569932124-32010-8-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1569932124-32010-8-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Tue, Oct 01, 2019 at 01:15:23PM +0100, Biju Das wrote:
> This patch enables backlight support.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
> index 4280b19..70f9a2a 100644
> --- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
> @@ -13,6 +13,14 @@
>  	chosen {
>  		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
>  	};
> +
> +	backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pwm0 0 50000>;
> +
> +		brightness-levels = <0 2 8 16 32 64 128 255>;
> +		default-brightness-level = <6>;
> +	};
>  };
>  
>  &avb {
> @@ -82,4 +90,16 @@
>  		groups = "can1_data";
>  		function = "can1";
>  	};
> +
> +	pwm0_pins: pwm0 {
> +		groups = "pwm0";
> +		function = "pwm0";
> +	};
> +};
> +
> +&pwm0 {
> +	pinctrl-0 = <&pwm0_pins>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
>  };

-- 
Regards,

Laurent Pinchart
