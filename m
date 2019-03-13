Return-Path: <SRS0=0QpP=RQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FABAC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 13:46:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F23482087C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 13:46:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="Y6QNyegy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725888AbfCMNqc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Mar 2019 09:46:32 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35029 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbfCMNqc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Mar 2019 09:46:32 -0400
Received: by mail-lj1-f196.google.com with SMTP id t13so1627342lji.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Mar 2019 06:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=+hrJbiRXmiXEOY4leyXpayOu7lKXT7DUlk7pP+Nq//s=;
        b=Y6QNyegyWauovdBqU8n+Aw9bmTit+IuNe71nA7A8djgo0RvxhNsZNt7bFYKsIJYnv/
         wSwZnxd2TxHav29EyN2zrWIkhIlkG7sxSCwRG2tohnB6R1oUjqHaXE0OqXmSw6bMqgaS
         /L/MRt6WDj1HUq73ChG12J7jKcCF+XpeZzuFdopTqYYWjQ+vfwtzV6S43HiU6N54vweF
         ZQ4g0Avi70CZXTrVLIQm/sUUfg2hDKus6LgzTGirR1UPLuMFRa9ii7Y/MrnA5U2u8cSK
         5QsDuPM0L+Ng/GhyeBqPF7cqWAPJLpRe5H927pbugDMkB6dHBaFoPCfbAazx/O1tzzbD
         asKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=+hrJbiRXmiXEOY4leyXpayOu7lKXT7DUlk7pP+Nq//s=;
        b=hUPKJqVdOgieUmDaoWV3yZHFH8f5U3O1q9S8izyy3Y7Z3gyDBco6wusMhUF8QOxL/D
         gdIBzNzeLaTVTSXd9Weck1FQ0JKuetkGKkdSp8knkcSI52hNZuJ7OFf0KBztF9yth7Np
         WEdPxv4TV34aYayS3M8N5xAFlZ9mV6Z8mWADmg9UR5/w8QAucZFQDztUpMV9YAdbEwHs
         bAOsKr2U3RElrtBOKxNP5M6Hyrc6/n96qEdxW51a5XhL5cVdhNjCGyDjVvChuPpmEwrk
         XD0Pt134EiJ6WGUIsdFNAmhARxYpx2mFCLnc5Q+7enN6BN+YSIWnZtzWpCxrFJMwHQAq
         x4sg==
X-Gm-Message-State: APjAAAWteZkd+F/xesv2ZUbVMZQ747zJHrdPRuW+9HYs0AazClgb+tqL
        C2qKPO6wn07CulwXRgZoVrhU5A==
X-Google-Smtp-Source: APXvYqxsMxVGNocjToWpQhMhli9C8+wVZ8UrhOZb/xLYWh/GBcAYv32cd2+Whq48bAbUUFxb2Yooaw==
X-Received: by 2002:a2e:9c42:: with SMTP id t2mr6100702ljj.149.1552484790344;
        Wed, 13 Mar 2019 06:46:30 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id h137sm2065859lfg.74.2019.03.13.06.46.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2019 06:46:29 -0700 (PDT)
Date:   Wed, 13 Mar 2019 14:46:28 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH] arm64: dts: renesas: draak: Remove unecessary index from
 vin4 port
Message-ID: <20190313134628.GB24848@bigcity.dyn.berto.se>
References: <20190313105118.23245-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190313105118.23245-1-horms+renesas@verge.net.au>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

Thanks for your patch.

On 2019-03-13 11:51:18 +0100, Simon Horman wrote:
> The ports node of vin4 only has one sub-node and thus does
> not need #address-cells/#size-cells and the sub-node does
> not need an exit.

I agree that the warning should be silenced however I have a feeling 
this might need to be tested. The VIN bindings assigns special meaning 
to which port reg an endpoint is described in and handles each of them 
differently, see the biding documentation.

As the single port described here is port 0 I think removing the reg 
property will probably work but is it correct? If someone with a Draak 
board could test this patch it would be great!

> 
> This addresses the following warning:
> 
>  # make dtbs W=1
>  ...
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts:492.8-503.4: Warning (graph_child_address): /soc/video@e6ef4000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
> 
> Fixes: 6a0942c20f5c ("arm64: dts: renesas: draak: Describe CVBS input")
> Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
>  Developed on top of renesas-devel-20190308-v5.0
>  Compile tested only
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> index 244b0dda03ed..8fba6cde5905 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -490,12 +490,7 @@
>  	status = "okay";
>  
>  	ports {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		port@0 {
> -			reg = <0>;
> -
> +		port {
>  			vin4_in: endpoint {
>  				remote-endpoint = <&adv7180_out>;
>  			};
> -- 
> 2.11.0
> 

-- 
Regards,
Niklas Söderlund
