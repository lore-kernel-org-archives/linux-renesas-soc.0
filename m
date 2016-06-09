Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:36311 "EHLO
	mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752232AbcFILXB (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 9 Jun 2016 07:23:01 -0400
Received: by mail-lf0-f47.google.com with SMTP id j5so24051557lfb.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jun 2016 04:23:00 -0700 (PDT)
Subject: Re: [PATCH v3 05/12] ARM: shmobile: r8a7792: add SMP support
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <12536856.AsKMEpuejQ@wasted.cogentembedded.com>
 <7848375.HIECFST0Ua@wasted.cogentembedded.com>
 <CAMuHMdXe==X8x5Q2Hnm7kPp9THwvqVq95imwGoAQyDQv=8=P3g@mail.gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Russell King <linux@arm.linux.org.uk>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <97912a61-cff1-24e1-b275-16431e20bff3@cogentembedded.com>
Date: Thu, 9 Jun 2016 14:22:57 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXe==X8x5Q2Hnm7kPp9THwvqVq95imwGoAQyDQv=8=P3g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 6/9/2016 11:44 AM, Geert Uytterhoeven wrote:

>> Add R8A7792 SMP support using the shared APMU code. This SoC has 2 ARM
>> Cortex-A15  CPU cores.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
[...]
>>  # PM objects
>> Index: renesas/arch/arm/mach-shmobile/r8a7792.h
>> ===================================================================
>> --- /dev/null
>> +++ renesas/arch/arm/mach-shmobile/r8a7792.h
>> @@ -0,0 +1,6 @@
>> +#ifndef __ASM_R8A7792_H__
>> +#define __ASM_R8A7792_H__
>> +
>> +extern const struct smp_operations r8a7792_smp_ops;
>
> For new SMP support, you should no longer add an SoC-specific struct
> smp_operations, but rely on the DT "enable-method" property, cfr.
> "[PATCH v3 00/09] ARM: shmobile: APMU DT support via SMP Enable method V3"
> (http://www.spinics.net/lists/linux-sh/msg45229.html).
>
> That series will no longer apply, but I've been carrying (and rebasing) it in
> my local tree for quite a while, as it was related to SYSC cleanup (avoiding
> your r8a7792_ca15_scu). But unfortunately that depends on the SYSC node always
> be present in DT.

    My patch is not against you repo, it's against Simon's repo. If you indeed 
care for these Magnus' patches (abandoned again?), please re-post them and get 
them merged.

> Gr{oetje,eeting}s,
>
>                         Geert

MBR, Sergei
