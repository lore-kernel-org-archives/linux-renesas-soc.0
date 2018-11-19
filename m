Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:47079 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbeKTBId (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 20:08:33 -0500
Received: by mail-lf1-f65.google.com with SMTP id f23so21490370lfc.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Nov 2018 06:44:43 -0800 (PST)
Subject: Re: [PATCH] mmc: tmio: introduce mask for 'always 1' bits
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Marek Vasut <marek.vasut@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
References: <20181119131357.28648-1-wsa+renesas@sang-engineering.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <cd31363e-0888-9860-223c-04b958eff8a8@cogentembedded.com>
Date: Mon, 19 Nov 2018 17:44:40 +0300
MIME-Version: 1.0
In-Reply-To: <20181119131357.28648-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 11/19/2018 04:13 PM, Wolfram Sang wrote:

> Some variants (namely Renesas SDHI) have bits in the STATS and IRQ_MASK
> registers which are 'always 1' and should be written as such. Introduce
> a seperate mask for this and apply it whenever such a register is

   Separate. :-)

> written.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> This is my response to BSP patches modifying all the register writes directly
> (BSP commits 2d339800bbc73d and f73d5eb86097df). This seems much more future
> proof to me.
> 
> Yamada-san: could you check if your HW has 'always 1' bits, too?
> 
> Tested on a R-Car M3-N. No regression and no performance impacts when reading
> large files from eMMC or UHS-SD cards.

[...]

MBR, Sergei
