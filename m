Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:34857 "EHLO
	mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751836AbcELVQW (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 12 May 2016 17:16:22 -0400
Received: by mail-lf0-f53.google.com with SMTP id j8so78417899lfd.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 May 2016 14:16:21 -0700 (PDT)
Subject: Re: [PATCH v3 0/6] Add R8A7794/SILK sound DT support
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	devicetree@vger.kernel.org
References: <2378837.cigT3tNQPe@wasted.cogentembedded.com>
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <7d19e749-8264-9004-64f4-aefabda699c6@cogentembedded.com>
Date: Fri, 13 May 2016 00:16:17 +0300
MIME-Version: 1.0
In-Reply-To: <2378837.cigT3tNQPe@wasted.cogentembedded.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 05/12/2016 11:38 PM, Sergei Shtylyov wrote:

>    Here's the set of 6 patches against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-20160509-v4.6-rc7' tag. I'm adding the sound device tree support
> for the R8A7794 SoC based SILK board.
>
> [1/6] ARM: dts: r8a7794: add audio clocks
> [2/6] ARM: dts: r8a7794: add MSTP5 clocks
> [3/6] ARM: dts: r8a7794: add MSTP10 clocks
> [4/6] ARM: dts: r8a7794: add Audio-DMAC support
> [5/6] ARM: dts: r8a7794: add sound support
> [6/6] ARM: dts: silk: add sound support

    Oops, forgot to mention that patch #5 depends on the R-Car sound patch 
posted yesterday in order to get interpreted as intended (it uses a disabled 
SRC node).

WBR, Sergei
