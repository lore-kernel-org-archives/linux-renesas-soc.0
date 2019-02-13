Return-Path: <SRS0=YTPq=QU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C24C282CA
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Feb 2019 10:11:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CC6282147C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Feb 2019 10:11:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="CZ6uJBMI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388063AbfBMKLa (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Feb 2019 05:11:30 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35315 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726159AbfBMKLa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Feb 2019 05:11:30 -0500
Received: by mail-lj1-f195.google.com with SMTP id j13-v6so1508761ljc.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Feb 2019 02:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=BLKKukhCIGWS86lTw8VnARSddUgRd2lKfB5f3tNYLXk=;
        b=CZ6uJBMIGSQgQY0PW7hzKudmWwfSNY3Ay8NGeigtw9UZfA57SUCoz5ytNRZ9LmIK7B
         74OY8ORrNRibvRPM6j3Lig8qAKxh/BXj5zJYfeoA6+JSHnmMJ9eeqITvvJNUT5k8d8Yx
         zcL4orhU5O1M59ynhEN25oHMa5ee95/8VnjV4qdqlT680f6eIweMU8es+Orx/ux2mhN8
         0Jz2wV+7afzu4Qq4nazN3Sn8izbipQJ8Ha0C7YBW/yIVDL45YAPZvZvqqYUEyDKOgqaY
         X+a3I4oE1VKK5rC47luaqufRIZe+6DVVsNDLB1yE/vNtpKFRlXksyLVUHQr4UJdi19JB
         LS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=BLKKukhCIGWS86lTw8VnARSddUgRd2lKfB5f3tNYLXk=;
        b=SL4B0Hx5fBJehREAgR6iUUxSd8svQ8usvTIJAVYbGwd8F6uVynmQ170r80UFL+58Sy
         z8JPj35H3Uvwl41aWtyjS37Ihy309/uwkuZQCM7AGtdYYhX5UIgH0ITlwLY6+r4Lrq0e
         4y2YsxumaYlkKVmnyikFHTZYZv0SMfPLcRIUZ0CIwDiwEud6sj/W+R7AoJSIKHAZstXW
         5mFtzSTZKHTCEirawbmAI6+koy4hwnl/vJKlVPXorEX/N61nnwNlnNl+YlLRoC/b4oe8
         YGE0MAHWDZdHB50vqAgBeBwIOn6zMf12k6VqWF0eJbRK81bYghLtGNMKRdFIRHtIgGpo
         1vQw==
X-Gm-Message-State: AHQUAuZooX8ILRsn+EMgM8xN+DDGfX/wqeOks4vDD0YqLXkMTZZaN0ED
        GT4FbXFtp63tG2xGwW4EnlN7JA==
X-Google-Smtp-Source: AHgI3IY++LJ1IAtoL0vdrrPW+EidIppLq2S7z+SFWZd5QDxbnaronIb9r6JbHFXRTofFK2B/vTCBOg==
X-Received: by 2002:a2e:97ce:: with SMTP id m14mr504866ljj.162.1550052687909;
        Wed, 13 Feb 2019 02:11:27 -0800 (PST)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id e72sm449861lfg.48.2019.02.13.02.11.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Feb 2019 02:11:27 -0800 (PST)
Date:   Wed, 13 Feb 2019 11:11:26 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Add GPIO expander
Message-ID: <20190213101126.GI31044@bigcity.dyn.berto.se>
References: <20190212142000.4312-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190212142000.4312-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your patch.

On 2019-02-12 15:20:00 +0100, Geert Uytterhoeven wrote:
> Describe the ON Semiconductor PCA9654 I/O expander on the first I2C
> bus, which provides 8 extra GPIOs.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>

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

-- 
Regards,
Niklas Söderlund
