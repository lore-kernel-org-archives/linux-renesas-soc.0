Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1489788135.8957.2.camel@collabora.co.uk>
References: <1485442422-18259-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1489788135.8957.2.camel@collabora.co.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Apr 2017 11:53:45 +0200
Message-ID: <CAMuHMdX9caECvsBnfUQhbQKdW_uGJ_VXAUksMMXw7EAGP8QUCQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: renesas: enable M3ULCB board peripherals
To: Simon Horman <horms@verge.net.au>
Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Content-Type: text/plain; charset=UTF-8
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Fri, Mar 17, 2017 at 11:02 PM, Sjoerd Simons
<sjoerd.simons@collabora.co.uk> wrote:
> On Thu, 2017-01-26 at 17:53 +0300, Vladimir Barinov wrote:
>> This adds the folowing:
>> - R8A7796 SoC based M3ULCB board peripherals
>>
>> Vladimir Barinov (4):
>> [1/4] arm64: dts: m3ulcb: enable I2C
>> [2/4] arm64: dts: m3ulcb: Update memory node to 2 GiB map
>> [3/4] arm64: dts: m3ulcb: enable EthernetAVB
>> [4/4] arm64: dts: m3ulcb: enable HS200 for eMMC
>
> Seems these didn't hit -next just yet, for this series (tested on a
> M3ULCB)
>
> Tested-By: Sjoerd Simons <sjoerd.simons@collabora.co.uk>

It seems this series is still pending? Any reason (not) to apply it?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
