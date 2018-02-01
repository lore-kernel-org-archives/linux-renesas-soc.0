Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:36316 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754704AbeBATpB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Feb 2018 14:45:01 -0500
Received: by mail-lf0-f48.google.com with SMTP id t79so28017191lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Feb 2018 11:45:01 -0800 (PST)
Subject: Re: [PATCH] DT: dma: renesas,rcar-dmac: document R8A77980 support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: vinod.koul@intel.com, robh+dt@kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org
References: <8302f1c8-3deb-584b-d6c8-b46240275e9e@cogentembedded.com>
Message-ID: <b2a1c258-4904-7397-f771-82428a56b49d@cogentembedded.com>
Date: Thu, 1 Feb 2018 22:44:58 +0300
MIME-Version: 1.0
In-Reply-To: <8302f1c8-3deb-584b-d6c8-b46240275e9e@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/01/2018 10:09 PM, Sergei Shtylyov wrote:

> Renesas  R-Car V3H SoC has the R-Car gen3 compatible DMA controllers.
> Document R-Car V3H (also known as R8A77980) SoC bindings.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

   Forgot to mention that this patch is against the 'next' branch of Vinod Koul's 'slave-dma.git' repo...

MBR, Sergei
