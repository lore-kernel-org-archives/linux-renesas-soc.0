Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f53.google.com ([209.85.213.53]:33942 "EHLO
	mail-vk0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752688AbcHEJLY (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 5 Aug 2016 05:11:24 -0400
Received: by mail-vk0-f53.google.com with SMTP id s189so187311929vkh.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Aug 2016 02:11:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <KL1PR06MB1749B1F2FF9AD5FDFF82CA9C8A070@KL1PR06MB1749.apcprd06.prod.outlook.com>
References: <CAO64nm4ozZHoB5uKn8pKsShUOezrWAQwbk2XNSpKejTqPSPOtw@mail.gmail.com>
 <KL1PR06MB174925EF47C3CB04495A88FC8A070@KL1PR06MB1749.apcprd06.prod.outlook.com>
 <CAO64nm52MSOe5Zk-m0gfiOV=sQCeZra5MvuGcTNY8BSb9Ls64A@mail.gmail.com>
 <CAMuHMdXfK4kdBqr8gDngoZ5Nug66gDAf90nMJZe2qDVKxtPN8g@mail.gmail.com>
 <CAO64nm5dwJ2m__2QA40Gdr4rZQiQE+WYMzO0crfbYFvnB48ASQ@mail.gmail.com>
 <KL1PR06MB174903281FA1D587BFC9F0CC8A070@KL1PR06MB1749.apcprd06.prod.outlook.com>
 <CAO64nm4oCFoYUPZHDaDEJRCg9jEA5k2+S8yzAuHhS26mBmGhRw@mail.gmail.com> <KL1PR06MB1749B1F2FF9AD5FDFF82CA9C8A070@KL1PR06MB1749.apcprd06.prod.outlook.com>
From: Daniel Palmer <danieruru@gmail.com>
Date: Fri, 5 Aug 2016 18:11:22 +0900
Message-ID: <CAO64nm6MA8dtJ07zm4C4XRHP2UGdBJ2Fmg73Kwp7_O3L43vCKw@mail.gmail.com>
Subject: Re: spi-rspi mixes DMA and PIO transfers causing PIO transfer to fail.
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I've done some experiments to try to locate where the delay is and it
does seem to just be reading the source data is slow.
If I reduce the SPI bus speed the length of the delay (in spi clocks)
between bytes is shorter.
At 10MHz there are ~24 clocks of idle but with 1MHz there are only ~4
clocks of idle.

The DMA controller in the RZ/A1 can apparently read a long from the
source in one transaction and feed it too the destination
as 4 byte writes so I'm thinking maybe I can setup the DMA controller
to read 2 longs and write that as 8 bytes in one go so
that each DMA transaction fills the SPI controller's FIFO.
