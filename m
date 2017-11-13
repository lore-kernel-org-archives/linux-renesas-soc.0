Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:45877 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751153AbdKMNS4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2017 08:18:56 -0500
MIME-Version: 1.0
In-Reply-To: <1510576953.9806.1.camel@chimera>
References: <1510420788-25184-1-git-send-email-daniel@gimpelevich.san-francisco.ca.us>
 <20171113112312.GZ15260@jhogan-linux> <CAMuHMdUtHhSLbrgmOW7gkEUg8pif+Ddc-zZgWzCZ4WL3JTeOKg@mail.gmail.com>
 <1510576953.9806.1.camel@chimera>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Nov 2017 14:18:55 +0100
Message-ID: <CAMuHMdUN-3ycB8qgZw62V_18ZjjMnuCe1HdKqf0MT5cE3qy5nQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: implement a "bootargs-append" DT property
To: Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>
Cc: James Hogan <james.hogan@mips.com>,
        Linux MIPS Mailing List <linux-mips@linux-mips.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Daniel,

On Mon, Nov 13, 2017 at 1:42 PM, Daniel Gimpelevich
<daniel@gimpelevich.san-francisco.ca.us> wrote:
> On Mon, 2017-11-13 at 13:31 +0100, Geert Uytterhoeven wrote:
>> I've seen other use cases, e.g. the extension of the du node's
>> "clocks" and
>> "clock-names" properties from arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> to
>> arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts.
>>
>> To avoid the proliferation of "-append" versions of existing
>> properties, what
>> about handling this in dtc, by adding support for an
>> "/append-property/"
>> keyword?
>
> That would not address use case #2 that I mentioned, where the dtb would
> have a "bootargs-append" property but no "bootargs" property.

For use case #2, you were talking about kernel configuration?
Isn't that something completely different?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
