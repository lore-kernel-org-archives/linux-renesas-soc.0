Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:34630 "EHLO
	mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751874AbcFFW0J (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 6 Jun 2016 18:26:09 -0400
Received: by mail-lf0-f46.google.com with SMTP id s186so38745619lfs.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jun 2016 15:26:08 -0700 (PDT)
Subject: Re: [PATCH 07/13] ARM: dts: r8a7792: initial SoC device tree
To: Simon Horman <horms@verge.net.au>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
 <2539026.OyU5nvpxa6@wasted.cogentembedded.com>
 <20160601005751.GG20527@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
	pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	devicetree@vger.kernel.org, magnus.damm@gmail.com,
	linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <fdab2628-60bd-c41b-296b-38cd71a6c5da@cogentembedded.com>
Date: Tue, 7 Jun 2016 01:26:04 +0300
MIME-Version: 1.0
In-Reply-To: <20160601005751.GG20527@verge.net.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 06/01/2016 03:57 AM, Simon Horman wrote:

>> The initial R8A7792 SoC device tree including 2 CPU cores, GIC, timer, SYSC,
>> and the required  clock descriptions.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> This is rather large for an initial DTSI. Did you give any consideration
> to splitting it up: e.g. only providing what is needed to get to a serial
> console?

    Was done in the v2 patchset...

> With regards to SMP. Have you checked to make sure CPU hotplug works
> on all CPUs?

    How to test the CPU hotplug? I've now added the SMP support and made sure 
both CPUs are online and serve IRQs...

> And that the system behaves sanely on suspend/resume.

    I'd be thankful if you told me how to test that. :-)

> If it is not possible to verify this at this stage then I would recommend
> only enabling one CPU at this stage.

    Had a hard time debugging SMP until I realized I'd removed CPU1 from the 
device tree. :-)

MBR, Sergei
