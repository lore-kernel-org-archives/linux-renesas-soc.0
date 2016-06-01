Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:35853 "EHLO
	mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751651AbcFAMQe (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 1 Jun 2016 08:16:34 -0400
Received: by mail-lf0-f52.google.com with SMTP id b73so11441491lfb.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Jun 2016 05:16:33 -0700 (PDT)
Subject: Re: [PATCH 13/13] ARM: dts: blanche: add Ethernet support
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
 <1669958.qjJ7i3NBPv@wasted.cogentembedded.com>
 <CAMuHMdU2P6VKXNpEHGOKpyuM45Pk0CuHWngxwu5AYGqYfduXXg@mail.gmail.com>
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
Message-ID: <a60346f2-2abb-342b-dd20-38d401c4ceb3@cogentembedded.com>
Date: Wed, 1 Jun 2016 15:16:30 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU2P6VKXNpEHGOKpyuM45Pk0CuHWngxwu5AYGqYfduXXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 6/1/2016 11:22 AM, Geert Uytterhoeven wrote:

>> --- renesas.orig/arch/arm/boot/dts/r8a7792-blanche.dts
>> +++ renesas/arch/arm/boot/dts/r8a7792-blanche.dts
>
>> +       ethernet@18000000 {
>> +               compatible = "smsc,lan89218", "smsc,lan9115";
>
> The "smsc,lan89218" needs to be documented in the device tree bindings.

    Have you looked at those bindings?

> Google couldn't find any evidence you submitted a patch for that.

    Because the bindings document *any* LAN9115 compatible chip already.

> Gr{oetje,eeting}s,
>
>                         Geert

MBR, Sergei
