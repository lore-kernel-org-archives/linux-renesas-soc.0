Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36383 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbeJIBRp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Oct 2018 21:17:45 -0400
Received: by mail-lj1-f194.google.com with SMTP id p89-v6so18727730ljb.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Oct 2018 11:04:49 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: renesas: r8a77970: add thermal support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
 <51491585-16fb-93b1-bb1a-09e89683f2f0@cogentembedded.com>
 <CAMuHMdWsW-E_a17LJ-i4Wts531B-PyYqW9mqWQmt=jH6fUpOPg@mail.gmail.com>
 <1ef39615-fc82-dc2a-05eb-7b1aed7afa98@cogentembedded.com>
 <CAMuHMdUqBz_BB3+jDDxO0dXq1RSQQ6KK8CjR0WSQvWjMZBMnXQ@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b0304262-8d50-db25-149e-fce348ced51f@cogentembedded.com>
Date: Mon, 8 Oct 2018 21:04:46 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUqBz_BB3+jDDxO0dXq1RSQQ6KK8CjR0WSQvWjMZBMnXQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 10/08/2018 07:40 PM, Geert Uytterhoeven wrote:

>>>> Describe THS/CIVM in the R8A77970 device trees.
>>>> Based on the original (and large) patches by Vladimir Barinov.
>>>>
>>>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>>
>>>> ---
>>>> This patch is against the 'renesas-devel-20181004-v4.19-rc6' tag of Simon
>>>> Horman's 'renesas.git' repo.
>>>>
>>>> The thermal driver/bindings patches have been posted yesterday...
>>>>
>>>>  arch/arm64/boot/dts/renesas/r8a77970.dtsi |   32 ++++++++++++++++++++++++++++++
>>>>  1 file changed, 32 insertions(+)
>>>>
>>>> Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
>>>> ===================================================================
>>>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
>>>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
>>>> @@ -300,6 +300,19 @@
>>>>                         #power-domain-cells = <1>;
>>>>                 };
>>>>
>>>> +               thermal: thermal@e6190000 {
>>>> +                       compatible = "renesas,thermal-r8a77970";
>>>> +                       reg =  <0 0xe6190000 0 0x14
>>>
>>> 0x14 was appropriate for R-Mobile APE6...
>>
>>    Copy&paste is to blame here, I guess... I'll fix to 0x10.
> 
> OK.
> 
>>>> +                               0 0xe6190100 0 0x38>;
>>>
>>> What about the CIVM status register? DT describes hardware, not driver
>>> limitations.
>>
>>    I wasn't sure whether to put it into a separate "reg" tuple (which would confuse
>> the driver) or not. After looking into the manual again, I'm going to extend the
>> 2nd "reg" tuple...
> 
> The CIVM Status Register indicates the chip internal voltage.
> As such it's not a per-channel property, and IMHO doesn't belong in the second
> tuple

   I was looking a the block diagrams (both in the chapters 10A and 10B) and I got a totally different impression...

> (e.g. R-Mobile APE6 has 3 channels).

   The driver handles that alright. It's the adding the CIVM as a separate tuple
that would break it.

> Perhaps extending the bindings to handle more reg tuples, possibly using
> reg-names?

   You mean teaching the driver about one more kind of "reg" tuples? I would like
to avoid that of course -- due to the need to still handle the old DTs as well...

> Gr{oetje,eeting}s,
> 
>                         Geert
> 

MBR, Sergei
