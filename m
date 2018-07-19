Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f50.google.com ([209.85.167.50]:34147 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731636AbeGSSk3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jul 2018 14:40:29 -0400
Received: by mail-lf1-f50.google.com with SMTP id n96-v6so118296lfi.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jul 2018 10:56:14 -0700 (PDT)
Subject: Re: [PATCH/RFC 01/02] ravb: Do not announce 100Mbps HDX as supported
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <153200105784.13504.12882377600823578834.sendpatchset@little-apple>
 <153200106718.13504.7319401547888522726.sendpatchset@little-apple>
 <f7dad4b7-d1d6-3fcc-750d-deffc0e26717@cogentembedded.com>
 <CANqRtoQiyxrBwmNEZcDjMfR3ZPH-XfmXjJe0eCuvRE_zB0QKOw@mail.gmail.com>
 <CAMuHMdUh+EteHBVEG9ByHGiAdqQu8UbqNmkqYrncrEn3H7PG0g@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <19a353c1-34bb-ab61-8ace-c664f9764fd5@cogentembedded.com>
Date: Thu, 19 Jul 2018 20:56:11 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUh+EteHBVEG9ByHGiAdqQu8UbqNmkqYrncrEn3H7PG0g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/19/2018 08:42 PM, Geert Uytterhoeven wrote:

>>>> From: Magnus Damm <damm+renesas@opensource.se>
>>>>
>>>> According to the data sheet the Ethernet-AVB hardware in R-Car Gen3
>>>> and R-Car Gen2 SoCs do not support half duplex operation. So update
>>>> the driver to mark 100Mbit HDX as unsupported.
>>>
>>>    What about 1000Mbit HDX?
>>
>> For Twister Pair I believe 10 and 100 Mbps come in HDX and FDX flavors
>> while 1 Gbps is HDX-only.
> 
>  1 Gbps is _F_DX-only?

   No, only higher speeds are FDX only.

>> https://en.wikipedia.org/wiki/Ethernet_over_twisted_pair
> 
> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergei
