Return-Path: <SRS0=nIvG=PX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9119DC43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Jan 2019 12:51:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 04D7220656
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Jan 2019 12:51:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="snuAKbgz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728858AbfAOMvw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 15 Jan 2019 07:51:52 -0500
Received: from de-deferred1.bosch-org.com ([139.15.180.216]:48954 "EHLO
        de-deferred1.bosch-org.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728181AbfAOMvw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Jan 2019 07:51:52 -0500
X-Greylist: delayed 442 seconds by postgrey-1.27 at vger.kernel.org; Tue, 15 Jan 2019 07:51:49 EST
Received: from de-out1.bosch-org.com (unknown [139.15.180.215])
        by si0vms0224.rbdmz01.com (Postfix) with ESMTPS id 43f95Q4lD0z33T;
        Tue, 15 Jan 2019 13:44:26 +0100 (CET)
Received: from si0vm1948.rbesz01.com (unknown [139.15.230.188])
        by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 43f95N6Ky3z4f3kZF;
        Tue, 15 Jan 2019 13:44:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=2015-01-21; t=1547556264;
        bh=3L6lm52JdcPX18jM8oj0O5wRczUQgyXs3rzcmWiYayU=; l=10;
        h=From:From:Reply-To:Sender;
        b=snuAKbgzy0pFA2nQzj7LkrLDgi7GGZy88d6s3v+5B6VTudc/PCVuz6Xpkd2EvZEQ9
         OvdXNyhOLIiKM5gMYDisxkMpjKcq37kduUnCFbRnvTO6gtk3hRZkPteBfNdElqOmel
         vPWglmEYoV/XTcqMEWqJnnjl+TbhyBWGQEHNZJQo=
Received: from si0vm2082.rbesz01.com (unknown [10.58.172.176])
        by si0vm1948.rbesz01.com (Postfix) with ESMTPS id 43f95N5wQVz2ns;
        Tue, 15 Jan 2019 13:44:24 +0100 (CET)
X-AuditID: 0a3aad16-f1fff7000000381f-ca-5c3dd5a84336
Received: from fe0vm1651.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher AES128-SHA (128/128 bits))
        (Client did not present a certificate)
        by si0vm2082.rbesz01.com (SMG Outbound) with SMTP id D2.23.14367.8A5DD3C5; Tue, 15 Jan 2019 13:44:24 +0100 (CET)
Received: from FE-HUB2000.de.bosch.com (fe-hub2000.de.bosch.com [10.4.103.109])
        by fe0vm1651.rbesz01.com (Postfix) with ESMTPS id 43f95N3lJzz1pS;
        Tue, 15 Jan 2019 13:44:24 +0100 (CET)
Received: from [10.34.221.161] (10.34.221.161) by FE-HUB2000.de.bosch.com
 (10.4.103.109) with Microsoft SMTP Server id 15.1.1591.10; Tue, 15 Jan 2019
 13:44:24 +0100
Subject: Re: [PATCHv2 1/4] dmaengine: rcar-dmac: use result of updated
 get_residue in tx_status
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        <linux-renesas-soc@vger.kernel.org>,
        <laurent.pinchart+renesas@ideasonboard.com>
CC:     <dmaengine@vger.kernel.org>, <vinod.koul@intel.com>,
        <geert+renesas@glider.be>, <mfarooq@visteon.com>,
        Achim Dahlhoff <Achim.Dahlhoff@de.bosch.com>
References: <20160630151518.32329-1-niklas.soderlund+renesas@ragnatech.se>
 <20160630151518.32329-2-niklas.soderlund+renesas@ragnatech.se>
From:   Dirk Behme <dirk.behme@de.bosch.com>
Organization: Robert Bosch Car Multimedia GmbH
Message-ID: <22f3bf50-6241-5beb-0d6d-c556b6cfebb9@de.bosch.com>
Date:   Tue, 15 Jan 2019 13:44:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20160630151518.32329-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.34.221.161]
X-Brightmail-Tracker: H4sIAAAAAAAAA22TbUxbdRTG+be37W3p1cttC6fVTbxmH2SAHbCskeF0iUmzfdDEb65mXuRC
        m7WU9BYy9qkbUwcVLGjZaCcjluJs0QQ2ZgdkhjrjXkQYLwOhjr2QWIiMZAsMgmy2XFj7wW/n
        PM/5nSf/c3NxIeXENbip3M7ayhkzLZZhsjd/2JZzfrzIoPX7XtcF3esi3TfeJqRrPBHBdD1z
        DwW60WFa99f1bN1cw8/Y2xJ942CO3nuqRaT39c8J9H+PPhHrH3dv14d+uiV5X/yhbG8JazZV
        sbY33vpYZhz6zSuq+FJ9dPl+u8SBTivrkBQHsgC8oUlhHZLhFPmZAB51dAr4pg/BzPFLEr45
        j2AgEB+T4gqSAVdzcGNKSfoQ/Nt7HMUbIelF0BaIinnEiWDy0SQWR8RkFlx2nZLE6xfJXGi7
        MiiK1wS5D8b7F8XxGiN3wKDDvaGrSAN4Zhsk/EwaXG+Z3dgjJQ/C9MiZjRkhqYOWc0OIrzNg
        avacgK9fgZoer5B/3avgnnZiLqTwJK3yJOGeJNyThLchLIBUnElbZcnT6vJybcUsd0y7K/cT
        q6Ub8V8qPYT8N0rDiMQRLSd+HSgyUCKmiqu2hNFuXECrCHEwJr1QbC2pNjKc8bCt0sxytIZA
        KSkplOK5zFUWW0wcZ7KWhxHgQlpJVO3fa6CIEqb6GGuz8lgYvYRjdAaxVGQ6RJFljJ09wrIV
        rG3LLcRxGoiusVhgmo0tY4+Wmsz2LZvexmemJzvJsQJcGkb5uDyWfTq+guAqGAtnKtvE1TxO
        bakJ9Abao8kgrv4RY8i4a6wsf56qeZkYXyg0UKokI0HOoz9R7G4KIjoag+WxnyCRB8Sn7fcO
        UWmbYgLK88cYsikV2uvvI2gNLSG42tcsAnf9XTE8vXQCh+65b3HoD66kwsp4WxpEQy4KrnXc
        o2CqNaQA79qqAqKeeiXML15UwrOTPUqo7exVQvTamgq6J2rSYXViIAOWwk0AY98/BHCOXFTD
        2IWz2yHSVZsJd9YvZ8Jj/8xr4BnqyYKplbtZ4Pav7oTI7WgO/Oj6Kh8e9D3In48dUxA7pvif
        wvgx7Yz9f465qSZep3Eg3/K7TMM7gfTvPg+tD1rpicPyC9SRPRUTO6W1O8Qf/e5kHIZhYapf
        fmvYuvvJ1wfVv+x7uh8dMAqy3ScDVwpq3ZmsQztirHxvdaF32UeZmifnFzCzflGhvvlBR03O
        GWdpo5FdYyM3I5qCTotWpv3iNjPddba1bubOs5KG7GA7jXFGZleW0MYx/wGpelrVngQAAA==
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 30.06.2016 17:15, Niklas Söderlund wrote:
> From: Muhammad Hamza Farooq <mfarooq@visteon.com>
> 
> The hardware might have complete the transfer but the interrupt handler
> might not have had a chance to run. If rcar_dmac_chan_get_residue()
> which reads HW registers finds that there is no residue return
> DMA_COMPLETE.
> 
> Signed-off-by: Muhammad Hamza Farooq <mfarooq@visteon.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> [Niklas: add explanation in commit message]
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/dma/sh/rcar-dmac.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index dfb1792..791a064 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -1202,6 +1202,10 @@ static enum dma_status rcar_dmac_tx_status(struct dma_chan *chan,
>   	residue = rcar_dmac_chan_get_residue(rchan, cookie);
>   	spin_unlock_irqrestore(&rchan->lock, flags);
>   
> +	/* if there's no residue, the cookie is complete */
> +	if (!residue)
> +		return DMA_COMPLETE;
> +
>   	dma_set_residue(txstate, residue);
>   
>   	return status;


We have some doubts about this change (mainline commit [1]). Not being a 
DMA expert, let me try to explain:

We are configuring a cyclic, never ending DMA 
(dmaengine_prep_dma_cyclic()). For this cyclic DMA we continuously poll 
the residue (txstate->residue) via rcar_dmac_tx_status(). Having a 
cyclic, never ending DMA we think that residue == 0 is a valid value. 
However, with above change, a residue value of 0 is 'dropped' and never 
written via dma_set_residue() to txstate. So in case we continuously 
poll, this value is lost, resulting in wrong behavior of the caller.

In our case with cyclic, never ending DMA, changing this to

--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -1388,7 +1388,7 @@ static enum dma_status rcar_dmac_tx_status(struct 
dma_chan *chan,

         /* if there's no residue, the cookie is complete */
         if (!residue)
-               return DMA_COMPLETE;
+               status = DMA_COMPLETE;

         dma_set_residue(txstate, residue);

seems to help. If we ignore the still wrong DMA_COMPLETE status (which 
in case of cyclic DMA doesn't make any sense?) the caller get the 
correct txstate->residue values (not dropping the 0).

So maybe we need anything like

--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -1387,7 +1387,7 @@ static enum dma_status rcar_dmac_tx_status(struct 
dma_chan *chan,
         spin_unlock_irqrestore(&rchan->lock, flags);

         /* if there's no residue, the cookie is complete */
-       if (!residue)
+       if (!residue && !chan->desc.running->cyclic)
                 return DMA_COMPLETE;

         dma_set_residue(txstate, residue);

?

Opinions?

Best regards

Dirk

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/dma/sh/rcar-dmac.c?h=v5.0-rc2&id=3544d2878817bd139dda238cdd86a15e1c03d037
