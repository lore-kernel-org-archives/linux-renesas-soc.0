Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f175.google.com ([209.85.217.175]:33427 "EHLO
	mail-ua0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758170AbcHCVPt (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 3 Aug 2016 17:15:49 -0400
Received: by mail-ua0-f175.google.com with SMTP id k90so161975112uak.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Aug 2016 14:15:22 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Palmer <danieruru@gmail.com>
Date: Thu, 4 Aug 2016 06:15:20 +0900
Message-ID: <CAO64nm4ozZHoB5uKn8pKsShUOezrWAQwbk2XNSpKejTqPSPOtw@mail.gmail.com>
Subject: spi-rspi mixes DMA and PIO transfers causing PIO transfer to fail.
To: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I got DMA working on the RZ/A1H and started to notice this:

spi_master spi0: receive timeout

What seems to be happening is that there is a DMA transfer for the SPI
bus happening so the interrupts are masked. A small transfer that is
smaller than the fifo size comes along so __rspi_can_dma returns false
and a PIO transfer is started but the interrupt to say it's finished
is handled by the DMA controller so the spi driver never sees that it
finished. Making __rspi_can_dma always return true makes the problem
go away.

Does anyone have any suggestions to fix it properly?

I'm not on the list so please CC me.

Cheers,

Daniel
