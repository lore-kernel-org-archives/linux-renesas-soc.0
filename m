Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:33889 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751277AbdESG7E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 May 2017 02:59:04 -0400
MIME-Version: 1.0
In-Reply-To: <20170519035133.GN15061@localhost>
References: <20170515230917.31888-1-niklas.soderlund+renesas@ragnatech.se>
 <20170515230917.31888-2-niklas.soderlund+renesas@ragnatech.se> <20170519035133.GN15061@localhost>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 May 2017 08:59:03 +0200
Message-ID: <CAMuHMdVczxhy3fP4E+1Ggg5a_MDr3-DerrF6jFCCFp4wWjd-QA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dmaengine: rcar-dmac: store channel IRQ in struct rcar_dmac_chan
To: Vinod Koul <vinod.koul@intel.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>, dmaengine@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Vinod,

On Fri, May 19, 2017 at 5:51 AM, Vinod Koul <vinod.koul@intel.com> wrote:
> On Tue, May 16, 2017 at 01:09:15AM +0200, Niklas S=C3=B6derlund wrote:
>> The IRQ number is needed after probe to be able to add synchronisation
>> points in other places in the driver when freeing resources and to
>> implement a device_synchronize() callback. Store the IRQ number in the
>> struct rcar_dmac_chan so that it can be used later.
>>
>> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech=
.se>
>> ---
>>  drivers/dma/sh/rcar-dmac.c | 13 ++++++++-----
>>  1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
>> index db41795fe42ae6ed..c68c3336bdad44df 100644
>> --- a/drivers/dma/sh/rcar-dmac.c
>> +++ b/drivers/dma/sh/rcar-dmac.c
>> @@ -144,6 +144,7 @@ struct rcar_dmac_chan_map {
>>   * @chan: base DMA channel object
>>   * @iomem: channel I/O memory base
>>   * @index: index of this channel in the controller
>> + * @irq: channel IRQ
>>   * @src: slave memory address and size on the source side
>>   * @dst: slave memory address and size on the destination side
>>   * @mid_rid: hardware MID/RID for the DMA client using this channel
>> @@ -161,6 +162,7 @@ struct rcar_dmac_chan {
>>       struct dma_chan chan;
>>       void __iomem *iomem;
>>       unsigned int index;
>> +     int irq;
>
> Thats a bit odd choice to store per ch, I would have stored in rcar_dmac.
> Any specific reason, do we have per ch irq here?

Yes, each channel has its own interrupt.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
