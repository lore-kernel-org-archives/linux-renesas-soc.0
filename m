Return-Path: <SRS0=zpKQ=PB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2972FC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 24 Dec 2018 08:14:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E91D0217F5
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 24 Dec 2018 08:14:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="QoxWvqLf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbeLXIO6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 24 Dec 2018 03:14:58 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39471 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726686AbeLXIO6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Dec 2018 03:14:58 -0500
Received: by mail-lf1-f65.google.com with SMTP id n18so7793251lfh.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Dec 2018 00:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p2eTGrVdCb56lmQ8bh0a/1w61UvQAp7xkZvRdczZnzA=;
        b=QoxWvqLfXT7WdscYePwktJBmjXaZ50hEQCW4GqSOEftyIFIGDHt7Ciwe2Fkkf+VP16
         6o08Yf4FTifcY9mZlxYMgcpBFJavpVOz4t7iiq8r2TNquvjdSrhBoF2wrhTbtr3R96Gl
         IPEb31TlWrJs0wkRgwhCqAL3vOVGr0ucfKGKUxLeYcsX7JLF+ISTp+3vBk5KQT6njqPw
         bFoNpqHxyh6dj2bXlUXZ8KHhhJZ4DeQj4xeZv0CLQciYD4dKXkdgtH2QXHRRoYwGZE45
         sOhm6fjxombcMqq7OePjKJ2LWQFOYZIOITnuFRLdlMkJ0fSMWNDTRy3D/Z15nIi+zCfX
         SPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p2eTGrVdCb56lmQ8bh0a/1w61UvQAp7xkZvRdczZnzA=;
        b=sS1ChlaTmX087XSFAqOMXV7yQ8VUc5tbecHg/cXEskUttuVl3l6o8GAodTBBlCjEvB
         jLuzn6aKB564jO/Z2S16mO/ukQF0nSZblbFOOgfvEBm7U4vJpBl/26xKh35VmG2+mUHq
         FgZATYRBMa/BwTvHJS09aszIN+vJ2Hy35fEH+kgRU+a3rpp7VGXRlljg+adgOEPNFol7
         MVeSYsV1VtvFiMR9E3QHaN8ab6gv5xMx68X5JaBDFPEvY+uw7lbHV2sN3uj62HKiH30c
         uAKZD9tJ68xHosW4AmZ6GTU+ii5PD0hufl2Gs1VuPXQUifT+DolWN5gypK2Xdirvt76j
         RZ4w==
X-Gm-Message-State: AA+aEWaNrWci64Hhce7DRH2rTpE6KHKQMmKXSk3+TyLP5X5M0pXfX9ph
        VvLWDfD4WGksrr2+u9uJdxFPdw==
X-Google-Smtp-Source: AFSGD/WvkgUYW47OTmhIjMUi3qPyqltSPx/qbBvCSPGqeRm+e/F27xGKevtrvC+ERjD5m3nJniFbKA==
X-Received: by 2002:a19:d619:: with SMTP id n25mr5748585lfg.91.1545639296022;
        Mon, 24 Dec 2018 00:14:56 -0800 (PST)
Received: from [192.168.0.199] ([31.173.86.162])
        by smtp.gmail.com with ESMTPSA id e13-v6sm6328127ljk.53.2018.12.24.00.14.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Dec 2018 00:14:55 -0800 (PST)
Subject: Re: [PATCH v4 2/2] dt-bindings: spi: Document Renesas R-Car Gen3 RPC
 controller bindings
To:     Mason Yang <masonccyang@mxic.com.tw>, broonie@kernel.org,
        marek.vasut@gmail.com, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, boris.brezillon@bootlin.com,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     juliensu@mxic.com.tw, Simon Horman <horms@verge.net.au>,
        zhengxunli@mxic.com.tw
References: <1545634358-17485-1-git-send-email-masonccyang@mxic.com.tw>
 <1545634358-17485-3-git-send-email-masonccyang@mxic.com.tw>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <0f891c37-2e02-c7ec-d475-8f99d64dbb60@cogentembedded.com>
Date:   Mon, 24 Dec 2018 11:14:51 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <1545634358-17485-3-git-send-email-masonccyang@mxic.com.tw>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 24.12.2018 9:52, Mason Yang wrote:

> Document the bindings used by the Renesas R-Car Gen3 RPC controller.
> 
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> ---
>   .../devicetree/bindings/spi/spi-renesas-rpc.txt    | 37 ++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt b/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
> new file mode 100644
> index 0000000..ba863d7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
> @@ -0,0 +1,37 @@
> +Renesas R-Car Gen3 RPC controller Device Tree Bindings
> +------------------------------------------------------
> +
> +Required properties:
> +- compatible: should be "renesas,r8a77995-rpc"
> +- #address-cells: should be 1
> +- #size-cells: should be 0
> +- reg: should contain 2 entries, one for the registers and one for the direct
> +       mapping area
> +- reg-names: should contain "regs" and "dirmap"
> +- clock-names: should contain "rpc"
> +- clocks: should contain 1 entries for the module's clock
> +- renesas,rpc-mode: should contain "spi" for rpc spi mode or
> +			   	   "hyperflash" for rpc hyerflash mode.
                                                           ^ p

[...]

MBR, Sergei
