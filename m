Return-Path: <SRS0=qJci=OX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B455EC67839
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 08:24:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7A54E20879
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 08:24:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CoGDp46N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A54E20879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbeLNIYT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 03:24:19 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49420 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbeLNIYS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 03:24:18 -0500
Received: from [192.168.0.21] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F0AC549;
        Fri, 14 Dec 2018 09:24:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1544775856;
        bh=eWoFxi6s6Ex376b2Sx2VeTsEtW4C8bD5IqbuvNDCUT4=;
        h=Reply-To:Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=CoGDp46NEuKMRGc4KjmTqLEzOrS8n/fYDYYg3IDAuizBfoQj2w5wD/zk89cVSxL1q
         4LB0MN7CK25QSD1ixhfNTJpeKRbms/wHTbdSTObiZ1shbVBwJ8m/TSu2UdB9Pv+haB
         /0DkViJc1QpzIg50LhEGkWCbEuR0XkaE+11P7vd4=
Reply-To: kieran.bingham+renesas@ideasonboard.com,
          kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] drm: rcar-du: Add r8a77965 LVDS dts overlay
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Nguyen An Hoan <na-hoan@jinso.co.jp>,
        linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com
Cc:     kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
References: <1544771885-17023-1-git-send-email-na-hoan@jinso.co.jp>
 <c91bea19-7bbd-1567-1e1e-36cff9cffe99@ideasonboard.com>
Openpgp: preference=signencrypt
Organization: Ideas on Board
Message-ID: <1122dcd7-7fa8-528e-81f9-bab61c71e474@ideasonboard.com>
Date:   Fri, 14 Dec 2018 08:24:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <c91bea19-7bbd-1567-1e1e-36cff9cffe99@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 14/12/2018 07:48, Kieran Bingham wrote:
> Hi Hoan-san,
> 
> Thank you for the patch,
> 
> On 14/12/2018 07:18, Nguyen An Hoan wrote:
>> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>>
>> Add r8a77965 LVDS dts overlay support.
> 
> 
> There has been a recent change to the format of how these files are added.
> 
> With thanks to Geert's updates, we have a much simpler way to describe
> the overlay.
> 
> Geert has supplied a patch at:
>   https://patchwork.kernel.org/patch/10704417/
> 
> You can see the thread for this topic at:
> 
> https://lore.kernel.org/linux-renesas-soc/20181129105850.10953-1-geert+renesas@glider.be/
> 
> 
> Could you convert this file in the same way (and validate the generated
> output is the same), and repost please?

My apologies, following Laurent's comments, please disregard this
suggestion.

--
Regards

Kieran



> 
> --
> Regards
> 
> Kieran
> 
> 
>>
>> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
>> ---
>>  drivers/gpu/drm/rcar-du/Makefile                   |  4 +-
>>  drivers/gpu/drm/rcar-du/rcar_du_of.c               |  2 +
>>  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a77965.dts   | 50 ++++++++++++++++++++++
>>  3 files changed, 55 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a77965.dts
>>
>> diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
>> index 2a3b8d7..9e73a83 100644
>> --- a/drivers/gpu/drm/rcar-du/Makefile
>> +++ b/drivers/gpu/drm/rcar-du/Makefile
>> @@ -11,7 +11,8 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_of.o \
>>  					   rcar_du_of_lvds_r8a7791.dtb.o \
>>  					   rcar_du_of_lvds_r8a7793.dtb.o \
>>  					   rcar_du_of_lvds_r8a7795.dtb.o \
>> -					   rcar_du_of_lvds_r8a7796.dtb.o
>> +					   rcar_du_of_lvds_r8a7796.dtb.o \
>> +					   rcar_du_of_lvds_r8a77965.dtb.o
>>  rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
>>  
>>  obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
>> @@ -24,3 +25,4 @@ DTC_FLAGS_rcar_du_of_lvds_r8a7791 += -Wno-graph_endpoint
>>  DTC_FLAGS_rcar_du_of_lvds_r8a7793 += -Wno-graph_endpoint
>>  DTC_FLAGS_rcar_du_of_lvds_r8a7795 += -Wno-graph_endpoint
>>  DTC_FLAGS_rcar_du_of_lvds_r8a7796 += -Wno-graph_endpoint
>> +DTC_FLAGS_rcar_du_of_lvds_r8a77965 += -Wno-graph_endpoint
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of.c b/drivers/gpu/drm/rcar-du/rcar_du_of.c
>> index afef696..56c341c 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_of.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of.c
>> @@ -107,6 +107,7 @@ RCAR_DU_OF_DTB(lvds, r8a7791);
>>  RCAR_DU_OF_DTB(lvds, r8a7793);
>>  RCAR_DU_OF_DTB(lvds, r8a7795);
>>  RCAR_DU_OF_DTB(lvds, r8a7796);
>> +RCAR_DU_OF_DTB(lvds, r8a77965);
>>  
>>  static const struct rcar_du_of_overlay rcar_du_lvds_overlays[] __initconst = {
>>  	RCAR_DU_OF_OVERLAY(lvds, r8a7790),
>> @@ -114,6 +115,7 @@ static const struct rcar_du_of_overlay rcar_du_lvds_overlays[] __initconst = {
>>  	RCAR_DU_OF_OVERLAY(lvds, r8a7793),
>>  	RCAR_DU_OF_OVERLAY(lvds, r8a7795),
>>  	RCAR_DU_OF_OVERLAY(lvds, r8a7796),
>> +	RCAR_DU_OF_OVERLAY(lvds, r8a77965),
>>  	{ /* Sentinel */ },
>>  };
>>  
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a77965.dts b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a77965.dts
>> new file mode 100644
>> index 0000000..34aea91
>> --- /dev/null
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a77965.dts
>> @@ -0,0 +1,50 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * rcar_du_of_lvds_r8a77965.dts - Legacy LVDS DT bindings conversion for R8A77965
>> + *
>> + * Copyright (C) 2018 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +/ {
>> +	fragment@0 {
>> +		target-path = "/soc";
>> +		__overlay__ {
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +
>> +			lvds@feb90000 {
>> +				compatible = "renesas,r8a77965-lvds";
>> +				reg = <0 0xfeb90000 0 0x14>;
>> +
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					port@0 {
>> +						reg = <0>;
>> +						lvds0_input: endpoint {
>> +						};
>> +					};
>> +					port@1 {
>> +						reg = <1>;
>> +						lvds0_out: endpoint {
>> +						};
>> +					};
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	fragment@1 {
>> +		target-path = "/soc/display@feb00000/ports";
>> +		__overlay__ {
>> +			port@2 {
>> +				endpoint {
>> +					remote-endpoint = <&lvds0_input>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>>
> 

