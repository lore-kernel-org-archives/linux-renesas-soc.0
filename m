Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33373 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1763660AbdDXPUT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Apr 2017 11:20:19 -0400
Received: by mail-wm0-f65.google.com with SMTP id y10so7021623wmh.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Apr 2017 08:20:18 -0700 (PDT)
Subject: Re: [PATCH V2] ARM: dts: r8a7791: Add GyroADC clock and device node
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20170420154413.357-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdV952Gfap_52exZJZQ-BHjC5ZsRXT8MCAfvY7duYG9MoQ@mail.gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <e9455998-fb9f-e818-c35e-569a638ea64c@gmail.com>
Date: Mon, 24 Apr 2017 17:12:34 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV952Gfap_52exZJZQ-BHjC5ZsRXT8MCAfvY7duYG9MoQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/20/2017 07:26 PM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi!

> On Thu, Apr 20, 2017 at 5:44 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> Add node for the GyroADC block and it's associated clock.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Simon Horman <horms+renesas@verge.net.au>
>> To: linux-renesas-soc@vger.kernel.org
>> ---
>> V2: - Drop the _clk suffix for ADC clock
> 
> You mean, drop the whole ADC clock? ;-)

Yes I do ...

>>     - Drop if "if" clk
>> ---
>>  arch/arm/boot/dts/r8a7791.dtsi | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
>> index 4d0c2ce59900..c5f3efc63861 100644
>> --- a/arch/arm/boot/dts/r8a7791.dtsi
>> +++ b/arch/arm/boot/dts/r8a7791.dtsi
>> @@ -776,6 +776,15 @@
>>                 status = "disabled";
>>         };
>>
>> +       adc: adc@e6e54000 {
>> +               compatible = "renesas,r8a7791-gyroadc", "renesas,rcar-gyroadc";
>> +               reg = <0 0xe6e54000 0 64>;
>> +               clocks = <&mstp9_clks R8A7791_CLK_GYROADC>;
>> +               clock-names = "fck";
>> +               power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
>> +               status = "disabled";
>> +       };
>> +
>>         scif2: serial@e6e58000 {
>>                 compatible = "renesas,scif-r8a7791", "renesas,rcar-gen2-scif",
>>                              "renesas,scif";
>> @@ -1432,6 +1441,7 @@
>>                                  <&hp_clk>, <&hp_clk>;
> 
> Missing addition of the parent clock for the newly added module clock,
> which is presumably <&p_clk> (sorry, wrote cp_clk before).

Fixed, syncing three fields is kinda weird :)

> What freaky frequency does your GyroADC use? :-)

65MHz, but that's block clock :)

>>                         #clock-cells = <1>;
>>                         clock-indices = <
>> +                               R8A7791_CLK_GYROADC
>>                                 R8A7791_CLK_GPIO7 R8A7791_CLK_GPIO6 R8A7791_CLK_GPIO5 R8A7791_CLK_GPIO4
>>                                 R8A7791_CLK_GPIO3 R8A7791_CLK_GPIO2 R8A7791_CLK_GPIO1 R8A7791_CLK_GPIO0
>>                                 R8A7791_CLK_RCAN1 R8A7791_CLK_RCAN0 R8A7791_CLK_QSPI_MOD R8A7791_CLK_I2C5
>> @@ -1439,6 +1449,7 @@
>>                                 R8A7791_CLK_I2C1 R8A7791_CLK_I2C0
>>                         >;
>>                         clock-output-names =
>> +                               "gyroadc",
>>                                 "gpio7", "gpio6", "gpio5", "gpio4", "gpio3", "gpio2", "gpio1", "gpio0",
>>                                 "rcan1", "rcan0", "qspi_mod", "i2c5", "i2c6", "i2c4", "i2c3", "i2c2",
>>                                 "i2c1", "i2c0";
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 


-- 
Best regards,
Marek Vasut
