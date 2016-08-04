Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f179.google.com ([209.85.217.179]:36479 "EHLO
	mail-ua0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934134AbcHDTex (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 4 Aug 2016 15:34:53 -0400
Received: by mail-ua0-f179.google.com with SMTP id j59so181663385uaj.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Aug 2016 12:34:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <KL1PR06MB174903281FA1D587BFC9F0CC8A070@KL1PR06MB1749.apcprd06.prod.outlook.com>
References: <CAO64nm4ozZHoB5uKn8pKsShUOezrWAQwbk2XNSpKejTqPSPOtw@mail.gmail.com>
 <KL1PR06MB174925EF47C3CB04495A88FC8A070@KL1PR06MB1749.apcprd06.prod.outlook.com>
 <CAO64nm52MSOe5Zk-m0gfiOV=sQCeZra5MvuGcTNY8BSb9Ls64A@mail.gmail.com>
 <CAMuHMdXfK4kdBqr8gDngoZ5Nug66gDAf90nMJZe2qDVKxtPN8g@mail.gmail.com>
 <CAO64nm5dwJ2m__2QA40Gdr4rZQiQE+WYMzO0crfbYFvnB48ASQ@mail.gmail.com> <KL1PR06MB174903281FA1D587BFC9F0CC8A070@KL1PR06MB1749.apcprd06.prod.outlook.com>
From: Daniel Palmer <danieruru@gmail.com>
Date: Fri, 5 Aug 2016 04:26:57 +0900
Message-ID: <CAO64nm4oCFoYUPZHDaDEJRCg9jEA5k2+S8yzAuHhS26mBmGhRw@mail.gmail.com>
Subject: Re: spi-rspi mixes DMA and PIO transfers causing PIO transfer to fail.
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 5 August 2016 at 04:13, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> Is your source buffer in external SDRAM?

The gr peach board only has the internal 10MB SRAM so everything
should be coming from there.
The kernel is running from the memory mapped SPI flash however. I'm
not sure if that would make a difference.
