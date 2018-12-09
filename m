Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37629 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbeLIPh4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 9 Dec 2018 10:37:56 -0500
Received: by mail-lj1-f194.google.com with SMTP id e5-v6so7430545lja.4
        for <linux-renesas-soc@vger.kernel.org>; Sun, 09 Dec 2018 07:37:55 -0800 (PST)
Subject: Re: [PATCH v3 0/2] spi: Add Renesas R-Car Gen3 RPC SPI driver
To: Mason Yang <masonccyang@mxic.com.tw>, broonie@kernel.org,
        marek.vasut@gmail.com, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, boris.brezillon@bootlin.com,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: juliensu@mxic.com.tw, Simon Horman <horms@verge.net.au>,
        zhengxunli@mxic.com.tw
References: <1544181199-3373-1-git-send-email-masonccyang@mxic.com.tw>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <1148d04d-96b1-ef91-e3d9-2603e9a5c6fc@cogentembedded.com>
Date: Sun, 9 Dec 2018 18:37:52 +0300
MIME-Version: 1.0
In-Reply-To: <1544181199-3373-1-git-send-email-masonccyang@mxic.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/07/2018 02:13 PM, Mason Yang wrote:

> This Renesas R-Car Gen3 RPC SPI driver is based on Boris's new
> spi-mem direct mapping read/write mode [1][2].
> 
> v3 patch is according to Marek and Geert's comments including:
> 1) soc_device_mach() to set up RPC_PHYCNT_STRTIM.
> 2) get_unaligned()
> 3) rpc-mode for rpi-spi-flash or rpc-hyperflash.
> 4) coding style and so on.
> 
> 
> v2 patch including:
> 1) remove RPC clock enable/dis-able control,
> 2) patch run time PM, 
> 3) add RPC module software reset, 
> 4) add regmap,
> 5) other coding style and so on.
> 
> thanks for your review.
> 
> best regards,
> Mason
> 
> [1] https://patchwork.kernel.org/patch/10670753
> [2] https://patchwork.kernel.org/patch/10670747
> 
> 
> Mason Yang (2):
>   spi: Add Renesas R-Car Gen3 RPC SPI controller driver
>   dt-binding: spi: Document Renesas R-Car Gen3 RPC controller bindings

   Probably a stupid question: how did you test this driver (especially
the dirmap related parts)?

MBR, Sergei
