Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:35992 "EHLO
	mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751255AbcFVKPx (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 22 Jun 2016 06:15:53 -0400
Received: by mail-lf0-f53.google.com with SMTP id q132so70121178lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Jun 2016 03:15:52 -0700 (PDT)
Subject: Re: [PATCH] ARM: dts: r8a7794: add SMP support
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <14666252.G84Ipxe6EL@wasted.cogentembedded.com>
 <27171008.uuY7altQup@wasted.cogentembedded.com>
 <CAMuHMdWcVRBxZO85_MhYVvODcbi-GYDNKfQH9LJEcrJRd=p7Vw@mail.gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Russell King <linux@arm.linux.org.uk>,
	Magnus Damm <magnus.damm@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <adbc6358-d3fb-c608-15c2-c425332435f3@cogentembedded.com>
Date: Wed, 22 Jun 2016 13:08:32 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWcVRBxZO85_MhYVvODcbi-GYDNKfQH9LJEcrJRd=p7Vw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 6/22/2016 10:20 AM, Geert Uytterhoeven wrote:

>> Add the device tree node for the Advanced Power Management Unit (APMU).
>> Use the "enable-method" prop to  point out that the APMU should be used
>> for the SMP support.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
>> SMP/PM basically works but you can't offline CPU0 (system hangs)...
>
> On #renesas-soc you said it hangs on SILK only, and succeeds on Porter,
> with a WARNING in the clk core (which one?) during suspend?

    Porter is based on R8A7791 (WARNING seemed to be caused by the CAN 
driver). :-)

> Thanks!
>
> Gr{oetje,eeting}s,
>
>                         Geert

MBR, Sergei
