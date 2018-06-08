Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:36489 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752774AbeFHQlF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jun 2018 12:41:05 -0400
Received: by mail-lf0-f66.google.com with SMTP id u4-v6so21023623lff.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Jun 2018 09:41:04 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: renesas: Fix VSPD registers range
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>
References: <20180608122115.21138-1-laurent.pinchart+renesas@ideasonboard.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <2a6247d0-6224-f2b0-b6ac-7116c8bc0cae@cogentembedded.com>
Date: Fri, 8 Jun 2018 19:41:01 +0300
MIME-Version: 1.0
In-Reply-To: <20180608122115.21138-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 06/08/2018 03:21 PM, Laurent Pinchart wrote:

> The VSPD and FCPVD nodes have overlapping register ranges, as the FCPVD
> devices are mapped in the memory range usually used by the VSP LUT and
> CLU, which are not present in the VSPD. Fix this by shortening the VSPD
> registers range to 0x5000.
> 
> Fixes: 9f8573e38a0b ("arm64: dts: renesas: r8a7795: Add VSP instances")
> Fixes: 291e0c4994d0 ("arm64: dts: r8a7795: Add support for R-Car H3 ES2.0")
> Fixes: f06ffdfbdd90 ("arm64: dts: r8a7796: Add VSP instances")
> Fixes: b4f92030d5d3 ("arm64: dts: renesas: r8a77970: add VSPD support")
> Fixes: 295952a183d3 ("arm64: dts: renesas: r8a77995: add VSP instances")
> Fixes: 85cb3229218a ("arm64: dts: renesas: r8a77965: Add VSP instances")

   That'd be a nightmare for the -stable maintainers -- all those commits
were made in the different time, so constant rejects are warranted.

> Reported-by: Simon Horman <horms+renesas@verge.net.au>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Fix H3, M3-W and M3-N in addition to V3H and D3
> - Don't touch the VSPBS instance of D3 as there's no overlap
> - Squash all patches together

   Don't think that was a good idea in this case. Other opinions?

[...]

MBR, Sergei
