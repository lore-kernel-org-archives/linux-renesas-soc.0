Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:53010 "EHLO
        mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755297AbeBOKDU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 05:03:20 -0500
Subject: Re: [PATCH] ARM: dts: stout: Initial r8a7790 Stout board support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20180213232948.31521-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdUuuokCjJ-uz1+JMFLF5zytiB6gjhVC1Xtys_rWdFnPhg@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <e28ab40d-85c1-8821-1482-09f59740b559@gmail.com>
Date: Thu, 15 Feb 2018 10:59:27 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUuuokCjJ-uz1+JMFLF5zytiB6gjhVC1Xtys_rWdFnPhg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/14/2018 10:11 AM, Geert Uytterhoeven wrote:
> Hi Marek,

[...]

>> +                       partition@0 {
>> +                               label = "loader";
>> +                               reg = <0x00000000 0x00040000>;
>> +                               read-only;
>> +                       };
>> +                       partition@40000 {
>> +                               label = "user";
>> +                               reg = <0x00040000 0x00400000>;
>> +                               read-only;
>> +                       };
>> +                       partition@440000 {
>> +                               label = "flash";
>> +                               reg = <0x00440000 0x03bc0000>;
>> +                       };
> 
> I can't verify the partition layout.

I adjusted it according to
https://elinux.org/R-Car/Boards/Stout

>> +               };
>> +       };
>> +};
> 
> 
>> +&iic2  {
>> +       status = "okay";
>> +       pinctrl-0 = <&iic2_pins>;
>> +       pinctrl-names = "default";
>> +
>> +       clock-frequency = <100000>;
>> +
>> +       hdmi@39 {
>> +               compatible = "adi,adv7511w";
>> +               reg = <0x39>;
>> +               interrupt-parent = <&gpio1>;
>> +               interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
> 
> Missing cec clock (OSC4).
Fixed

-- 
Best regards,
Marek Vasut
