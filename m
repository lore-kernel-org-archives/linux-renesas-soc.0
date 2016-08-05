Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f49.google.com ([209.85.213.49]:33833 "EHLO
	mail-vk0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753999AbcHEQvI (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 5 Aug 2016 12:51:08 -0400
Received: by mail-vk0-f49.google.com with SMTP id s189so195937811vkh.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Aug 2016 09:51:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <KL1PR06MB17496A66F365CA6FFCF751B18A180@KL1PR06MB1749.apcprd06.prod.outlook.com>
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
 <CAO64nm6uk-nRV+DzOmxM9MK8DxcEiBWs6pQJYUofNetj=FbaiA@mail.gmail.com>
 <KL1PR06MB174953C61C3E5B57D7B8A15D8A180@KL1PR06MB1749.apcprd06.prod.outlook.com>
 <CAO64nm7Xj0EpTM0mCncbL8BWQn_R59+631LeOgjJcPFn1foR6g@mail.gmail.com> <KL1PR06MB17496A66F365CA6FFCF751B18A180@KL1PR06MB1749.apcprd06.prod.outlook.com>
From: Daniel Palmer <danieruru@gmail.com>
Date: Sat, 6 Aug 2016 01:51:06 +0900
Message-ID: <CAO64nm5+et8_FbZBusGmugt4MbCiXwrdwRK9oVd_qYvrKOLc-A@mail.gmail.com>
Subject: Re: spi-rspi mixes DMA and PIO transfers causing PIO transfer to fail.
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

That makes sense and there's not much that can be done to fix it so
back to working out the delay between bytes. :)

On 6 August 2016 at 01:40, Chris Brandt <Chris.Brandt@renesas.com> wrote:
>> The issue with the CS being held low so long makes me think there is a
>> little bit more to it.
>
> If you look at function rspi_setup, you'll see that bit SPCMD_SSLKP is set so the CS will stay low after every transfer until SW comes back in and manually puts it back high.
> I would guess the delay you are seeing there is a kernel scheduling delay of letting the driver resume running again after the wait_event_timeout call.
>
>
> Chris
