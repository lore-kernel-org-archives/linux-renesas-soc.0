Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF37C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:30:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C68D2146F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:30:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="lcCvDvBk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732415AbeLQNas (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 08:30:48 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:40739 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbeLQNas (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 08:30:48 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5BAEF25B781;
        Tue, 18 Dec 2018 00:30:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545053446; bh=0bsg5wqyi5JbGtE0xyX3iEmCmiIhF5MnccKp7CwDqac=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lcCvDvBk5Zw/q7snMgbRkGl8AQhi+EvkWJORutWjNaq3jIiDFHkHm5Y0Xp4Z5tqnD
         A2UhPgKNTZOA3TqTZnCCHDoWgzRhXOpkGsTHwC5UUth1xMJYzqobWOJfHAhRRIHweR
         i9HDW7tbI6Mxyh4X+6WZq7iEs2P4AePvlCSLzfXg=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 5161D94048A; Mon, 17 Dec 2018 14:30:44 +0100 (CET)
Date:   Mon, 17 Dec 2018 14:30:44 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: draak: Set better
 backlight levels
Message-ID: <20181217133043.s6ol4l64yuep64cz@verge.net.au>
References: <20181216113217.11379-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181216113217.11379-1-laurent.pinchart+renesas@ideasonboard.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Dec 16, 2018 at 01:32:17PM +0200, Laurent Pinchart wrote:
> The backlight levels provided in the Draak DT produce a perceived
> brightness very biased towards high brightness. Use better brightness
> levels based on the CIE 1931 formula.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I would value a review of this patch.

> ---
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> index cd067319e6f3..7970459192ac 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -28,8 +28,8 @@
>  		compatible = "pwm-backlight";
>  		pwms = <&pwm1 0 50000>;
>  
> -		brightness-levels = <256 128 64 16 8 4 0>;
> -		default-brightness-level = <6>;
> +		brightness-levels = <512 511 505 494 473 440 392 327 241 133 0>;
> +		default-brightness-level = <10>;
>  
>  		power-supply = <&reg_12p0v>;
>  		enable-gpios = <&gpio4 0 GPIO_ACTIVE_HIGH>;
> -- 
> Regards,
> 
> Laurent Pinchart
> 
