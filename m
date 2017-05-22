Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAHp75VdphCGXYEMrF0eJ4WLe=wg_0o_xH833jJ1xjGynKV3jXA@mail.gmail.com>
References: <1495025272-23930-1-git-send-email-geert+renesas@glider.be>
 <1495025272-23930-6-git-send-email-geert+renesas@glider.be> <CAHp75VdphCGXYEMrF0eJ4WLe=wg_0o_xH833jJ1xjGynKV3jXA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 May 2017 12:13:29 +0200
Message-ID: <CAMuHMdV6nNNA8_GsjYNTni0-V+2rujSdbyJ89pf136rD7toqhQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] spi: slave: Add SPI slave handler reporting uptime
 at previous message
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Jiada Wang <jiada_wang@mentor.com>,
        Matt Porter <mporter@konsulko.com>,
        linux-spi <linux-spi@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Andy,

On Thu, May 18, 2017 at 6:01 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, May 17, 2017 at 3:47 PM, Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>> Add an example SPI slave handler responding with the uptime at the time
>> of reception of the last SPI message.
>>
>> This can be used by an external microcontroller as a dead man's switch.
>
>> +static int spi_slave_time_submit(struct spi_slave_time_priv *priv)
>> +{
>> +       u32 rem_ns;
>> +       int ret;
>> +       u64 ts;
>> +
>> +       ts = local_clock();
>> +       rem_ns = do_div(ts, 1000000000) / 1000;
>
> You divide ts by 10^9, which makes it seconds if it was nanoseconds.
>
> But reminder is still in nanoseconds and you divide it by 10^3.

> If I didn't miss anything it should be called like
>
> rem_ns -> reminder_ms

Thanks, that must be a remainder from before I reworked the calculation.

Will change it to rem_us (it's in microseconds, not milliseconds).

>> +       priv->buf[0] = cpu_to_be32(ts);
>> +       priv->buf[1] = cpu_to_be32(rem_ns);
>> +
>> +       spi_message_init_with_transfers(&priv->msg, &priv->xfer, 1);
>> +
>> +       priv->msg.complete = spi_slave_time_complete;
>> +       priv->msg.context = priv;
>> +
>> +       ret = spi_async(priv->spi, &priv->msg);
>> +       if (ret)
>> +               pr_err("%s: spi_async() failed %d\n", __func__, ret);
>
> Perhaps dev_err() ?

OK, and after that the __func__ is no longer needed.

>> +static int spi_slave_time_probe(struct spi_device *spi)
>> +{
>> +       struct spi_slave_time_priv *priv;
>> +       int ret;
>> +
>> +       /*
>> +        * bits_per_word cannot be configured in platform data
>> +        */
>> +       spi->bits_per_word = 8;
>
> Is it worth to define it? If so, can we use device properties for that?

No, it can be removed, as 8 is the default.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
