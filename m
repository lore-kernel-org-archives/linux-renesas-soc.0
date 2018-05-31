Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:35363 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754090AbeEaIpF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 May 2018 04:45:05 -0400
MIME-Version: 1.0
In-Reply-To: <TY2PR01MB2297BC5F12034143657590A7D86C0@TY2PR01MB2297.jpnprd01.prod.outlook.com>
References: <20180529105847.15663-1-wsa+renesas@sang-engineering.com>
 <20180529105847.15663-2-wsa+renesas@sang-engineering.com> <TY2PR01MB2297BC5F12034143657590A7D86C0@TY2PR01MB2297.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 31 May 2018 10:45:04 +0200
Message-ID: <CAMuHMdXaspHUg3LF1Jckg5CWHZWRL6gKOeCv-LHk4uzsji2W1Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] i2c: rcar: handle RXDMA HW bug on Gen3
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-san,

On Wed, May 30, 2018 at 10:35 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>> From: Wolfram Sang, Sent: Tuesday, May 29, 2018 7:59 PM
>> Subject: [RFC PATCH 1/1] i2c: rcar: handle RXDMA HW bug on Gen3
>
> If possible, I'd like to replace "bug" with "specification" or other word=
s :)
>
> <snip>
>> @@ -743,6 +753,16 @@ static int rcar_i2c_master_xfer(struct i2c_adapter =
*adap,
>>
>>       pm_runtime_get_sync(dev);
>>
>> +     /* Gen3 has a HW bug which needs a reset before allowing RX DMA on=
ce */
>> +     if (priv->devtype =3D=3D I2C_RCAR_GEN3) {
>> +             priv->flags |=3D ID_P_NO_RXDMA;
>> +             if (!IS_ERR(priv->rstc)) {
>> +                     ret =3D reset_control_reset(priv->rstc);
>
> According to the datasheet Rev.1.00 page 57-69, we should do:
>         reset_control_assert();
>         udelay(1);
>         reset_control_deassert();
>         while (reset_control_status())
>                 ;
> instead of reset_control_reset(), I think.

The i2c-specific procedure documented at page 57-69 thus differs from
the generic one at page 8A-58, which is what cpg_mssr_reset() implements.

The latter waits 35=C2=B5s instead of 1=C2=B5s, so that should be safe.
But it doesn't check the status bit. Is the longer delay sufficient, or sho=
uld
a check polling the status bit be added to cpg_mssr_reset()?

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
