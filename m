Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170508165502.gkse5jdm56gzo5bm@rob-hp-laptop>
References: <1493919951-32122-1-git-send-email-geert+renesas@glider.be>
 <1493919951-32122-2-git-send-email-geert+renesas@glider.be> <20170508165502.gkse5jdm56gzo5bm@rob-hp-laptop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 May 2017 22:42:27 +0200
Message-ID: <CAMuHMdXAFxSBcGD5UMb__uacyBXyNtM-fLw7y966r67ohTLVhA@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] spi: Document DT bindings for SPI controllers in
 slave mode
To: Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Jiada Wang <jiada_wang@mentor.com>,
        Matt Porter <mporter@konsulko.com>,
        linux-spi <linux-spi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Rob,

On Mon, May 8, 2017 at 6:55 PM, Rob Herring <robh@kernel.org> wrote:
> On Thu, May 04, 2017 at 07:45:46PM +0200, Geert Uytterhoeven wrote:
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> v3:
>>   - In SPI slave mode, represent the (single) slave device again as a
>>     child of the controller node, which is now optional, and must be
>>     named "slave" if present,
>>   - Split slave node properties in master mode, slave mode, and common
>>     properties,
>>
>> v2:
>>   - Do not create a child node in SPI slave mode. Instead, add an
>>     "spi-slave" property, and put the mode properties in the controller
>>     node.

>> --- a/Documentation/devicetree/bindings/spi/spi-bus.txt
>> +++ b/Documentation/devicetree/bindings/spi/spi-bus.txt

>> +In slave mode, the SPI controller node requires one additional property:
>> +- spi-slave       - Empty property.
>
> Do we still need this if we have a child node called "slave".

Yes, as the child node called "slave" is optional.
In that case, configuration of the slave protocol is done through sysfs, but
that is Linux-specific and thus doesn't belong in the DT bindings.

> Otherwise,
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thank you!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
