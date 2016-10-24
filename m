Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yw0-f194.google.com ([209.85.161.194]:33065 "EHLO
        mail-yw0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753962AbcJXLGk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Oct 2016 07:06:40 -0400
MIME-Version: 1.0
In-Reply-To: <20161021215639.GB1450@katana>
References: <20160912141507.6837-1-chris.brandt@renesas.com>
 <20160912141507.6837-3-chris.brandt@renesas.com> <20161020132852.GB4177@katana>
 <SG2PR06MB11652EB5B1A40583636F8FB28AD50@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <20161020231245.GB2199@katana> <SG2PR06MB1165F5878C8417068E7364628AD40@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <20161021215639.GB1450@katana>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Oct 2016 13:06:38 +0200
Message-ID: <CAMuHMdU3q5PTXumWgizK1RG1nK6X6nCq1ySZ6z0DCH0uy+ZB2Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] mmc: tmio-mmc: add support for 32bit data port
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Chris Brandt <Chris.Brandt@renesas.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Fri, Oct 21, 2016 at 11:56 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>> For the VERSION register, the low byte is the version of the IP, but
>> the upper byte is a number that the design group that made the part
>
> I know. It is just that I haven't seen this one "in the wild" so far.

I think you can also see it on your tamed Genmai ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
