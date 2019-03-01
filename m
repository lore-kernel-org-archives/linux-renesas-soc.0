Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7ABBC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 15:55:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B637C20850
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 15:55:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nt1k1fUw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388109AbfCAPzq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 10:55:46 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45968 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728383AbfCAPzp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 10:55:45 -0500
Received: by mail-pg1-f196.google.com with SMTP id y4so11608684pgc.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Mar 2019 07:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=jLIyFAifiRAgcvZD4ggavrGnBhF8t9ofKtSW3O8SPdo=;
        b=nt1k1fUwJM5poxCxYlEuws5SBVNeAlUTIEUk58bnjvn4bqDaBbUPnWWY9gbMmQ/wM6
         bGZEwLv4BPHl+SnqH3Jk5ehTLV/5HtuvoTBKYzpymvyrA9yqh2AiWzOqLodBkRAIOPWc
         lhQXgBObH4PtSaA6zW4FKU5+dSveES5jH1bmiV2PvzObWsAiTjoyaFeG8gIIQtjsHnV9
         JKa5raQ4yO5Xm72T97mn4jKpQr1FOArglRPv8vT7gam1j+QkJhht+MQBDPOp7uyeaUPL
         s/HjI+NFsHChvIY31DnDWQbj2w59Ga/F4Oidt/Ksf3bVg8u/i9Svib5zIm74DBKvFoNT
         hlKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=jLIyFAifiRAgcvZD4ggavrGnBhF8t9ofKtSW3O8SPdo=;
        b=IO6agWqhRnxrvH1lI4IlSWztgaEJmPRU+ApmkryKgDT7E9vjHxoSj4LsihW8X2Q2Sr
         TGfiyedFo6vdB+zxY+3DzoOrm7qMWcvAPhNPccg3MB9osusfxzn70xmaoy4rP3Gshj3k
         WG08oBolV/8Y3WaukaV65iOuJpH4eZrDJACbEiZ9mCzeI6ctPe0ofMmvle+idLQZuY5N
         THJBqpbhsLMJVASbzTI/KHgHJB6aKiKrIMhQWwCvGuYF8l4IIl35/CMcdyK5L/mdkzvM
         yCRFxF/mZl2AbnOKSOEqNC17f+7izs1UR+SZLor3sCcH0n9dWX26uGH6ZrQZ6GF+Zw5Z
         PrdA==
X-Gm-Message-State: APjAAAV5ArEVztnAyeKBNH+mSdxGVT0BW0HrFGrVq/Tevm/V1qXwWq0s
        NeGEl9GUW7aNEwsAhY0mCbAp
X-Google-Smtp-Source: APXvYqwKdl1qp9Psj2lcXh8SiEEmaJX0plH/RB2i6CpFukg+GA77tAJ9rxSY8+0yTca1CBEA64l8KA==
X-Received: by 2002:a63:d80b:: with SMTP id b11mr5440880pgh.168.1551455744564;
        Fri, 01 Mar 2019 07:55:44 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2409:4072:630c:677c:2dd3:3db1:5145:4da9])
        by smtp.gmail.com with ESMTPSA id b138sm48505561pfb.48.2019.03.01.07.55.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2019 07:55:43 -0800 (PST)
Date:   Fri, 1 Mar 2019 21:25:23 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Wen Yang <wen.yang99@zte.com.cn>, linus.walleij@linaro.org,
        afaerber@suse.de
Cc:     liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kgene@kernel.org, krzk@kernel.org,
        linux-samsung-soc@vger.kernel.org, michal.simek@xilinx.com,
        dinguyen@kernel.org, heiko@sntech.de,
        linux-rockchip@lists.infradead.org, f.fainelli@gmail.com,
        rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, avifishman70@gmail.com,
        tmaimon77@gmail.com, venture@google.com, yuenn@google.com,
        brendanhiggins@google.com, openbmc@lists.ozlabs.org,
        xuwei5@hisilicon.com, maxime.ripard@bootlin.com, wens@csie.org,
        catalin.marinas@arm.com, will.deacon@arm.com, horms@verge.net.au,
        magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        fabio.estevam@nxp.com, linux-imx@nxp.com, wang.yi59@zte.com.cn
Subject: Re: [PATCH 01/15] ARM: actions: fix a leaked reference by
 addingmissing of_node_put
Message-ID: <20190301155523.GA1915@Mani-XPS-13-9360>
References: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wen,

On Fri, Mar 01, 2019 at 04:56:42PM +0800, Wen Yang wrote:
> The call to of_get_next_child returns a node pointer with refcount
> incremented thus it must be explicitly decremented after the last
> usage.
> 
> Detected by coccinelle with the following warnings:
> ./arch/arm/mach-actions/platsmp.c:112:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 103, but without a corresponding object release within this function.
> ./arch/arm/mach-actions/platsmp.c:124:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 115, but without a corresponding object release within this function.
> ./arch/arm/mach-actions/platsmp.c:137:3-9: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 128, but without a corresponding object release within this function.
> 

We have a floating patch for this:
https://www.spinics.net/lists/arm-kernel/msg694544.html

Andreas: Can you please take a second look at the patchset submitted by Linus
Walleij and Russel for simplifying the Actions startup code?

Thanks,
Mani

> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> Cc: "Andreas Färber" <afaerber@suse.de>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/arm/mach-actions/platsmp.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/mach-actions/platsmp.c b/arch/arm/mach-actions/platsmp.c
> index 4fd479c..1a8e078 100644
> --- a/arch/arm/mach-actions/platsmp.c
> +++ b/arch/arm/mach-actions/platsmp.c
> @@ -107,6 +107,7 @@ static void __init s500_smp_prepare_cpus(unsigned int max_cpus)
>  	}
>  
>  	timer_base_addr = of_iomap(node, 0);
> +	of_node_put(node);
>  	if (!timer_base_addr) {
>  		pr_err("%s: could not map timer registers\n", __func__);
>  		return;
> @@ -119,6 +120,7 @@ static void __init s500_smp_prepare_cpus(unsigned int max_cpus)
>  	}
>  
>  	sps_base_addr = of_iomap(node, 0);
> +	of_node_put(node);
>  	if (!sps_base_addr) {
>  		pr_err("%s: could not map sps registers\n", __func__);
>  		return;
> @@ -132,6 +134,7 @@ static void __init s500_smp_prepare_cpus(unsigned int max_cpus)
>  		}
>  
>  		scu_base_addr = of_iomap(node, 0);
> +		of_node_put(node);
>  		if (!scu_base_addr) {
>  			pr_err("%s: could not map scu registers\n", __func__);
>  			return;
> -- 
> 2.9.5
> 
