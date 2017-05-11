Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:36196 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757039AbdEKPma (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 May 2017 11:42:30 -0400
Received: by mail-io0-f195.google.com with SMTP id f102so3374704ioi.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 May 2017 08:42:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170511145329.GD21895@verge.net.au>
References: <1494503934-23367-1-git-send-email-geert+renesas@glider.be>
 <1494503934-23367-2-git-send-email-geert+renesas@glider.be> <20170511145329.GD21895@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 May 2017 17:42:27 +0200
Message-ID: <CAMuHMdU0NUFtqDOKnRHQuSXurP6NKy7bNVhBQB-_MOoSrnNpYQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] arm64: dts: r8a7795: Add support for R-Car H3 ES2.0
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Thu, May 11, 2017 at 4:53 PM, Simon Horman <horms@verge.net.au> wrote:
> On Thu, May 11, 2017 at 01:58:52PM +0200, Geert Uytterhoeven wrote:
>> Update r8a7795.dtsi so it corresponds to R-Car H3 ES2.0 or later:
>>   - The following devices no longer exist on ES2.0, and are thus removed:
>>     fcpf2, fcpvd3, fcpvi2, fdp1-2, usb3-if1, vspd3, vspi2.
>>   - The DU <-> VSPD topology is different on ES2.0, hence remove the
>>     "compatible" and "vsps" properties from the DU node until the driver
>>     can handle this.
>>
>> Move support for the ES1.x revision of the R-Car H3 SoC into a
>> separate file.  To avoid duplication, r8a7795-es1.dtsi includes
>> r8a7795.dtsi, add adds/removes/overrides device nodes and properties
>> where needed.
>
> I think the above should be re-worded given your explanation below the
> scissors that no deletion or overriding occurs.

I wanted to document clearly what needs to be done in the generic case...
I agree no removal or override is done right now.

If you prefer it that way, I can reword it.

>> Switch r8a7795-salvator-x.dts and r8a7795-h3ulcb.dts from r8a7795.dtsi
>> to r8a7795-es1.dtsi to preserve compatibility.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> While currently r8a7795-es1.dtsi only adds device nodes, removal of
>> devices nodes and properties can be implemented using the /delete-node/
>> and /delete-property/ keywords, as shown below:
>>
>>       &soc {
>>               /delete-node/ <name>@<addr>;
>>       };
>>
>>       &<label> {
>>               /delete-property/ <prop>;
>>       };
>
> I would be interested to also see an example of an override and
> for the examples to be included in the changelog itself.

You mean above the scissors? ;-)

Currently we don't have any devices or properties in DT that need removals
or overrides. Note that I did test those.

If we add the "vsps" property to the DU node for ES2.0, we can have an
override for it now.  But we've plenty of experience with letting .dts
override properties in .dtsi.

For node deletion, we'll have to wait until someone enables the extra USB
channels on ES2.0.

For property deletion, I don't have an actual example in mind, but I wanted
to be sure that worked in case we ever need it.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
