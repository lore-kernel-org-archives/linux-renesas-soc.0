Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:36177 "EHLO
	mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750775AbcFWHql (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 23 Jun 2016 03:46:41 -0400
MIME-Version: 1.0
In-Reply-To: <20160622223330.GA15843@verge.net.au>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
 <2280165.siMXMbFrFe@wasted.cogentembedded.com> <20160601005246.GF20527@verge.net.au>
 <b9619ed2-1ebf-0991-ca90-f9dbe6d1d4f6@cogentembedded.com> <20160622223330.GA15843@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jun 2016 09:46:39 +0200
Message-ID: <CAMuHMdW2X7AjnQBRSdO9i9_7p8WoMpXMZmL23g5890doNsQRtg@mail.gmail.com>
Subject: Re: [PATCH 01/13] ARM: shmobile: r8a7792: add clock index macros
To: Simon Horman <horms@verge.net.au>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-renesas-soc@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jun 23, 2016 at 12:33 AM, Simon Horman <horms@verge.net.au> wrote:
> On Wed, Jun 22, 2016 at 10:52:04PM +0300, Sergei Shtylyov wrote:
>>    I've just downloaded and opened rev2.00 manual, and still, there's no
>> CPG registers other than FRQCRB on V2H.
>>
>> >It does, however, provide RCAN and ADSP which are supported by the CPG
>> >driver. You may wish to add them now for completeness though from my point
>> >of view they could also be added later when they are used.
>>
>>    My copy of the manual says there's no ADSP on V2H, and thus no ADSP clock.
>
> I was looking at Figure 7.1c. Perhaps it is inaccurate.

Probably, the ADSP is missing for V2H in all other sections of the datasheet:
  - There's no ADSP clock in Table 7.2c,
  - ADSPCKCR does not exist according to Table 7.10,
  - There are no ADSP MSSR bits, interrupts, or micro-TLBs,
  - The audio and ADSP modules do not exist.

Of course that's the datasheet, there may still be actual hardware listening
when you try to talk to it ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
