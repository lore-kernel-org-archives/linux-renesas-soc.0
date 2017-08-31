Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:36494 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750922AbdHaI1C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2017 04:27:02 -0400
MIME-Version: 1.0
In-Reply-To: <TY1PR06MB0992F3C5BB9FB2808980FEB1D89D0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1504164672-20677-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1504164672-20677-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWm2Ej6gV0QSBUrh1u9YY5KkE-iSWKVc7KGDZEEKmu3oA@mail.gmail.com> <TY1PR06MB0992F3C5BB9FB2808980FEB1D89D0@TY1PR06MB0992.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 31 Aug 2017 10:27:01 +0200
Message-ID: <CAMuHMdWwqnR0hFhkD8=LdV2RyRm+-S8AU3jBbgJGHfFb+s2pzg@mail.gmail.com>
Subject: Re: [PATCH 3/4] phy: rcar-gen3-usb2: add SoC-specific parameter for
 dedicated pins
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-san,

On Thu, Aug 31, 2017 at 10:15 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>> From: Geert Uytterhoeven
>> Sent: Thursday, August 31, 2017 4:51 PM
>> On Thu, Aug 31, 2017 at 9:31 AM, Yoshihiro Shimoda
>> <yoshihiro.shimoda.uh@renesas.com> wrote:
>> > This patch adds SoC-specific parameter to avoid reading/writing
>> > specific registers wronly if this driver runs on a SoC which doesn't
>> > have dedicated pins (e.g. R-Car D3).
>> >
>> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> > ---
>> >  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 25 ++++++++++++++++++++-----
>> >  1 file changed, 20 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>> > index 4ea9902..28ebc98 100644
>> > --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>> > +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>>
>> > @@ -400,9 +403,18 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
>> >  }
>> >
>> >  static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
>> > -       { .compatible = "renesas,usb2-phy-r8a7795" },
>> > -       { .compatible = "renesas,usb2-phy-r8a7796" },
>> > -       { .compatible = "renesas,rcar-gen3-usb2-phy" },
>> > +       {
>> > +               .compatible = "renesas,usb2-phy-r8a7795",
>> > +               .data = (void *)RCAR_GEN3_PHY_HAS_DEDICATED_PINS,
>> > +       },
>> > +       {
>> > +               .compatible = "renesas,usb2-phy-r8a7796",
>> > +               .data = (void *)RCAR_GEN3_PHY_HAS_DEDICATED_PINS,
>> > +       },
>> > +       {
>> > +               .compatible = "renesas,rcar-gen3-usb2-phy",
>> > +               .data = (void *)RCAR_GEN3_PHY_HAS_DEDICATED_PINS,
>> > +       },
>> >         { }
>> >  };
>>
>> Given the generic R-Car Gen3 entry sets RCAR_GEN3_PHY_HAS_DEDICATED_PINS, you
>> cannot specify the fallback compatible value of "renesas,rcar-gen3-usb2-phy"
>> in the R-Car D3 .dtsi.
>
> I understood it.
>
>> So I'm wondering, does the USB2 PHY still work (with limitations) on R-Car H3
>> and M3-W if you drop RCAR_GEN3_PHY_HAS_DEDICATED_PINS?
>
> Yes, the USB PHY still work with limitation (otg capability channel works as
> peripheral mode only. Other channels are no limitation).

That's good to hear.

>> If yes, you can drop the flag from the generic entry, and R-Car D3 can specify
>> the generic fallback compatible value in its .dtsi, like H3 and M3-W.
>
> I got it. I will fix this patch set.

And you can drop the driver change from "[PATCH 4/4] phy: rcar-gen3-usb2: add
binding for r8a77995", as it will match against the generic fallback on D3.

Thanks.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
