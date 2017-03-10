Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:35426 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937001AbdCJM2b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2017 07:28:31 -0500
Received: by mail-lf0-f43.google.com with SMTP id j90so40318794lfk.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2017 04:28:30 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: r8a7796: add IMR-LX4 support
To: Simon Horman <horms@verge.net.au>
References: <20170220213129.182097269@cogentembedded.com>
 <20170310093049.GH21820@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <9d1d3e6d-ebe8-06a9-4d49-d62ee2f038bd@cogentembedded.com>
Date: Fri, 10 Mar 2017 15:28:22 +0300
MIME-Version: 1.0
In-Reply-To: <20170310093049.GH21820@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 03/10/2017 12:30 PM, Simon Horman wrote:

>> Describe the IMR-LX4 devices in the R8A7796 device tree.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> Thanks, queued up for v4.12.

    This is probably premature, given some uncertainty with the "compatible" 
prop (I mean the SoC specific values).

MBR, Sergei
