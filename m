Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:33241 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754256AbcKYJBm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Nov 2016 04:01:42 -0500
Received: by mail-vk0-f65.google.com with SMTP id l126so1691354vkh.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Nov 2016 01:01:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXOTqr=h0fF6AzCjX5Tv71xF8g=t-4=ZGwFuXZ75K_UyA@mail.gmail.com>
References: <1477933702-13423-1-git-send-email-geert+renesas@glider.be>
 <1477933702-13423-6-git-send-email-geert+renesas@glider.be> <CAMuHMdXOTqr=h0fF6AzCjX5Tv71xF8g=t-4=ZGwFuXZ75K_UyA@mail.gmail.com>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Fri, 25 Nov 2016 18:01:40 +0900
Message-ID: <CANqRtoSrLj4swEXkOXBob3F2ozN7P2aH0VPRS0QBCocSgYt1cg@mail.gmail.com>
Subject: Re: [PATCH/RFC 5/5] dmaengine: rcar-dmac: Widen DMA mask to 40 bits
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Fri, Nov 25, 2016 at 6:00 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, Oct 31, 2016 at 6:08 PM, Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>> By default, the DMA mask covers only the low 32-bit address space, which
>> causes SWIOTLB on arm64 to fall back to a bounce buffer for DMA
>> transfers involving memory outside the 32-bit address space.
>>
>> The R-Car DMA controller hardware supports a 40-bit address space, hence
>> widen the DMA mask to 40 bits to actually make use of this feature.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Any comments? Thanks!
>
>> ---
>>  drivers/dma/sh/rcar-dmac.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
>> index 2e441d0ccd79a37a..93a69b992a51a7aa 100644
>> --- a/drivers/dma/sh/rcar-dmac.c
>> +++ b/drivers/dma/sh/rcar-dmac.c
>> @@ -1716,6 +1716,7 @@ static int rcar_dmac_probe(struct platform_device *pdev)
>>
>>         dmac->dev = &pdev->dev;
>>         platform_set_drvdata(pdev, dmac);
>> +       dma_set_mask_and_coherent(dmac->dev, DMA_BIT_MASK(40));

This makes sense to me since the hardware and the driver both can
access more than 32-bits of physical address space.

Cheers,

/ magnus
