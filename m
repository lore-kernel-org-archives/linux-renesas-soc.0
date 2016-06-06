Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:35115 "EHLO
	mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750764AbcFFS72 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 6 Jun 2016 14:59:28 -0400
Received: by mail-lf0-f45.google.com with SMTP id j198so217092lfe.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jun 2016 11:59:27 -0700 (PDT)
Subject: Re: [PATCH 04/13] ARM: shmobile: r8a7792: basic SoC support
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
 <2352834.cNFKgiQiVO@wasted.cogentembedded.com>
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <8b7f03a3-b15e-e7b3-4bca-63d18c19b80e@cogentembedded.com>
Date: Mon, 6 Jun 2016 21:59:23 +0300
MIME-Version: 1.0
In-Reply-To: <2352834.cNFKgiQiVO@wasted.cogentembedded.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 06/01/2016 01:18 AM, Sergei Shtylyov wrote:

> Add minimal support for the R-Car V2H (R8A7792) SoC.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
[...]

> Index: renesas/arch/arm/mach-shmobile/setup-r8a7792.c
> ===================================================================
> --- /dev/null
> +++ renesas/arch/arm/mach-shmobile/setup-r8a7792.c
> @@ -0,0 +1,34 @@
> +/*
> + * r8a7792 processor support
> + *
> + * Copyright (C) 2014  Renesas Electronics Corporation

    Hm, I thought I'd stamped Cogent's copyright here... Please hold on with 
merging this patch.

[...]

MBR, Sergei
