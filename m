Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f176.google.com ([209.85.217.176]:33817 "EHLO
	mail-ua0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758969AbcHDS7W (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 4 Aug 2016 14:59:22 -0400
Received: by mail-ua0-f176.google.com with SMTP id 35so181210446uap.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Aug 2016 11:58:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXfK4kdBqr8gDngoZ5Nug66gDAf90nMJZe2qDVKxtPN8g@mail.gmail.com>
References: <CAO64nm4ozZHoB5uKn8pKsShUOezrWAQwbk2XNSpKejTqPSPOtw@mail.gmail.com>
 <KL1PR06MB174925EF47C3CB04495A88FC8A070@KL1PR06MB1749.apcprd06.prod.outlook.com>
 <CAO64nm52MSOe5Zk-m0gfiOV=sQCeZra5MvuGcTNY8BSb9Ls64A@mail.gmail.com> <CAMuHMdXfK4kdBqr8gDngoZ5Nug66gDAf90nMJZe2qDVKxtPN8g@mail.gmail.com>
From: Daniel Palmer <danieruru@gmail.com>
Date: Fri, 5 Aug 2016 03:58:58 +0900
Message-ID: <CAO64nm5dwJ2m__2QA40Gdr4rZQiQE+WYMzO0crfbYFvnB48ASQ@mail.gmail.com>
Subject: Re: spi-rspi mixes DMA and PIO transfers causing PIO transfer to fail.
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <Chris.Brandt@renesas.com>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 5 August 2016 at 03:46, Geert Uytterhoeven <geert@linux-m68k.org> wrote:

>     Performance figures for reading from a QSPI FLASH driven at 24.375 MHz
>     on r8a7791/koelsch:
>       - Single:  1.1 Mbps PIO, 23 Mbps DMA
>       - Dual  : 12.7 Mbps PIO, 48 Mbps DMA
>       - Quad  : 13   Mbps PIO, 70 Mbps DMA

Thanks for those numbers. I have something to aim for now. :)
What I'm seeing on my logic analyser with the bus at 10MHz is 8 clocks
taking ~500ns,
~1700ns of idle and then 8 more clocks. spi-rpi doesn't seem to set
any of the registers
for adding in delays so I guess it's to do with the DMA controller.

Cheers,

Daniel
