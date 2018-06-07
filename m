Return-Path: <linux-i2c-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <OSBPR01MB229354C6675F1185BD182C54D8640@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <20180529105847.15663-1-wsa+renesas@sang-engineering.com>
 <20180529105847.15663-2-wsa+renesas@sang-engineering.com> <TY2PR01MB2297BC5F12034143657590A7D86C0@TY2PR01MB2297.jpnprd01.prod.outlook.com>
 <CAMuHMdXaspHUg3LF1Jckg5CWHZWRL6gKOeCv-LHk4uzsji2W1Q@mail.gmail.com>
 <OSBPR01MB2293BBBFEBF58E8D90F3B516D8630@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSBPR01MB229354C6675F1185BD182C54D8640@OSBPR01MB2293.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Jun 2018 12:08:41 +0200
Message-ID: <CAMuHMdV-vLn-C6HcZBLwJWbXq2S3e-iQdmQXCEXm23+cEvk8gw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] i2c: rcar: handle RXDMA HW bug on Gen3
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-san,

On Thu, Jun 7, 2018 at 7:36 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>> From: Yoshihiro Shimoda, Sent: Thursday, May 31, 2018 6:12 PM
>> > From: Geert Uytterhoeven, Sent: Thursday, May 31, 2018 5:45 PM
>> > On Wed, May 30, 2018 at 10:35 AM, Yoshihiro Shimoda
>> > <yoshihiro.shimoda.uh@renesas.com> wrote:
>> > >> From: Wolfram Sang, Sent: Tuesday, May 29, 2018 7:59 PM
>> > >> Subject: [RFC PATCH 1/1] i2c: rcar: handle RXDMA HW bug on Gen3
>> > >
>> > > If possible, I'd like to replace "bug" with "specification" or other=
 words :)
>> > >
>> > > <snip>
>> > >> @@ -743,6 +753,16 @@ static int rcar_i2c_master_xfer(struct i2c_ada=
pter *adap,
>> > >>
>> > >>       pm_runtime_get_sync(dev);
>> > >>
>> > >> +     /* Gen3 has a HW bug which needs a reset before allowing RX D=
MA once */
>> > >> +     if (priv->devtype =3D=3D I2C_RCAR_GEN3) {
>> > >> +             priv->flags |=3D ID_P_NO_RXDMA;
>> > >> +             if (!IS_ERR(priv->rstc)) {
>> > >> +                     ret =3D reset_control_reset(priv->rstc);
>> > >
>> > > According to the datasheet Rev.1.00 page 57-69, we should do:
>> > >         reset_control_assert();
>> > >         udelay(1);
>> > >         reset_control_deassert();
>> > >         while (reset_control_status())
>> > >                 ;
>> > > instead of reset_control_reset(), I think.
>> >
>> > The i2c-specific procedure documented at page 57-69 thus differs from
>> > the generic one at page 8A-58, which is what cpg_mssr_reset() implemen=
ts.
>> >
>> > The latter waits 35=C2=B5s instead of 1=C2=B5s, so that should be safe=
.
>> > But it doesn't check the status bit. Is the longer delay sufficient, o=
r should
>> > a check polling the status bit be added to cpg_mssr_reset()?
>>
>> Thank you for the pointed out.
>> I agree we should wait 35us for safe.
>> But, anyway I'll ask HW team about this contradiction and really need po=
lling the status.
>
> I got information about this topic.
>
> < In CPG / MSSR point of view >
>  - This needs 35 usec wait while asserting.
>  - After deasserted a reset, no wait needs.
>   - In other words, there is each hardware IP dependence.

Let's call the above procedure A.

> < In I2C point of view >
>  - After deasserted the reset, this nees SRCR register polling.

Let's call the above procedure B.

> So, I don't think cpg_mssr_reset() checks the status bit after deasserted=
 a reset.
> But, what do you think?

cpg_mssr_reset() indeed does not check the status bit after deasserting
the reset, as it follows procedure A.

Such a check could be added, though. Then it'll become
(let's call this procedure C):

        /* Reset module */
        spin_lock_irqsave(&priv->rmw_lock, flags);
        value =3D readl(priv->base + SRCR(reg));
        value |=3D bitmask;
        writel(value, priv->base + SRCR(reg));
        spin_unlock_irqrestore(&priv->rmw_lock, flags);

        /* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
        udelay(35);

        /* Release module from reset state */
        writel(bitmask, priv->base + SRSTCLR(reg));

+       /* Wait until deassertion has completed */
+       while (readl(priv->base + SRCR(reg)) & bitmask)
+               cpu_relax();

Probably we need an upper limit on the number of loops, and call udelay(1)
after each iteration?

        for (i 0; i < 35; i++) {
                if (!(readl(priv->base + SRCR(reg)) & bitmask))
                        return 0;
                udelay(1);
        }
        return -EIO;

Any advice from the hardware team about that?

But according to procedure A, the check is not needed?
Probably because 35=C2=B5s is an upper limit satisfying all individual hard=
ware
modules?

I'm wondering whether we could use procedure B in the general case,
as it explicitly checks for completion?

Procedure C is safest, though, so probably the way to go.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
