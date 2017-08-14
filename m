Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <af57e696-be8d-f44b-0325-8950d2ae87d2@linaro.org>
References: <20160314142342.17180.21352.sendpatchset@little-apple>
 <20161124105843.GA26737@verge.net.au> <20170711115646.GL4517@verge.net.au>
 <CAMuHMdX=+HZwOK097HBJ0vWGDpcLQ1dYWSNtb62DSecmvTVz=A@mail.gmail.com> <af57e696-be8d-f44b-0325-8950d2ae87d2@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Aug 2017 22:07:21 +0200
Message-ID: <CAMuHMdXd5Ukb=RMsnpMirOTD-XDrvt8dYckjaKRA61xvVLSbvw@mail.gmail.com>
Subject: Re: [PATCH v4 00/06] clocksource: sh_cmt: DT binding rework V4
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Daniel, Magnus,

On Thu, Aug 10, 2017 at 12:56 PM, Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
> On 10/08/2017 11:01, Geert Uytterhoeven wrote:
>> On Tue, Jul 11, 2017 at 1:56 PM, Simon Horman <horms@verge.net.au> wrote:
>>> On Thu, Nov 24, 2016 at 11:58:43AM +0100, Simon Horman wrote:
>>>> On Mon, Mar 14, 2016 at 11:23:42PM +0900, Magnus Damm wrote:
>>>>> clocksource: sh_cmt: DT binding rework V4
>>>>>
>>>>> [PATCH v4 01/06] devicetree: bindings: Remove sh7372 CMT binding
>>>>> [PATCH v4 02/06] devicetree: bindings: R-Car Gen2 CMT0 and CMT1 bindings
>>>>> [PATCH v4 03/06] devicetree: bindings: r8a73a4 and R-Car Gen2 CMT bindings
>>>>> [PATCH v4 04/06] devicetree: bindings: Deprecate property, update example
>>>>> [PATCH v4 05/06] devicetree: bindings: Remove unused 32-bit CMT bindings
>>>>> [PATCH v4 06/06] devicetree: bindings: Remove deprecated properties
>>>>>
>>>>> Here is the latest and hopefully final take on updating the CMT DT
>>>>> bindings for R-Car Gen2. In total there are 6 patches that have acks
>>>>> and are ready to be picked up and merged. Other earlier posted changes
>>>>> such as driver modification and SoC DTS bits depend on this series.
>>>>
>>>> I am wondering what the state of this work is.
>>>> I see only one minor review comment for this series.
>>>> It would be great to see it merged.
>>>
>>> Ping
>>
>> Recently, at +1800m, I realized that if we want to continue this work, we
>> better do it soon, so it can be included in the big R-Car Gen2 flag day
>> requiring APMU, CPG/MSSR, ICRAM, RST, and SYSC being described in DT.
>
> Applied.

Thank you.

Of course, before we can convert existing DT source files to the new bindings,
we need support for the new bindings in the sh_cmt driver.

Magnus: what is the status of that? Where can we find the latest code?

Thanks again!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
