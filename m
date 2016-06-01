Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:36341 "EHLO
	mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750716AbcFAM16 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 1 Jun 2016 08:27:58 -0400
MIME-Version: 1.0
In-Reply-To: <a60346f2-2abb-342b-dd20-38d401c4ceb3@cogentembedded.com>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
	<1669958.qjJ7i3NBPv@wasted.cogentembedded.com>
	<CAMuHMdU2P6VKXNpEHGOKpyuM45Pk0CuHWngxwu5AYGqYfduXXg@mail.gmail.com>
	<a60346f2-2abb-342b-dd20-38d401c4ceb3@cogentembedded.com>
Date: Wed, 1 Jun 2016 14:27:57 +0200
Message-ID: <CAMuHMdXUdg8+ux2j5SsthZS6DWZnHfan0jL=PpYEwfnS7fbRkQ@mail.gmail.com>
Subject: Re: [PATCH 13/13] ARM: dts: blanche: add Ethernet support
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Russell King <linux@arm.linux.org.uk>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Wed, Jun 1, 2016 at 2:16 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 6/1/2016 11:22 AM, Geert Uytterhoeven wrote:
>>> --- renesas.orig/arch/arm/boot/dts/r8a7792-blanche.dts
>>> +++ renesas/arch/arm/boot/dts/r8a7792-blanche.dts
>>
>>> +       ethernet@18000000 {
>>> +               compatible = "smsc,lan89218", "smsc,lan9115";
>>
>>
>> The "smsc,lan89218" needs to be documented in the device tree bindings.
>
>    Have you looked at those bindings?

Now I did.

>> Google couldn't find any evidence you submitted a patch for that.
>
>    Because the bindings document *any* LAN9115 compatible chip already.

Ah, generic wildcard, not listing valid values. Hence checkpatch complained...

Google predict-while-you-type suggests "lan89218aq"? Should you use that?
BTW, that's why we always want to document all valid values...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
