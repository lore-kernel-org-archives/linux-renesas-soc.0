Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:33540 "EHLO
	mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758467AbcHDSrU (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 4 Aug 2016 14:47:20 -0400
Received: by mail-io0-f172.google.com with SMTP id 38so279273606iol.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Aug 2016 11:46:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAO64nm52MSOe5Zk-m0gfiOV=sQCeZra5MvuGcTNY8BSb9Ls64A@mail.gmail.com>
References: <CAO64nm4ozZHoB5uKn8pKsShUOezrWAQwbk2XNSpKejTqPSPOtw@mail.gmail.com>
 <KL1PR06MB174925EF47C3CB04495A88FC8A070@KL1PR06MB1749.apcprd06.prod.outlook.com>
 <CAO64nm52MSOe5Zk-m0gfiOV=sQCeZra5MvuGcTNY8BSb9Ls64A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Aug 2016 20:46:06 +0200
Message-ID: <CAMuHMdXfK4kdBqr8gDngoZ5Nug66gDAf90nMJZe2qDVKxtPN8g@mail.gmail.com>
Subject: Re: spi-rspi mixes DMA and PIO transfers causing PIO transfer to fail.
To: Daniel Palmer <danieruru@gmail.com>
Cc: Chris Brandt <Chris.Brandt@renesas.com>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Daniel,

On Thu, Aug 4, 2016 at 8:16 PM, Daniel Palmer <danieruru@gmail.com> wrote:
> On 5 August 2016 at 02:56, Chris Brandt <Chris.Brandt@renesas.com> wrote:
>> From: linux-renesas-soc-owner@vger.kernel.org
>> [mailto:linux-renesas-soc-owner@vger.kernel.org] On Behalf Of Daniel Palmer
>> I got DMA working on the RZ/A1H and started to notice this:
>>
>> spi_master spi0: receive timeout
>>
>> What seems to be happening is that there is a DMA transfer for the SPI bus
>> happening so the interrupts are masked. A small transfer that is smaller
>> than the fifo size comes along so __rspi_can_dma returns false and a PIO
>> transfer is started but the interrupt to say it's finished is handled by the
>> DMA controller so the spi driver never sees that it finished. Making
>> __rspi_can_dma always return true makes the problem go away.

> I think I have actually worked this one out. I was blaming the SPI
> driver incorrectly.

As a person having worked on the rspi driver, I'm happy to hear that ;-)

> The DMA driver (Hacked up version from the BSP with DT support) was
> never resetting the register (DMARS) that causes the SPI interrupts to
> be routed there instead.
> So after a DMA transfer PIO never worked again.

Oops...

> I'm not sure it's actually any faster with DMA as there are massive
> delays between each byte being transmitted.

That's a shame, as on R-Car Gen2 it made a big difference when using
DMA for single SPI transfers, cfr.

commit 4f12b5e529e4ff274eb478ec1c2ef41358ed9577
Author: Geert Uytterhoeven <geert+renesas@glider.be>
Date:   Mon Jun 2 15:38:17 2014 +0200

    spi: rspi: Add DMA support for QSPI on R-Car Gen2

    Enable DMA support for QSPI on R-Car Gen2, for Single, Dual, and Quad SPI
    Transfers.

    Performance figures for reading from a QSPI FLASH driven at 24.375 MHz
    on r8a7791/koelsch:
      - Single:  1.1 Mbps PIO, 23 Mbps DMA
      - Dual  : 12.7 Mbps PIO, 48 Mbps DMA
      - Quad  : 13   Mbps PIO, 70 Mbps DMA

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
