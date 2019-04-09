Return-Path: <SRS0=/dFS=SL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 389F3C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 13:01:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E22EC2133D
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 13:01:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="IOLBjZ+l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727285AbfDINBm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Apr 2019 09:01:42 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35121 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbfDINBm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Apr 2019 09:01:42 -0400
Received: by mail-lj1-f194.google.com with SMTP id t4so14388319ljc.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Apr 2019 06:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=7oZQsUTDX26kGLtmJ9v1mBTNkyPjaY7Z5jEt86gEr4c=;
        b=IOLBjZ+lIzZ3oMpjMUeBj+DPf/qturtRkEEOfEF1P8Kgy88y9Z5h2gFGAwBZ8szS9e
         p3rspyIQwud9ZrIDDrwJOWMTYWL5iJmpakHzc73L5CR8Twm1e8RBOVASMp9vjD9rjT0I
         JLcoX0jL6/TRl9PZzCsfb3LkBn/CL3U+sqtD+PN84GSmByN13MQDECkT7c1bye81jNpR
         AcBXZir4uGM3YNxgpLBflAZX6NuWTEwXUngV9BTZB5o1zdEp/hjz5g3GJLWGzwhTgb7F
         SQMRfJAIxOIB1gHL10Ct3TMoW671JqZJZAuhJOYHRS4cH6zHlrifk/HIXnrKTZTTjUtM
         c0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=7oZQsUTDX26kGLtmJ9v1mBTNkyPjaY7Z5jEt86gEr4c=;
        b=fraE4JAZmhHsp3PkmFnJQ4uLux69xyMM6tkt7D6Sw/CWK0ugUUwtD9LdjEy4AXoU7D
         QY1g+sSXC/8EsxAm4P4Aawzo2FpnffJXo6QbZ9Ef1nlSPWlSGxuGQLTmq8ZbTNB+mB6a
         ZpwIiInQUrYeYJJl0WFL+g6KZGPHMmcSWolj9jfhM6ngSJL2KoS2lDglQN1cl4K0dE9m
         h4MhapV3yfTiN4YakPxfqIg4Eo2SrBOtjGEEV4MTSVxXLWHE/c4q9QPC0DAVOdnXZU56
         JYVBFHalYVCyVvimpQtUudZwrptB4KyWNFnQCMJWrIZCss50mPD1wUiIzi6x18R4BZbW
         vJTg==
X-Gm-Message-State: APjAAAWMTs1vkws8Q+SQ97xWi1yTNVJSAv7b1lPvhWp6tD2O92ctvuyj
        C9OI8ATnJ08uVWwrdvnIJXI7uzQ6PlU=
X-Google-Smtp-Source: APXvYqx4z7VsEoe4Z9cuMAURIBJRCZHgMVpDNc3MWroUiZXyjrt9QyTwFXWG4Q4Ey3h9FxelyBhXjQ==
X-Received: by 2002:a2e:731a:: with SMTP id o26mr19512535ljc.69.1554814900665;
        Tue, 09 Apr 2019 06:01:40 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id i24sm6765154ljb.31.2019.04.09.06.01.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Apr 2019 06:01:39 -0700 (PDT)
Date:   Tue, 9 Apr 2019 15:01:38 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be, horms+renesas@verge.net.au,
        devicetree@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com,
        kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
Subject: Re: [PATCH 05/11] ARM: dts: r8a77470: Add VIN support
Message-ID: <20190409130138.GN15350@bigcity.dyn.berto.se>
References: <1554799912-24764-1-git-send-email-cv-dong@jinso.co.jp>
 <1554799912-24764-6-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1554799912-24764-6-git-send-email-cv-dong@jinso.co.jp>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Cao,

On 2019-04-09 17:51:46 +0900, Cao Van Dong wrote:
> Add vin{0|1} nodes to dtsi for VIN support on the RZ/G1C (r8a77470) SoC.
> 
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> ---
>  arch/arm/boot/dts/r8a77470.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
> index 3940a0d..e89c72f 100644
> --- a/arch/arm/boot/dts/r8a77470.dtsi
> +++ b/arch/arm/boot/dts/r8a77470.dtsi
> @@ -780,6 +780,28 @@
>  			status = "disabled";
>  		};
>  
> +		vin0: video@e6ef0000 {
> +			compatible = "renesas,vin-r8a77470",
> +				     "renesas,rcar-gen2-vin";

This patch looks good but you should also add renesas,vin-r8a77470 to 
Documentation/devicetree/bindings/media/rcar_vin.txt in a separate 
patch.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> +			reg = <0 0xe6ef0000 0 0x1000>;
> +			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 811>;
> +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> +			resets = <&cpg 811>;
> +			status = "disabled";
> +		};
> +
> +		vin1: video@e6ef1000 {
> +			compatible = "renesas,vin-r8a77470",
> +				     "renesas,rcar-gen2-vin";
> +			reg = <0 0xe6ef1000 0 0x1000>;
> +			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 810>;
> +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> +			resets = <&cpg 810>;
> +			status = "disabled";
> +		};
> +
>  		sdhi0: sd@ee100000 {
>  			compatible = "renesas,sdhi-r8a77470",
>  				     "renesas,rcar-gen2-sdhi";
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
