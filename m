Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:45261 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752863AbeENP5I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 May 2018 11:57:08 -0400
Received: by mail-lf0-f66.google.com with SMTP id q2-v6so18753335lfc.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 May 2018 08:57:07 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Add GPIO device nodes
To: Simon Horman <horms@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
References: <20180513090855.25982-1-horms+renesas@verge.net.au>
 <e9646f33-9a82-f3ea-c4a6-cd2469b7658a@cogentembedded.com>
 <20180514143032.fxk4gcww6xihilrl@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <d232d79b-2d95-9938-bc1c-55b705c455c8@cogentembedded.com>
Date: Mon, 14 May 2018 18:57:04 +0300
MIME-Version: 1.0
In-Reply-To: <20180514143032.fxk4gcww6xihilrl@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05/14/2018 05:30 PM, Simon Horman wrote:

>>> The compat string renesas,gpio-rcar has been deprecated since v4.14,
>>> the same release that r8a77990 SoC support was added. Thus
>>> renesas,gpio-rcar can safely be removed without any risk of behaviour
>>> changes between old and new mainline kernels and DTBs.
>>
>>    This hardly matches the subject. :-)
> 
> Indeed, I will resubmit.

   I'm seeing this patch merged on Sunday...

>>> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>> [...]

MBR, Sergei
