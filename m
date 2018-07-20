Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f42.google.com ([209.85.221.42]:45129 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731045AbeGTDy3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jul 2018 23:54:29 -0400
Received: by mail-wr1-f42.google.com with SMTP id t13-v6so444575wrv.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jul 2018 20:08:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUCrinbjiUpjQ92+h5Abac6_PAMyaCyRHjTVX1H+-tXGA@mail.gmail.com>
References: <153200105784.13504.12882377600823578834.sendpatchset@little-apple>
 <153200106718.13504.7319401547888522726.sendpatchset@little-apple>
 <f7dad4b7-d1d6-3fcc-750d-deffc0e26717@cogentembedded.com> <CANqRtoQiyxrBwmNEZcDjMfR3ZPH-XfmXjJe0eCuvRE_zB0QKOw@mail.gmail.com>
 <CAMuHMdUh+EteHBVEG9ByHGiAdqQu8UbqNmkqYrncrEn3H7PG0g@mail.gmail.com>
 <19a353c1-34bb-ab61-8ace-c664f9764fd5@cogentembedded.com> <CAMuHMdUCrinbjiUpjQ92+h5Abac6_PAMyaCyRHjTVX1H+-tXGA@mail.gmail.com>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Fri, 20 Jul 2018 12:08:24 +0900
Message-ID: <CANqRtoTGyQZ1fgkMFm-PyrkF1vD7zDhK9Vb8frLT4QdgbEULMg@mail.gmail.com>
Subject: Re: [PATCH/RFC 01/02] ravb: Do not announce 100Mbps HDX as supported
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Fri, Jul 20, 2018 at 5:09 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, Jul 19, 2018 at 7:56 PM Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
>> On 07/19/2018 08:42 PM, Geert Uytterhoeven wrote:
>> >>>> From: Magnus Damm <damm+renesas@opensource.se>
>> >>>> According to the data sheet the Ethernet-AVB hardware in R-Car Gen3
>> >>>> and R-Car Gen2 SoCs do not support half duplex operation. So update
>> >>>> the driver to mark 100Mbit HDX as unsupported.
>> >>>
>> >>>    What about 1000Mbit HDX?
>> >>
>> >> For Twister Pair I believe 10 and 100 Mbps come in HDX and FDX flavors
>> >> while 1 Gbps is HDX-only.
>> >
>> >  1 Gbps is _F_DX-only?
>>
>>    No, only higher speeds are FDX only.
>>
>> >> https://en.wikipedia.org/wiki/Ethernet_over_twisted_pair
>
> That wiki page says "However, half-duplex operation for gigabit speed isn't
> supported by any existing hardware.".

Exactly. Also the PHY data sheet might have some additional
information about bitmaps for advertised and supported modes.

> Running ethtool on a few systems shows that some of them don't support it, while
> others do.

Amen. Nice to see that at least someone else is using ethtool to test
link configuration. =/

Thanks,

/ magnus
