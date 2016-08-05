Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f43.google.com ([209.85.213.43]:36172 "EHLO
	mail-vk0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754029AbcHEPi5 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 5 Aug 2016 11:38:57 -0400
Received: by mail-vk0-f43.google.com with SMTP id n129so193813674vke.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Aug 2016 08:38:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <KL1PR06MB174953C61C3E5B57D7B8A15D8A180@KL1PR06MB1749.apcprd06.prod.outlook.com>
References: <CAO64nm4ozZHoB5uKn8pKsShUOezrWAQwbk2XNSpKejTqPSPOtw@mail.gmail.com>
 <KL1PR06MB174925EF47C3CB04495A88FC8A070@KL1PR06MB1749.apcprd06.prod.outlook.com>
 <CAO64nm52MSOe5Zk-m0gfiOV=sQCeZra5MvuGcTNY8BSb9Ls64A@mail.gmail.com>
 <CAMuHMdXfK4kdBqr8gDngoZ5Nug66gDAf90nMJZe2qDVKxtPN8g@mail.gmail.com>
 <CAO64nm5dwJ2m__2QA40Gdr4rZQiQE+WYMzO0crfbYFvnB48ASQ@mail.gmail.com>
 <KL1PR06MB174903281FA1D587BFC9F0CC8A070@KL1PR06MB1749.apcprd06.prod.outlook.com>
 <CAO64nm4oCFoYUPZHDaDEJRCg9jEA5k2+S8yzAuHhS26mBmGhRw@mail.gmail.com>
 <KL1PR06MB1749B1F2FF9AD5FDFF82CA9C8A070@KL1PR06MB1749.apcprd06.prod.outlook.com>
 <CAO64nm6MA8dtJ07zm4C4XRHP2UGdBJ2Fmg73Kwp7_O3L43vCKw@mail.gmail.com>
 <KL1PR06MB17491404850EDA552933EC288A180@KL1PR06MB1749.apcprd06.prod.outlook.com>
 <CAO64nm6uk-nRV+DzOmxM9MK8DxcEiBWs6pQJYUofNetj=FbaiA@mail.gmail.com> <KL1PR06MB174953C61C3E5B57D7B8A15D8A180@KL1PR06MB1749.apcprd06.prod.outlook.com>
From: Daniel Palmer <danieruru@gmail.com>
Date: Sat, 6 Aug 2016 00:38:55 +0900
Message-ID: <CAO64nm7Xj0EpTM0mCncbL8BWQn_R59+631LeOgjJcPFn1foR6g@mail.gmail.com>
Subject: Re: spi-rspi mixes DMA and PIO transfers causing PIO transfer to fail.
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

That's what I expected too. The issue with the CS being held low so
long makes me think there is a little bit more to it.
PIO transfers show the same issue with CS so I'm going to try to fix
that before looking at DMA again.

On 6 August 2016 at 00:19, Chris Brandt <Chris.Brandt@renesas.com> wrote:
>> Not a massive difference but at 10MHz (in reality
>> ~8.6MHz) the delay between bytes goes from 1.36us down to 1.24us.
>
> Really???
>
> You're experiment was to load up the FIFO (8 bytes) using the DMA which would make me think that you would see bursts of fast data.
>
> --[][][][][][][][]---delay---[][][][][][][][]---delay---[][]etc...
>
> But, it sounds like there is still a delay between bytes
>
> --[]--[]--[]--[]--etc...
>
> That surprises me.
>
>
> -Chris
