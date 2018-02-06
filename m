Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:44962 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752182AbeBFPTh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Feb 2018 10:19:37 -0500
Received: by mail-lf0-f68.google.com with SMTP id v188so3229517lfa.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Feb 2018 07:19:37 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 08/11] arm64: dts: renesas: r8a77980: add EtherAVB support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Simon Horman <horms@verge.net.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
References: <46fca582-220d-e5a7-62cd-2fc77a29846b@cogentembedded.com>
 <99e9e3a5-a626-282a-3e8b-9c74945d55bc@cogentembedded.com>
 <CAMuHMdU1Xfc3u90TLQc0g6COuRa+hf5fukr+XAkSxgjSBV6vhg@mail.gmail.com>
Message-ID: <bdc34fdf-26af-0e2d-2d7f-44ab52a7c245@cogentembedded.com>
Date: Tue, 6 Feb 2018 18:19:34 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU1Xfc3u90TLQc0g6COuRa+hf5fukr+XAkSxgjSBV6vhg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/06/2018 03:04 PM, Geert Uytterhoeven wrote:

>> Define the generic R8A77980 part of the EtherAVB device node.
>>
>> Based on the original (and large) patch by Vladimir Barinov.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Thanks for your patch!
> 
>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
>> @@ -164,6 +164,50 @@
>>                         status = "disabled";
>>                 };
>>
>> +               avb: ethernet@e6800000 {
>> +                       compatible = "renesas,etheravb-r8a77980",
>> +                                    "renesas,etheravb-rcar-gen3";
>> +                       reg = <0 0xe6800000 0 0x800>, <0 0xe6a00000 0 0x10000>;
> 
> According to the Hardware User Manual 0.80, V3H does not have the Stream
> Buffer (second region).

   Indeed, I forgot to check the manual. TY for noticing!

>> +                       phy-mode = "rgmii-id";
> 
> This is different from H3, M3-W, and D3. Care to elaborate for the layman
> in me?

   See Documentation/devicetree/bindings/net/ethernet.txt, I don't know anything beyond that anyway. :-)
   Based on the manual, I'd think we should use "rgmii" here and override it in the board DT if needed...

> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergei
