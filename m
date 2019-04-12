Return-Path: <SRS0=s8sg=SO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19CBC10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 12:00:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 656F32082E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 12:00:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="W/kjvxVF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbfDLMA6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 12 Apr 2019 08:00:58 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33467 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726898AbfDLMA5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Apr 2019 08:00:57 -0400
Received: by mail-lf1-f67.google.com with SMTP id j11so7314955lfm.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Apr 2019 05:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=5LtX7LNuJbDAVYQZamXOj5Z0OAaBhmEKMILJ3bMgnD4=;
        b=W/kjvxVFEmmYXYX5XZKbA75Cyaisz++tOU2EJKR45kjEqOGxqM1QBA2PW9HOgoobUl
         dak2zK0HCizfraSF9OIOV8862HnPHQES320zkhD5Knqq/D9gfs3uNYXCWAutuS54tjcO
         AzyhFiewu0B9yPucMwCvRORFFUGLwHsp8Fw32IHAErVC3GeoHu5lgj6L0ranFDWNue2P
         vWBX/Z2KkUNmB1UdYdU2hlutk2D6XG9H8qsMV9iTmr3fLT71RdIjB91EPHOOG/5yapQw
         DWydsAIPekFFsu4P9+utv22JEl3madkjfhPq0VY1qHZwk+r4XdGBj5N4wvfixAUxWQug
         rkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=5LtX7LNuJbDAVYQZamXOj5Z0OAaBhmEKMILJ3bMgnD4=;
        b=R2+cyOQeUy+NgPreUET2O7XYAjXW/Q/PgglPu+rWkJZfhP3pRpg8NTBdaqZw8GcBua
         XQyG/+JqwqoK/U9698Zggnqiwtdjq/71MHYuMg4ZRNNhyd1AmvdCTYEAhSLDTlV0cQSc
         gZZ5QXyey9FLz/iOLqVSvQ3jcbIXsddNEIpxZBPxZnfZRB7fG3JXyB+x+oSdpjcBKPMS
         s07MSj2dTLuPIQFiEp4ujtVhKuGnpYJ8rsCE+MUjti44SYhbnvrbKc0/bZPjk4ix6OdE
         i+tuP7t8/qy2C9cT5k9e7T8eNizUkU//3umE+3jGwqvFaVJ3PyZUj6EfcE0QnGIb2LSw
         4gTw==
X-Gm-Message-State: APjAAAWswLrLM67VXGSc+U9UcYxI5zc2c5R5KcWNwJJT3xbW6R23lOcb
        cJ4y3Frr4mp17aBbIdCQvul2DQ==
X-Google-Smtp-Source: APXvYqzujHi4ZSnAwW/w03kazdgBjqyXu4g4kHHRTy2/I8CINiPnfbpEQLPH9c9umNJSK6SVly9Eow==
X-Received: by 2002:a19:e30b:: with SMTP id a11mr18962465lfh.4.1555070455051;
        Fri, 12 Apr 2019 05:00:55 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id b7sm8335041ljb.6.2019.04.12.05.00.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Apr 2019 05:00:54 -0700 (PDT)
Date:   Fri, 12 Apr 2019 14:00:53 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     laurent.pinchart@ideasonboard.com, horms@verge.net.au,
        sergei.shtylyov@cogentembedded.com, geert+renesas@glider.be,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77980: Add "renesas,id" to
 VIN
Message-ID: <20190412120053.GB1980@bigcity.dyn.berto.se>
References: <20190412113832.30075-1-jacopo+renesas@jmondi.org>
 <20190412113832.30075-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190412113832.30075-3-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thanks for your patch.

On 2019-04-12 13:38:32 +0200, Jacopo Mondi wrote:
> Add the "renesas,id" property to VIN nodes in the R-Car V3H R8A77980
> device tree.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>

> ---
> 
> I do not have a V3H board to test on, but I suspect VIN failed to probe
> on V3H before these 2 patches.
> 
> If that's the case, these patches would merit
> Fixes: 3182aa4e0bf4 ("arm64: dts: renesas: r8a77980: add CSI2/VIN support")
> 
> Sergei, do you still have a V3H board around? Could I have your Tested-by
> tag if things are fine now?
> 
> Thanks
>   j
> ---
>  arch/arm64/boot/dts/renesas/r8a77980.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> index 4081622d548a..a901a341dcf7 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> @@ -865,6 +865,7 @@
>  			clocks = <&cpg CPG_MOD 811>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 811>;
> +			renesas,id = <0>;
>  			status = "disabled";
> 
>  			ports {
> @@ -892,6 +893,7 @@
>  			clocks = <&cpg CPG_MOD 810>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			status = "disabled";
> +			renesas,id = <1>;
>  			resets = <&cpg 810>;
> 
>  			ports {
> @@ -919,6 +921,7 @@
>  			clocks = <&cpg CPG_MOD 809>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 809>;
> +			renesas,id = <2>;
>  			status = "disabled";
> 
>  			ports {
> @@ -946,6 +949,7 @@
>  			clocks = <&cpg CPG_MOD 808>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 808>;
> +			renesas,id = <3>;
>  			status = "disabled";
> 
>  			ports {
> @@ -973,6 +977,7 @@
>  			clocks = <&cpg CPG_MOD 807>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 807>;
> +			renesas,id = <4>;
>  			status = "disabled";
> 
>  			ports {
> @@ -1000,6 +1005,7 @@
>  			clocks = <&cpg CPG_MOD 806>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 806>;
> +			renesas,id = <5>;
>  			status = "disabled";
> 
>  			ports {
> @@ -1027,6 +1033,7 @@
>  			clocks = <&cpg CPG_MOD 805>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 805>;
> +			renesas,id = <6>;
>  			status = "disabled";
> 
>  			ports {
> @@ -1054,6 +1061,7 @@
>  			clocks = <&cpg CPG_MOD 804>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 804>;
> +			renesas,id = <7>;
>  			status = "disabled";
> 
>  			ports {
> @@ -1081,6 +1089,7 @@
>  			clocks = <&cpg CPG_MOD 628>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 628>;
> +			renesas,id = <8>;
>  			status = "disabled";
>  		};
> 
> @@ -1091,6 +1100,7 @@
>  			clocks = <&cpg CPG_MOD 627>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 627>;
> +			renesas,id = <9>;
>  			status = "disabled";
>  		};
> 
> @@ -1101,6 +1111,7 @@
>  			clocks = <&cpg CPG_MOD 625>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 625>;
> +			renesas,id = <10>;
>  			status = "disabled";
>  		};
> 
> @@ -1111,6 +1122,7 @@
>  			clocks = <&cpg CPG_MOD 618>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 618>;
> +			renesas,id = <11>;
>  			status = "disabled";
>  		};
> 
> @@ -1121,6 +1133,7 @@
>  			clocks = <&cpg CPG_MOD 612>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 612>;
> +			renesas,id = <12>;
>  			status = "disabled";
>  		};
> 
> @@ -1131,6 +1144,7 @@
>  			clocks = <&cpg CPG_MOD 608>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 608>;
> +			renesas,id = <13>;
>  			status = "disabled";
>  		};
> 
> @@ -1141,6 +1155,7 @@
>  			clocks = <&cpg CPG_MOD 605>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 605>;
> +			renesas,id = <14>;
>  			status = "disabled";
>  		};
> 
> @@ -1151,6 +1166,7 @@
>  			clocks = <&cpg CPG_MOD 604>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 604>;
> +			renesas,id = <15>;
>  			status = "disabled";
>  		};
> 
> --
> 2.21.0
> 

-- 
Regards,
Niklas Söderlund
