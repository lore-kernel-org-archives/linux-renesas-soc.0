Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C911C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:26:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A71320874
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:26:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="UPtETdqV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727865AbeLQQ07 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 11:26:59 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43899 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387902AbeLQQ06 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 11:26:58 -0500
Received: by mail-lj1-f196.google.com with SMTP id q2-v6so391108lji.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Dec 2018 08:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8ijEpPW9AvPHMSdKJiX/TY7ou5ZVepv4T4UISdbJ1Tw=;
        b=UPtETdqVvTL7AKBRuYCodfIxt6PfU+7Qr/4uPOKemdN7MfYNj4uUJz2AEcINHKbhS8
         ErqwYuY3b8SVAPzt3KZu9rQjGHjzk4umsl66E4IDaX0g8hMNn4sNNv/R/N0YWg/N3hnm
         TYpxYbBklDO0+jPVC+PhY5yC0Q7YuHfnhal6vtOBxo8QpGm41niAJ8I6jor3kSI53suY
         4bJlt+Y0i+J6OT9kh51qCvskkzGsMRTPNnGhJH2b/96WBOVUPOuuur4+7I/BWqDd/O7C
         r3Rbr2rGRxxPJMqd645w700wi++XN2fwNguEq15Qa7eaiFAfN282XzzH8LJlNYL/i0uI
         I6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=8ijEpPW9AvPHMSdKJiX/TY7ou5ZVepv4T4UISdbJ1Tw=;
        b=eTgb2NzQ5rkfoN6vdYwjUkAhngGqD0dU8dXz7GkrxfGyzGMu0Y8Mv7QhQ6+05REZad
         yL0mMhQ1/ftGzfqylWxKT3MBAams4a2zOWZFkEyV+ar8ZlW5DMzuc4dVHRS68TukPn43
         m61jHciqo/cd9d+LvU7M5gwvjf3BwPsobGgPiokGI6MQr/kwtkJcSdUUskado4z/RH0y
         V1ppUBnVlKG6DDGIitsMupQ3xHaTI4SfvQB9a5nUjBWvB8niXtjWFu1JFh7+5fZpUh3E
         g48mYrjsuNbnB9epH3ZOorZpbIrolkAYUlnPxIwcSx/8tKalt+metw/uN5bEg1dbvG6j
         qoeg==
X-Gm-Message-State: AA+aEWbBt4GSZggvt+uRx9v6AoRh85NJj7iwbmVMGSaiLDaK30DcEPeN
        9Afjqw+Zb50iJjMNepytjp4gzA==
X-Google-Smtp-Source: AFSGD/VEKsngGiSCUnZvPQL7h7FPT8Pp0y2fyDBrM6I5Ui9Meh/Nw8243FZUOvCYOEOXChaCRMZngg==
X-Received: by 2002:a2e:9bc3:: with SMTP id w3-v6mr7715527ljj.70.1545064016538;
        Mon, 17 Dec 2018 08:26:56 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.86.84])
        by smtp.gmail.com with ESMTPSA id i13-v6sm2561930ljg.82.2018.12.17.08.26.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Dec 2018 08:26:55 -0800 (PST)
Subject: Re: [PATCH 06/17] arm64: dts: renesas: r8a774c0: Add MSIOF nodes
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1544780260-27590-7-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <f6834dd2-7a2d-5ca9-0961-2c992ce22002@cogentembedded.com>
Date:   Mon, 17 Dec 2018 19:26:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1544780260-27590-7-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 12/14/2018 12:37 PM, Fabrizio Castro wrote:

> Add the device nodes for all MSIOF SPI controllers on RZ/G2E SoC.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 62 +++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> index 9532d29..9bd66b1 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> @@ -855,6 +855,68 @@
>  			status = "disabled";
>  		};
>  
> +		msiof0: spi@e6e90000 {
> +			compatible = "renesas,msiof-r8a774c0",
> +				     "renesas,rcar-gen3-msiof";
> +			reg = <0 0xe6e90000 0 0x0064>;

   Do we really need the leading zeros in the size cells?

> +			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 211>;
> +			dmas = <&dmac1 0x41>, <&dmac1 0x40>,
> +			       <&dmac2 0x41>, <&dmac2 0x40>;
> +			dma-names = "tx", "rx", "tx", "rx";
> +			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
> +			resets = <&cpg 211>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
[...]

   Same question for the other instances of MSIOF.

MBR, Sergei
