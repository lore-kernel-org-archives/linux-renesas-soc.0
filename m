Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f170.google.com ([209.85.208.170]:46052 "EHLO
        mail-lj1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727675AbeGTMK1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 08:10:27 -0400
Received: by mail-lj1-f170.google.com with SMTP id q5-v6so10828490ljh.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Jul 2018 04:22:39 -0700 (PDT)
Subject: Re: [PATCH/RFC 01/02] ravb: Do not announce 100Mbps HDX as supported
To: Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <153200105784.13504.12882377600823578834.sendpatchset@little-apple>
 <153200106718.13504.7319401547888522726.sendpatchset@little-apple>
 <f7dad4b7-d1d6-3fcc-750d-deffc0e26717@cogentembedded.com>
 <CANqRtoQiyxrBwmNEZcDjMfR3ZPH-XfmXjJe0eCuvRE_zB0QKOw@mail.gmail.com>
 <CAMuHMdUh+EteHBVEG9ByHGiAdqQu8UbqNmkqYrncrEn3H7PG0g@mail.gmail.com>
 <19a353c1-34bb-ab61-8ace-c664f9764fd5@cogentembedded.com>
 <CAMuHMdUCrinbjiUpjQ92+h5Abac6_PAMyaCyRHjTVX1H+-tXGA@mail.gmail.com>
 <CANqRtoTGyQZ1fgkMFm-PyrkF1vD7zDhK9Vb8frLT4QdgbEULMg@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <08cdc53b-3746-7065-44ef-b89462391f26@cogentembedded.com>
Date: Fri, 20 Jul 2018 14:22:36 +0300
MIME-Version: 1.0
In-Reply-To: <CANqRtoTGyQZ1fgkMFm-PyrkF1vD7zDhK9Vb8frLT4QdgbEULMg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/20/2018 06:08 AM, Magnus Damm wrote:

>>>>>>> From: Magnus Damm <damm+renesas@opensource.se>
>>>>>>> According to the data sheet the Ethernet-AVB hardware in R-Car Gen3
>>>>>>> and R-Car Gen2 SoCs do not support half duplex operation. So update
>>>>>>> the driver to mark 100Mbit HDX as unsupported.
>>>>>>
>>>>>>    What about 1000Mbit HDX?
>>>>>
>>>>> For Twister Pair I believe 10 and 100 Mbps come in HDX and FDX flavors
>>>>> while 1 Gbps is HDX-only.
>>>>
>>>>  1 Gbps is _F_DX-only?
>>>
>>>    No, only higher speeds are FDX only.
>>>
>>>>> https://en.wikipedia.org/wiki/Ethernet_over_twisted_pair
>>
>> That wiki page says "However, half-duplex operation for gigabit speed isn't
>> supported by any existing hardware.".
> 
> Exactly. Also the PHY data sheet might have some additional
> information about bitmaps for advertised and supported modes.

   Indeed. KSZ9031MNX PHY seems to support 1000Mbit Half-duplex, judging on its
datasheet...

[...]

> Thanks,
> 
> / magnus

MBR, Sergei
