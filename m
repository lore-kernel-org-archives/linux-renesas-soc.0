Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f49.google.com ([209.85.213.49]:34961 "EHLO
	mail-vk0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934849AbcHEPGP (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 5 Aug 2016 11:06:15 -0400
Received: by mail-vk0-f49.google.com with SMTP id w127so194017317vkh.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Aug 2016 08:06:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <KL1PR06MB17491404850EDA552933EC288A180@KL1PR06MB1749.apcprd06.prod.outlook.com>
References: <CAO64nm4ozZHoB5uKn8pKsShUOezrWAQwbk2XNSpKejTqPSPOtw@mail.gmail.com>
 <KL1PR06MB174925EF47C3CB04495A88FC8A070@KL1PR06MB1749.apcprd06.prod.outlook.com>
 <CAO64nm52MSOe5Zk-m0gfiOV=sQCeZra5MvuGcTNY8BSb9Ls64A@mail.gmail.com>
 <CAMuHMdXfK4kdBqr8gDngoZ5Nug66gDAf90nMJZe2qDVKxtPN8g@mail.gmail.com>
 <CAO64nm5dwJ2m__2QA40Gdr4rZQiQE+WYMzO0crfbYFvnB48ASQ@mail.gmail.com>
 <KL1PR06MB174903281FA1D587BFC9F0CC8A070@KL1PR06MB1749.apcprd06.prod.outlook.com>
 <CAO64nm4oCFoYUPZHDaDEJRCg9jEA5k2+S8yzAuHhS26mBmGhRw@mail.gmail.com>
 <KL1PR06MB1749B1F2FF9AD5FDFF82CA9C8A070@KL1PR06MB1749.apcprd06.prod.outlook.com>
 <CAO64nm6MA8dtJ07zm4C4XRHP2UGdBJ2Fmg73Kwp7_O3L43vCKw@mail.gmail.com> <KL1PR06MB17491404850EDA552933EC288A180@KL1PR06MB1749.apcprd06.prod.outlook.com>
From: Daniel Palmer <danieruru@gmail.com>
Date: Sat, 6 Aug 2016 00:06:13 +0900
Message-ID: <CAO64nm6uk-nRV+DzOmxM9MK8DxcEiBWs6pQJYUofNetj=FbaiA@mail.gmail.com>
Subject: Re: spi-rspi mixes DMA and PIO transfers causing PIO transfer to fail.
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I tried it out. Not a massive difference but at 10MHz (in reality
~8.6MHz) the delay between bytes goes from 1.36us down to 1.24us.
I didn't notice this before as I was looking at much longer buffer
being written and couldn't see CS go high again but if I write 32
bytes of data that is complete in ~80us but the chip select is held
low for 2ms after that. I think that's probably a bigger issue than
the delay between bytes. :)
