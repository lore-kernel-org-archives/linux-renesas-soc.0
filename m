Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:34721 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932871AbcFJUuW (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 10 Jun 2016 16:50:22 -0400
Received: by mail-lf0-f49.google.com with SMTP id j7so29234742lfg.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jun 2016 13:50:21 -0700 (PDT)
Subject: Re: [PATCH 07/13] ARM: dts: r8a7792: initial SoC device tree
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
 <2539026.OyU5nvpxa6@wasted.cogentembedded.com>
 <20160601005751.GG20527@verge.net.au>
 <fdab2628-60bd-c41b-296b-38cd71a6c5da@cogentembedded.com>
 <CAMuHMdUkOpEp+YCbZVZppdN4C7KKpDS9_gEuXi_WKZXM9YHgEQ@mail.gmail.com>
 <ab5e3a98-7ff2-dc8f-d255-f6da26f43527@cogentembedded.com>
 <20160610010245.GA10152@verge.net.au>
 <8efb1c7e-5463-2556-744c-d327886d92d4@cogentembedded.com>
 <CAMuHMdUK=y2kZY1kA97QpCDyUZXFejpXTpO9ZVNQoBfDNoRgfg@mail.gmail.com>
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
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <1b9a4cf4-1101-ccbf-772b-49b8a689a1b6@cogentembedded.com>
Date: Fri, 10 Jun 2016 23:50:16 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUK=y2kZY1kA97QpCDyUZXFejpXTpO9ZVNQoBfDNoRgfg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/10/2016 11:42 PM, Geert Uytterhoeven wrote:

>>    The only problem I'm seeing (again) is the RCAN clock failing to
>> register:
>>
>> rcar_gen2_cpg_clocks_init: failed to register cpg_clocks rcan clock (-12)
>>
>>    I was going to look at it yesterday but (wrongly) thought it somehow
>> cured itself... I'll look at it now.
>
> The RCAN parent is the second clock in the CPG node's "clocks" property,
> which you didn't provide.

    Actually, the things are more complex. The figure 7.1c suggests that the 
RCAN clock has different parent on R8A7792 than on the other SoCs -- namely 
PLL1/VCO 1/4. That may be, since there's just no USB_EXTAL signal on this SoC 
(it doesn't seem to support any USB IPs). Which means the 'clk-rcar-gen2' 
driver can't work with the RCAN clock in its current form.

> Gr{oetje,eeting}s,
>
>                         Geert

MBR, Sergei
