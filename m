Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:34630 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752259AbcIAKLf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 06:11:35 -0400
Received: by mail-lf0-f43.google.com with SMTP id p41so38215458lfi.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Sep 2016 03:11:34 -0700 (PDT)
Subject: Re: [PATCH v3 04/12] arm64: dts: h3ulcb: enable EthernetAVB
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
References: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1472637779-14741-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdVwO+uyR9P7NBGFCyMPHzwFX2umZL=UT2-B7qme8nenPg@mail.gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <ccc345ae-74d5-2f20-9e6e-af4f49622454@cogentembedded.com>
Date: Thu, 1 Sep 2016 13:11:30 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVwO+uyR9P7NBGFCyMPHzwFX2umZL=UT2-B7qme8nenPg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 9/1/2016 10:48 AM, Geert Uytterhoeven wrote:

>> This supports Ethernet AVB on H3ULCB board
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
>> --- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
>> +++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
>
>> @@ -62,3 +68,29 @@
>>         clock-frequency = <14745600>;
>>         status = "okay";
>>  };
>> +
>> +&avb {
>> +       pinctrl-0 = <&avb_pins>;
>> +       pinctrl-names = "default";
>> +       renesas,no-ether-link;
>> +       phy-handle = <&phy0>;
>> +       status = "okay";
>> +
>> +       phy0: ethernet-phy@0 {
>> +               rxc-skew-ps = <900>;
>> +               rxdv-skew-ps = <0>;
>> +               rxd0-skew-ps = <0>;
>> +               rxd1-skew-ps = <0>;
>> +               rxd2-skew-ps = <0>;
>> +               rxd3-skew-ps = <0>;
>> +               txc-skew-ps = <900>;
>> +               txen-skew-ps = <0>;
>> +               txd0-skew-ps = <0>;
>> +               txd1-skew-ps = <0>;
>> +               txd2-skew-ps = <0>;
>> +               txd3-skew-ps = <0>;
>> +               reg = <0>;
>> +               interrupt-parent = <&gpio2>;
>> +               interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
>
> Just wondering (it's done the same way on Salvator-X) why this is using a
> GPIO interrupt, and not the dedicated AVB_PHY_INT?

    AVB_PHY_INT isn't supported by the driver yet (due to the phylib's 
misfeature which has been fixed now). I simply lack the time to work on this 
support.

MBR, Sergei
