Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f51.google.com ([209.85.213.51]:35817 "EHLO
	mail-vk0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756664AbcHDSVc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 4 Aug 2016 14:21:32 -0400
Received: by mail-vk0-f51.google.com with SMTP id w127so174599474vkh.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Aug 2016 11:21:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <KL1PR06MB174925EF47C3CB04495A88FC8A070@KL1PR06MB1749.apcprd06.prod.outlook.com>
References: <CAO64nm4ozZHoB5uKn8pKsShUOezrWAQwbk2XNSpKejTqPSPOtw@mail.gmail.com>
 <KL1PR06MB174925EF47C3CB04495A88FC8A070@KL1PR06MB1749.apcprd06.prod.outlook.com>
From: Daniel Palmer <danieruru@gmail.com>
Date: Fri, 5 Aug 2016 03:16:14 +0900
Message-ID: <CAO64nm52MSOe5Zk-m0gfiOV=sQCeZra5MvuGcTNY8BSb9Ls64A@mail.gmail.com>
Subject: Re: spi-rspi mixes DMA and PIO transfers causing PIO transfer to fail.
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Thanks for the response.

I think I have actually worked this one out. I was blaming the SPI
driver incorrectly.
The DMA driver (Hacked up version from the BSP with DT support) was
never resetting the register (DMARS) that causes the SPI interrupts to
be routed there instead.
So after a DMA transfer PIO never worked again.

I'm not sure it's actually any faster with DMA as there are massive
delays between each byte being transmitted.
But it's working well enough to drive an SPI LCD and an SD card.

Cheers,

Daniel

On 5 August 2016 at 02:56, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> Well, it's a 16 byte FIFO, so if you can just fill it up and leave that's the easiest from a SW/HW standpoint.
>
> However, if you just used DMA every time, it would still finish just as fast without any CPU involvement so that's the same.
>
> So, maybe using the FIFO instead of DMA was a fun idea, but I don't see the technical advantage, so maybe make __rspi_can_dma always return true is fine (unless someone can think of an idea why it's better to use the FIFO instead of DMA for transfers under 16 bytes)
>
> The only other thing to do would be to add an extra flag (in struct rspi_data ) that keeps track if the current transfer is PIO or DMA. I've done that before for things like I2C drivers where doing DMA is hard for small packets. But, then you are adding more code and potential new bugs.
>
>
> Chris
>
>
> -----Original Message-----
> From: linux-renesas-soc-owner@vger.kernel.org [mailto:linux-renesas-soc-owner@vger.kernel.org] On Behalf Of Daniel Palmer
> Sent: Wednesday, August 03, 2016 5:15 PM
> To: linux-renesas-soc@vger.kernel.org
> Subject: spi-rspi mixes DMA and PIO transfers causing PIO transfer to fail.
>
> I got DMA working on the RZ/A1H and started to notice this:
>
> spi_master spi0: receive timeout
>
> What seems to be happening is that there is a DMA transfer for the SPI bus happening so the interrupts are masked. A small transfer that is smaller than the fifo size comes along so __rspi_can_dma returns false and a PIO transfer is started but the interrupt to say it's finished is handled by the DMA controller so the spi driver never sees that it finished. Making __rspi_can_dma always return true makes the problem go away.
>
> Does anyone have any suggestions to fix it properly?
>
> I'm not on the list so please CC me.
>
> Cheers,
>
> Daniel
