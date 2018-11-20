Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40487 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbeKUKFG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Nov 2018 05:05:06 -0500
Subject: Re: [PATCH V3] arm64: dts: r8a77990: ebisu: Add and enable SDHI
 device nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
References: <20181106204647.18051-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdWQYt4nrjBeQnWcZ+OOT+UX=9KTu3Lki7aS=n3n8FczZg@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <94869436-7841-537a-4760-8f117b06200f@gmail.com>
Date: Wed, 21 Nov 2018 00:18:51 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWQYt4nrjBeQnWcZ+OOT+UX=9KTu3Lki7aS=n3n8FczZg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11/20/2018 11:16 AM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> On Tue, Nov 6, 2018 at 9:46 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>
>> This patch adds SDHI{0,1,3} device nodes for the r8a77990 SoC
>> and enables SD card slot connected to SDHI0, micro SD card slot
>> connected to SDHI1 and eMMC connected to SDHI3 on the Ebisu board
>> using the R8A77990 SoC.
>>
>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
>> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
>> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
>> @@ -129,6 +129,15 @@
>>                 };
>>         };
>>
>> +       reg_1p8v: regulator0 {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "fixed-1.8V";
>> +               regulator-min-microvolt = <1800000>;
>> +               regulator-max-microvolt = <1800000>;
>> +               regulator-boot-on;
>> +               regulator-always-on;
>> +       };
>> +
>>         reg_3p3v: regulator1 {
>>                 compatible = "regulator-fixed";
>>                 regulator-name = "fixed-3.3V";
>> @@ -180,6 +189,54 @@
>>                 #clock-cells = <0>;
>>                 clock-frequency = <74250000>;
>>         };
>> +
>> +       vcc_sdhi0: regulator-vcc-sdhi0 {
>> +               compatible = "regulator-fixed";
>> +
>> +               regulator-name = "SDHI0 Vcc";
>> +               regulator-min-microvolt = <3300000>;
>> +               regulator-max-microvolt = <3300000>;
>> +
>> +               gpio = <&gpio5 17 GPIO_ACTIVE_HIGH>;
>> +               enable-active-high;
>> +       };
>> +
>> +       vccq_sdhi0: regulator-vccq-sdhi0 {
>> +               compatible = "regulator-gpio";
>> +
>> +               regulator-name = "SDHI0 VccQ";
>> +               regulator-min-microvolt = <1800000>;
>> +               regulator-max-microvolt = <3300000>;
>> +
>> +               gpios = <&gpio5 18 GPIO_ACTIVE_HIGH>;
>> +               gpios-states = <1>;
>> +               states = <3300000 1
>> +                         1800000 0>;
> 
> I know this is how it's done in the example in
> Documentation/devicetree/bindings/regulator/gpio-regulator.txt,
> but usually brackets are used to group tuples, like:
> 
>     states = <3300000 1>, <1800000 0>;
> 
> Perhaps the example should be changed?

Well, looking through the DTS, I don't see anyone using tuples for the
GPIO regulator states. Then again, it could be updated.

+CC Mark and Liam, let's see what their opinion on changing that is.

-- 
Best regards,
Marek Vasut
