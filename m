Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:35505 "EHLO
        mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753578AbcI1UJr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Sep 2016 16:09:47 -0400
Received: by mail-lf0-f41.google.com with SMTP id l131so63729740lfl.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Sep 2016 13:09:46 -0700 (PDT)
Subject: Re: [PATCH RFC 6/8] ARM: dts: r8a7743: add SYS-DMAC support
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <3533019.Wim1Kuh1ic@wasted.cogentembedded.com>
 <1815255.1arMxK7TDL@wasted.cogentembedded.com>
 <CAMuHMdXz5K66AU7d-+NsPrAyc8V53mDxzggiUk-TrFRAwBFXOg@mail.gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@arm.linux.org.uk>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <be7575a5-e9a0-05a6-5b2d-803632c7edac@cogentembedded.com>
Date: Wed, 28 Sep 2016 23:09:40 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXz5K66AU7d-+NsPrAyc8V53mDxzggiUk-TrFRAwBFXOg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 09/19/2016 11:19 AM, Geert Uytterhoeven wrote:

>> --- renesas.orig/arch/arm/boot/dts/r8a7743.dtsi
>> +++ renesas/arch/arm/boot/dts/r8a7743.dtsi
>> @@ -90,6 +90,70 @@
>>                         #power-domain-cells = <1>;
>>                 };
>>
>> +               dmac0: dma-controller@e6700000 {
>> +                       compatible = "renesas,dmac-r8a7743",
>
> To be documented.

    The R-Car DMAC binding has "renesas,dmac-<soctype>" documented.
I can add the mention of RZ/G and new examples though...

> Gr{oetje,eeting}s,
>
>                         Geert

MBR, Sergei
