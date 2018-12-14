Return-Path: <SRS0=qJci=OX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F7FC67839
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 08:12:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5B25A20866
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 08:12:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SinjaU4X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B25A20866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727526AbeLNIMe (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 03:12:34 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49016 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbeLNIMd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 03:12:33 -0500
Received: from avalon.localnet (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F035A549;
        Fri, 14 Dec 2018 09:12:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1544775151;
        bh=h+SUVJ8G/8yK6MY5GD2OkGb4vF4ODvUV+R2cvuwHY1A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SinjaU4XOGTV/gxby/bRbtgiayEIOcwl3JOhSHWG0cRkjMk9tc/N54obLEM1h7nb/
         Uk7jC/9pK9thzmBB0zTO7ONrOf2eOHAIwt6UysMFYWEZojym/zFcxu+4nqOkGx0iqY
         eZaDRIkppw9WJ60hqqoNtRe+ZtqxCoLvnySlo77Y=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Nguyen An Hoan <na-hoan@jinso.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        kieran.bingham+renesas@ideasonboard.com,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
Subject: Re: [PATCH] drm: rcar-du: Add r8a77965 LVDS dts overlay
Date:   Fri, 14 Dec 2018 10:13:19 +0200
Message-ID: <4635402.pIxGsWvrf0@avalon>
Organization: Ideas on Board Oy
In-Reply-To: <1544771885-17023-1-git-send-email-na-hoan@jinso.co.jp>
References: <1544771885-17023-1-git-send-email-na-hoan@jinso.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Hoan-san,

Thank you for the patch.

On Friday, 14 December 2018 09:18:05 EET Nguyen An Hoan wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
> 
> Add r8a77965 LVDS dts overlay support.

This shouldn't be needed. r8a77965 support was added to the DU LVDS driver 
after conversion to the new DT bindings. There has never been support for old 
LVDS bindings in the DU driver, so there's no need to offer backward 
compatibility.

> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> ---
>  drivers/gpu/drm/rcar-du/Makefile                   |  4 +-
>  drivers/gpu/drm/rcar-du/rcar_du_of.c               |  2 +
>  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a77965.dts   | 50 +++++++++++++++++++
>  3 files changed, 55 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a77965.dts
> 
> diff --git a/drivers/gpu/drm/rcar-du/Makefile
> b/drivers/gpu/drm/rcar-du/Makefile index 2a3b8d7..9e73a83 100644
> --- a/drivers/gpu/drm/rcar-du/Makefile
> +++ b/drivers/gpu/drm/rcar-du/Makefile
> @@ -11,7 +11,8 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_of.o \
>  					   rcar_du_of_lvds_r8a7791.dtb.o \
>  					   rcar_du_of_lvds_r8a7793.dtb.o \
>  					   rcar_du_of_lvds_r8a7795.dtb.o \
> -					   rcar_du_of_lvds_r8a7796.dtb.o
> +					   rcar_du_of_lvds_r8a7796.dtb.o \
> +					   rcar_du_of_lvds_r8a77965.dtb.o
>  rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
> 
>  obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
> @@ -24,3 +25,4 @@ DTC_FLAGS_rcar_du_of_lvds_r8a7791 += -Wno-graph_endpoint
>  DTC_FLAGS_rcar_du_of_lvds_r8a7793 += -Wno-graph_endpoint
>  DTC_FLAGS_rcar_du_of_lvds_r8a7795 += -Wno-graph_endpoint
>  DTC_FLAGS_rcar_du_of_lvds_r8a7796 += -Wno-graph_endpoint
> +DTC_FLAGS_rcar_du_of_lvds_r8a77965 += -Wno-graph_endpoint
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of.c
> b/drivers/gpu/drm/rcar-du/rcar_du_of.c index afef696..56c341c 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_of.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of.c
> @@ -107,6 +107,7 @@ RCAR_DU_OF_DTB(lvds, r8a7791);
>  RCAR_DU_OF_DTB(lvds, r8a7793);
>  RCAR_DU_OF_DTB(lvds, r8a7795);
>  RCAR_DU_OF_DTB(lvds, r8a7796);
> +RCAR_DU_OF_DTB(lvds, r8a77965);
> 
>  static const struct rcar_du_of_overlay rcar_du_lvds_overlays[] __initconst
> = { RCAR_DU_OF_OVERLAY(lvds, r8a7790),
> @@ -114,6 +115,7 @@ static const struct rcar_du_of_overlay
> rcar_du_lvds_overlays[] __initconst = { RCAR_DU_OF_OVERLAY(lvds, r8a7793),
>  	RCAR_DU_OF_OVERLAY(lvds, r8a7795),
>  	RCAR_DU_OF_OVERLAY(lvds, r8a7796),
> +	RCAR_DU_OF_OVERLAY(lvds, r8a77965),
>  	{ /* Sentinel */ },
>  };
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a77965.dts
> b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a77965.dts new file mode 100644
> index 0000000..34aea91
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a77965.dts
> @@ -0,0 +1,50 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * rcar_du_of_lvds_r8a77965.dts - Legacy LVDS DT bindings conversion for
> R8A77965 + *
> + * Copyright (C) 2018 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +/ {
> +	fragment@0 {
> +		target-path = "/soc";
> +		__overlay__ {
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +
> +			lvds@feb90000 {
> +				compatible = "renesas,r8a77965-lvds";
> +				reg = <0 0xfeb90000 0 0x14>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						lvds0_input: endpoint {
> +						};
> +					};
> +					port@1 {
> +						reg = <1>;
> +						lvds0_out: endpoint {
> +						};
> +					};
> +				};
> +			};
> +		};
> +	};
> +
> +	fragment@1 {
> +		target-path = "/soc/display@feb00000/ports";
> +		__overlay__ {
> +			port@2 {
> +				endpoint {
> +					remote-endpoint = <&lvds0_input>;
> +				};
> +			};
> +		};
> +	};
> +};

-- 
Regards,

Laurent Pinchart



