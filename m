Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:33980 "EHLO
	mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161212AbcFMLZE (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 13 Jun 2016 07:25:04 -0400
Received: by mail-lf0-f48.google.com with SMTP id j7so58659146lfg.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jun 2016 04:25:02 -0700 (PDT)
Subject: Re: [PATCH 07/13] ARM: dts: r8a7792: initial SoC device tree
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
 <2539026.OyU5nvpxa6@wasted.cogentembedded.com>
 <20160601005751.GG20527@verge.net.au>
 <fdab2628-60bd-c41b-296b-38cd71a6c5da@cogentembedded.com>
 <CAMuHMdUkOpEp+YCbZVZppdN4C7KKpDS9_gEuXi_WKZXM9YHgEQ@mail.gmail.com>
 <ab5e3a98-7ff2-dc8f-d255-f6da26f43527@cogentembedded.com>
 <20160610010245.GA10152@verge.net.au>
 <8efb1c7e-5463-2556-744c-d327886d92d4@cogentembedded.com>
 <CAMuHMdUK=y2kZY1kA97QpCDyUZXFejpXTpO9ZVNQoBfDNoRgfg@mail.gmail.com>
 <1b9a4cf4-1101-ccbf-772b-49b8a689a1b6@cogentembedded.com>
 <CAMuHMdV6f5ZzPxySzCgi7L+Sr1_4Ph1sLLyQ_j-sJ0tmBOvrHg@mail.gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
	"open list:MEDIA DRIVERS FOR RENESAS - FCP"
	<linux-renesas-soc@vger.kernel.org>,
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
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <7d93d81d-cca9-e434-6488-0ea839f81663@cogentembedded.com>
Date: Mon, 13 Jun 2016 14:24:58 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV6f5ZzPxySzCgi7L+Sr1_4Ph1sLLyQ_j-sJ0tmBOvrHg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 6/13/2016 10:12 AM, Geert Uytterhoeven wrote:

>>>>    The only problem I'm seeing (again) is the RCAN clock failing to
>>>> register:
>>>>
>>>> rcar_gen2_cpg_clocks_init: failed to register cpg_clocks rcan clock (-12)
>>>>
>>>>    I was going to look at it yesterday but (wrongly) thought it somehow
>>>> cured itself... I'll look at it now.
>>>
>>> The RCAN parent is the second clock in the CPG node's "clocks" property,
>>> which you didn't provide.
>>
>>    Actually, the things are more complex. The figure 7.1c suggests that the
>> RCAN clock has different parent on R8A7792 than on the other SoCs -- namely
>> PLL1/VCO 1/4. That may be, since there's just no USB_EXTAL signal on this
>> SoC (it doesn't seem to support any USB IPs). Which means the
>> 'clk-rcar-gen2' driver can't work with the RCAN clock in its current form.
>
> Right, I had forgotten about that.
> Fortunately the clk-rcar-gen2 driver has a sane failure mode for this case ;-)

    What do you mean?

> it seems the RCAN clock can just be modeled as a fixed clock. However,
> its divider value isn't clear to me,

    IIRC, the fixed RCAN divisor was equal to 6.

[...]

> Gr{oetje,eeting}s,
>
>                         Geert

MBR, Sergei
