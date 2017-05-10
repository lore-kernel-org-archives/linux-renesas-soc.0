Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:35800 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750733AbdEJMNC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2017 08:13:02 -0400
Received: by mail-io0-f194.google.com with SMTP id o12so1870866iod.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 May 2017 05:13:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3272565.o4gaMbvL4P@avalon>
References: <20170510070458.21193-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170510070458.21193-4-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdU1UPjwEQh4LoNUqUEv58ML=BWOA_VMKLGn2YE7L-22Lg@mail.gmail.com> <3272565.o4gaMbvL4P@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 May 2017 14:13:00 +0200
Message-ID: <CAMuHMdX5gG+fD5NfyfQsrLDyOQA+6pCx7MPK592qn=KQvXZ_Mg@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] arm64: dts: renesas: salvator-x: Enable HDMI outputs
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Ulrich Hecht <ulrich.hecht@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 10, 2017 at 1:52 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wednesday 10 May 2017 10:28:11 Geert Uytterhoeven wrote:
>> On Wed, May 10, 2017 at 9:04 AM, Laurent Pinchart wrote:
>> > From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>> >
>> > Instantiate the HDMI connectors and enable the encoders.
>> >
>> > Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>> > Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
>> > Signed-off-by: Laurent Pinchart
>> > <laurent.pinchart+renesas@ideasonboard.com>
>> > ---
>> >
>> >  arch/arm64/boot/dts/renesas/salvator-x.dtsi | 50 ++++++++++++++++++++++++
>> >  1 file changed, 50 insertions(+)
>> >
>> > diff --git a/arch/arm64/boot/dts/renesas/salvator-x.dtsi
>> > b/arch/arm64/boot/dts/renesas/salvator-x.dtsi index
>> > d5eb022d247c..2cd0cce818e7 100644
>> > --- a/arch/arm64/boot/dts/renesas/salvator-x.dtsi
>> > +++ b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
>> > @@ -151,6 +151,30 @@
>> >                           1800000 0>;
>> >         };
>> >
>> > +       hdmi0-out {
>>
>> Can you please respect sort order when inserting new nodes?
>> Thanks!
>
> Doesn't it make more sense to keep all display outputs grouped together
> instead of scattering them over the file ?

Simon, what do you think?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
