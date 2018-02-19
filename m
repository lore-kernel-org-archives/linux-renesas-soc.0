Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f182.google.com ([209.85.220.182]:38642 "EHLO
        mail-qk0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752047AbeBSIxf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Feb 2018 03:53:35 -0500
Received: by mail-qk0-f182.google.com with SMTP id s198so11313455qke.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2018 00:53:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <e22632bc-c612-de23-0ceb-4e317d41b04b@gmail.com>
References: <20180217020642.21375-1-marek.vasut+renesas@gmail.com>
 <20180217081857.xowqahwnzob6titp@katana> <e22632bc-c612-de23-0ceb-4e317d41b04b@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Feb 2018 09:53:34 +0100
Message-ID: <CAMuHMdX3j-4=RCB0bNhLt2Gj_8dKdEXa1Gger=40KYJ3rwgJ9Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: shmobile: Factor out complex condition
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Marek,

On Sat, Feb 17, 2018 at 12:46 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> On 02/17/2018 09:18 AM, Wolfram Sang wrote:
>>> -    if ((client->addr == 0x58 && !strcmp(client->name, "da9063")) ||
>>> -        (client->addr == 0x68 && !strcmp(client->name, "da9210")) ||
>>> -        (client->addr == 0x70 && !strcmp(client->name, "da9210"))) {
>>> +    if (regulator_quirk_check(client, 0, "da9063") ||
>>> +        regulator_quirk_check(client, 1, "da9210") ||
>>> +        regulator_quirk_check(client, 2, "da9210")) {
>>
>> I am afraid I don't think this makes the code better, just different.
>> The index is as magic as the client address IMO. I was not super happy
>> with the array size depending on the detected board from a previous
>> patch already. But given the next patch which modifies the msg array
>> depending on the board, I think we really need to switch to seperate
>> message arrays per board. Everything else is too error prone and
>> unnecessarily cumbersome to understand.
>>
>> Other opinions?
>
> The code is awful, yes.
>
> I wonder if we could rather find all DA0063 and DA9210 PMICs in the DT,
> check if their IRQ lines are tied together and then generate the table
> above dynamically for whatever PMICs are present in the system. Then all
> that special-casing would go away as we'd extract the information from DT.

Yes, like I suggested 4 days ago ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
