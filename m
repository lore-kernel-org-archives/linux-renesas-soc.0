Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f179.google.com ([209.85.192.179]:47896 "EHLO
        mail-pf0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751593AbdKMMmi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2017 07:42:38 -0500
Received: by mail-pf0-f179.google.com with SMTP id t69so2756054pfg.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Nov 2017 04:42:38 -0800 (PST)
Message-ID: <1510576953.9806.1.camel@chimera>
Subject: Re: [PATCH] MIPS: implement a "bootargs-append" DT property
From: Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: James Hogan <james.hogan@mips.com>,
        Linux MIPS Mailing List <linux-mips@linux-mips.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Date: Mon, 13 Nov 2017 04:42:33 -0800
In-Reply-To: <CAMuHMdUtHhSLbrgmOW7gkEUg8pif+Ddc-zZgWzCZ4WL3JTeOKg@mail.gmail.com>
References: <1510420788-25184-1-git-send-email-daniel@gimpelevich.san-francisco.ca.us>
         <20171113112312.GZ15260@jhogan-linux>
         <CAMuHMdUtHhSLbrgmOW7gkEUg8pif+Ddc-zZgWzCZ4WL3JTeOKg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, 2017-11-13 at 13:31 +0100, Geert Uytterhoeven wrote:
> I've seen other use cases, e.g. the extension of the du node's
> "clocks" and
> "clock-names" properties from arch/arm64/boot/dts/renesas/r8a7795.dtsi
> to
> arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts.
> 
> To avoid the proliferation of "-append" versions of existing
> properties, what
> about handling this in dtc, by adding support for an
> "/append-property/"
> keyword?

That would not address use case #2 that I mentioned, where the dtb would
have a "bootargs-append" property but no "bootargs" property.
