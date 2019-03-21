Return-Path: <SRS0=/KHX=RY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7EAC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Mar 2019 16:37:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 327E0218E2
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Mar 2019 16:37:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="NR8H3bEx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728690AbfCUQho (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 21 Mar 2019 12:37:44 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40276 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728556AbfCUQhl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Mar 2019 12:37:41 -0400
Received: by mail-lf1-f65.google.com with SMTP id u68so5062795lff.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Mar 2019 09:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=W6vWePrwl+sUd8Id6/q6pYv9aQWANra4tcUqfXvd+wg=;
        b=NR8H3bExYkgGf6ObpmX8097DkdWdXX4qNGARW5ITQPf0BQo6eFk99s15EEUyM/p0Di
         +1QIcKtnROI+9qonxdFnDfIa/WXVY5lr63lImiDKngF3BqJjK7HAo2IQ/LCX8T8K+HHa
         WFnuIhkcbtNYHZKQB0QUHun8H7aQywTtKAebNgk86IJlDKNZ+8GzNsQQbKkO7YSWWiX7
         hC+a3s2936qGc5xhJggK7WwBzz7eD3jVMitDSc3uCLD09ciC6XSQCAQsMoNxRmOx4XaN
         tU5IGj/heEEqsgZry2Tf9LBwxLBggupBadfDpOGBDia9HnGk6ON9nss2KFH+Sa5uHoZ+
         syvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=W6vWePrwl+sUd8Id6/q6pYv9aQWANra4tcUqfXvd+wg=;
        b=ZaNYl+MV6PjpjCXSq1uAbKrLDDEgWYG7XaIIdtlZU1EMRh6bVBMmwg3RTU03ccxoau
         zi/gb969FX/FGyU1063b/Hj4bGgTaxOmCLyEg+SRLJtNrJ7p61RCN7oUu0n9mfyOFJzE
         /2HTHNQU9lRY6+HTKENiDw1HcZKJEf4zIrSmUh3cfuh8TLswO/3Mwd50oFYE3unVIUR7
         TAFStkIQN1KlVuh2nGSX4Wkrc+5J2yOMIOAPLcYjwTrLAj6xqe8a5XjswyjxJtqPVZTZ
         qSCFf1usp9WPRgABAO1evBQxgAhDwbBTmsQ3mQ3zgrJi6C6vsu0cYZMhd4JSjr29MJZ0
         A0/Q==
X-Gm-Message-State: APjAAAVAo+dMSQ+2y4Atr8JjcmFTeRLT7DOdaz3eekVTALRa24cu04cq
        j1T8DZeZQ7Gh5vFkFPALUewiOw==
X-Google-Smtp-Source: APXvYqzNrvuw5RKNCNNLbDA1uRzGOP4TNw8kLOn4o1dSdBvTLZxFzQqggYkGl3TgSLNZMkf64iS3dg==
X-Received: by 2002:ac2:44a6:: with SMTP id c6mr2585629lfm.31.1553186259034;
        Thu, 21 Mar 2019 09:37:39 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id r11sm940118ljb.29.2019.03.21.09.37.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2019 09:37:38 -0700 (PDT)
Date:   Thu, 21 Mar 2019 17:37:38 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: ape6evm: Add NOR FLASH
Message-ID: <20190321163737.GD25993@bigcity.dyn.berto.se>
References: <20190320194522.15053-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190320194522.15053-1-geert+renesas@glider.be>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work, you are a life saver :-)

On 2019-03-20 20:45:22 +0100, Geert Uytterhoeven wrote:
> Describe the 128 MiB CFI NOR FLASH, which contains the boot loader and
> its environment.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm/boot/dts/r8a73a4-ape6evm.dts | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a73a4-ape6evm.dts b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
> index 5c691e79e2b6e5fc..fa01de098dbcc0ac 100644
> --- a/arch/arm/boot/dts/r8a73a4-ape6evm.dts
> +++ b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
> @@ -173,6 +173,33 @@
>  };
>  
>  &bsc {
> +	flash@0 {
> +		compatible = "cfi-flash", "mtd-rom";
> +		reg = <0x0 0x08000000>;
> +		bank-width = <2>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			partition@0 {
> +				label = "uboot";
> +				reg = <0x00000000 0x00040000>;
> +				read-only;
> +			};
> +			partition@40000 {
> +				label = "uboot-env";
> +				reg = <0x00040000 0x00040000>;
> +				read-only;
> +			};
> +			partition@80000 {
> +				label = "flash";
> +				reg = <0x00080000 0x07f80000>;
> +			};
> +		};
> +	};
> +
>  	ethernet@8000000 {
>  		compatible = "smsc,lan9220", "smsc,lan9115";
>  		reg = <0x08000000 0x1000>;
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
