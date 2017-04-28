Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB11658EC3A3A80C57E6F539AC8A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
 <1493281194-5200-2-git-send-email-jacopo+renesas@jmondi.org>
 <CAHp75Vcy1OE+9htFx9k3kQhGARQPT1C0gg3SEKZd7ULu_vkUMA@mail.gmail.com>
 <CACRpkdayW0qPXDcc_JofkwtX5UHhDPxiY_8deZZ7+hPNJkjgeQ@mail.gmail.com>
 <SG2PR06MB1165E7E651BE96CD7B7738B08A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75Vcp_eMWrjZRX-x3=Tt3JRXcL_wWG43MymF=oyLLP4EJwg@mail.gmail.com> <SG2PR06MB11658EC3A3A80C57E6F539AC8A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 28 Apr 2017 17:53:00 +0300
Message-ID: <CAHp75VeLtOuty=iaxuCaH43rnBZDTT03iH7JyjDJBQhTD-EjzA@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] pinctrl: generic: Add bi-directional and output-enable
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Apr 28, 2017 at 4:18 PM, Chris Brandt <Chris.Brandt@renesas.com> wr=
ote:
> On Friday, April 28, 2017, Andy Shevchenko wrote:
>> > In the RZ/A1 HW manual you can kind of see that in 54.18 Port Control
>> Logical Diagram (but that wasn't obvious to me at first).
>>
>> Please, post a link to it or copy essential parts.

> The schematic is included in the "User's manual"
> https://www.renesas.com/en-us/doc/products/tool/doc/003/r20ut2596ej_r7s72=
100evum.pdf

Not that one I would like to see...

> The RZ/A1H Hardware manual is here:
> https://www.renesas.com/en-us/document/hw-manual?hwLayerShowFlg=3Dtrue&pr=
dLayerId=3D186374&layerName=3DRZ%252FA1H&coronrService=3Ddocument-prd-searc=
h&hwDocUrl=3D%2Fen-us%2Fdoc%2Fproducts%2Fmpumcu%2Fdoc%2Frz%2Fr01uh0403ej030=
0_rz_a1h.pdf&hashKey=3D54f335753742b5add524d4725b7242e6
>
> Chapter 54 is the port/pin controller.
>
> "54.18 Port Control Logical Diagram" is the diagram I was talking about. =
Note that is says "Note: This figure shows the logic for reference, not the=
 circuit."
>
> "54.3.13 Port Bidirection Control Register (PBDCn)" is the magic register=
 needed to get some pins to work.

This is useful. Thanks.

>> I'm quite skeptical  that cheap hardware can implement something more
>> costable than simplest open-source / open-drain + bias
>
> I don't think this is an open-source / open-drain + bias issue. It's a "t=
he internal signal paths are not getting hooked up correctly" issue.

Had you read the following, esp. Note there?

* @PIN_CONFIG_INPUT_ENABLE: enable the pin's input.  Note that this does no=
t
*      affect the pin's ability to drive output.  1 enables input, 0 disabl=
es
*      input.

For me manual is clearly tells about this settings:
"This register enables or disables the input buffer while the output
buffer is enabled."

> Regardless, on this part, we needed a way to flag that some pins when put=
 in some function modes needed 'an extra register setting'. At first we tri=
ed to sneak that info in with a simple #define in the pin/pinmux DT node pr=
operties. But, Linus didn't want it there so we had to make up a new generi=
c property called "bi-directional".
>
> What is your end goal here? Get "bi-directional" changed to something els=
e?

My goal is to reduce amount of (useless) entities. See Occam's razor
for details.

Linus, for me it looks like better to revert that change, until we
will have clear picture why existing configuration parameters can't
work.

--=20
With Best Regards,
Andy Shevchenko
