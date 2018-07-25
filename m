Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44614 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728360AbeGYQUa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jul 2018 12:20:30 -0400
Received: by mail-lj1-f193.google.com with SMTP id q127-v6so6982863ljq.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jul 2018 08:08:24 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: add RWDT support
To: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
References: <20180724114552.aybrijeonsj2tmcw@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <8f72716f-75b4-e8c0-3a77-9d709959e45d@cogentembedded.com>
Date: Wed, 25 Jul 2018 18:08:21 +0300
MIME-Version: 1.0
In-Reply-To: <20180724114552.aybrijeonsj2tmcw@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 07/24/2018 02:45 PM, Simon Horman wrote:

[...]
> On Tue, Jul 24, 2018 at 09:01:59AM +0200, Geert Uytterhoeven wrote:
>> On Fri, Jul 20, 2018 at 9:21 PM Sergei Shtylyov
>> <sergei.shtylyov@cogentembedded.com> wrote:
>>> Describe RWDT in the R8A77980 SoC device tree.
>>>
>>> Enable RWDT on the Condor and V3H Starter Kit boards.
>>>
>>> Based on the original (and large) patch by Vladimir Barinov.
>>>
>>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Thanks, applied for v4.20.

   Sorry, still not seeing any 'devel' branch updates... forgot to push?

MBR, Sergei
