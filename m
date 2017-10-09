Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20171009055937.GE31804@verge.net.au>
References: <1507308574-32047-1-git-send-email-biju.das@bp.renesas.com> <20171009055937.GE31804@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Oct 2017 08:29:26 +0200
Message-ID: <CAMuHMdVOcFr5onmu5X7FMqLRcVk34f8Bgv9UyYPPq6uyyzAx8w@mail.gmail.com>
Subject: Re: [PATCH v2] usb: renesas_usbhs: Add compatible string for r8a7743/5
To: Simon Horman <horms@verge.net.au>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Mon, Oct 9, 2017 at 7:59 AM, Simon Horman <horms@verge.net.au> wrote:
> On Fri, Oct 06, 2017 at 05:49:34PM +0100, Biju Das wrote:
>> This patch adds support for r8a7743/5 SoCs. The Renesas RZ/G1[ME]
>> (R8A7743/5) usbhs is identical to the R-Car Gen2 family.
>>
>> No driver change is needed due to the fallback compatible value
>> "renesas,rcar-gen2-usbhs".
>> Adding the SoC-specific compatible values here has two purposes:
>>   1. Document which SoCs have this hardware module,
>>   2. Allow checkpatch to validate compatible values.
>
> 3. Allow the driver to support SoC specific implementations in future
>    as necessary.

Thanks for amending!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
