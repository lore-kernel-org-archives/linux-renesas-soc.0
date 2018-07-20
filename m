Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f53.google.com ([209.85.221.53]:35400 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730811AbeGTD5M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jul 2018 23:57:12 -0400
Received: by mail-wr1-f53.google.com with SMTP id a3-v6so9883822wrt.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jul 2018 20:11:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUh+EteHBVEG9ByHGiAdqQu8UbqNmkqYrncrEn3H7PG0g@mail.gmail.com>
References: <153200105784.13504.12882377600823578834.sendpatchset@little-apple>
 <153200106718.13504.7319401547888522726.sendpatchset@little-apple>
 <f7dad4b7-d1d6-3fcc-750d-deffc0e26717@cogentembedded.com> <CANqRtoQiyxrBwmNEZcDjMfR3ZPH-XfmXjJe0eCuvRE_zB0QKOw@mail.gmail.com>
 <CAMuHMdUh+EteHBVEG9ByHGiAdqQu8UbqNmkqYrncrEn3H7PG0g@mail.gmail.com>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Fri, 20 Jul 2018 12:11:06 +0900
Message-ID: <CANqRtoQWRxG7s8=6zo8TALG73Gm_ufNctvKP4VMMZ8VAB8jtRQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 01/02] ravb: Do not announce 100Mbps HDX as supported
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Fri, Jul 20, 2018 at 2:42 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Magnus,
>
> On Thu, Jul 19, 2018 at 7:25 PM Magnus Damm <magnus.damm@gmail.com> wrote:
>> On Thu, Jul 19, 2018 at 11:32 PM, Sergei Shtylyov
>> <sergei.shtylyov@cogentembedded.com> wrote:
>> > On 07/19/2018 02:51 PM, Magnus Damm wrote:
>> >> From: Magnus Damm <damm+renesas@opensource.se>
>> >>
>> >> According to the data sheet the Ethernet-AVB hardware in R-Car Gen3
>> >> and R-Car Gen2 SoCs do not support half duplex operation. So update
>> >> the driver to mark 100Mbit HDX as unsupported.
>> >
>> >    What about 1000Mbit HDX?
>>
>> For Twister Pair I believe 10 and 100 Mbps come in HDX and FDX flavors
>> while 1 Gbps is HDX-only.
>
>  1 Gbps is _F_DX-only?

Correct, typo from my side! It should be 1 Gbps FDX-only.

Cheers,

/ magnus
