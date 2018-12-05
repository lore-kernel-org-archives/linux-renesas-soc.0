Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36969 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727182AbeLEQxL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 11:53:11 -0500
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77965: Add CAN controller
 nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20181118173327.4704-1-marek.vasut+renesas@gmail.com>
 <20181118230250.GA2553@kunai>
 <6ffce819-4d8e-e54a-ba82-0845c36a6ec4@gmail.com>
 <CAMuHMdUjONJYypV0a5wnxyBx+sUMHzRwZObQ=d7xFG2ZSCM3Ag@mail.gmail.com>
 <8808d836-2454-4166-fbe0-02849e52792b@gmail.com>
 <CAMuHMdWrNjmCmAuKjp=J2bUhXtXCNbNE2QHyT0df3AYF8ua9JA@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <a685e1ab-4d00-2214-9339-3b57a537f6c2@gmail.com>
Date: Wed, 5 Dec 2018 17:50:06 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWrNjmCmAuKjp=J2bUhXtXCNbNE2QHyT0df3AYF8ua9JA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11/21/2018 08:37 AM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> On Wed, Nov 21, 2018 at 12:33 AM Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 11/19/2018 10:00 AM, Geert Uytterhoeven wrote:
>>> On Mon, Nov 19, 2018 at 12:46 AM Marek Vasut <marek.vasut@gmail.com> wrote:
>>>> On 11/19/2018 12:02 AM, Wolfram Sang wrote:
>>>>> On Sun, Nov 18, 2018 at 06:33:26PM +0100, Marek Vasut wrote:
>>>>>> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>>>>>
>>>>>> This patch adds CAN{0,1} controller nodes for the R8A77965 SoC.
>>>>>>
>>>>>> Based on several similar patches of the R8A7795 device tree
>>>>>> by Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
>>>>>> and Geert Uytterhoeven <geert+renesas@glider.be>.
>>>>>>
>>>>>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>>> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
>>>>>> Cc: Rob Herring <robh@kernel.org>
>>>>>> Cc: Simon Horman <horms+renesas@verge.net.au>
>>>>>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>>>
>>>>> Were you able to do some testing using EXIO connectors? Would be nice to
>>>>> know what was tested.
>>>>
>>>> Not on the M3N, since I don't see it broken out on the EXIO ; is it
>>>> really there ? It'd be easy to test on M3NSK with KF, but I don't have
>>>> either KF or M3NSK.
>>>
>>> Please have a look at EXIO Connector D, pins 13/14/15.
>>
>> That's LBSC WE1n/WE0n/CS0n on S-XS . Is there something I obviously
>> don't see ?
> 
> Unless you connect an expansion card to the Ex Memory Connector,
> these signals are free to use, and can be pinmuxed to a CAN function.

Tested-by: Marek Vasut <marek.vasut@gmail.com>

on M3N Salvator-XS with a rats-nest MCP2551 setup on EXIO-D and Peak
CANFD USB.

-- 
Best regards,
Marek Vasut
