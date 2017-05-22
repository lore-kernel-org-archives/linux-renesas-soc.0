Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV6nNNA8_GsjYNTni0-V+2rujSdbyJ89pf136rD7toqhQ@mail.gmail.com>
References: <1495025272-23930-1-git-send-email-geert+renesas@glider.be>
 <1495025272-23930-6-git-send-email-geert+renesas@glider.be>
 <CAHp75VdphCGXYEMrF0eJ4WLe=wg_0o_xH833jJ1xjGynKV3jXA@mail.gmail.com> <CAMuHMdV6nNNA8_GsjYNTni0-V+2rujSdbyJ89pf136rD7toqhQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 22 May 2017 13:16:23 +0300
Message-ID: <CAHp75Ves5G3RfGDgmfArvE+0Uft_HDNWowcnAQKCT8uHV76EYA@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] spi: slave: Add SPI slave handler reporting uptime
 at previous message
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

On Mon, May 22, 2017 at 1:13 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, May 18, 2017 at 6:01 PM, Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Wed, May 17, 2017 at 3:47 PM, Geert Uytterhoeven
>> <geert+renesas@glider.be> wrote:

>>> +       rem_ns = do_div(ts, 1000000000) / 1000;
>>
>> You divide ts by 10^9, which makes it seconds if it was nanoseconds.
>> But reminder is still in nanoseconds and you divide it by 10^3.
>
>> If I didn't miss anything it should be called like
>> rem_ns -> reminder_ms
>
> Thanks, that must be a remainder from before I reworked the calculation.
> Will change it to rem_us (it's in microseconds, not milliseconds).

Yeah, correct, thanks.

-- 
With Best Regards,
Andy Shevchenko
