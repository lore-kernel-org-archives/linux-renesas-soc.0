Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:35405 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S941577AbcJ0VBe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 17:01:34 -0400
Received: by mail-lf0-f54.google.com with SMTP id f134so37127127lfg.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Oct 2016 14:01:15 -0700 (PDT)
Subject: Re: [PATCH 0/2] Renesas R8A7745 CPG/MSSR clock support
To: mturquette@baylibre.com, linux-clk@vger.kernel.org,
        sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
References: <13079532.zQoaX56ouR@wasted.cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <92ed8fd0-33c5-f5af-15ce-311cf61e5f83@cogentembedded.com>
Date: Fri, 28 Oct 2016 00:01:12 +0300
MIME-Version: 1.0
In-Reply-To: <13079532.zQoaX56ouR@wasted.cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 10/27/2016 11:41 PM, Sergei Shtylyov wrote:

>    Here's the set of 2 patches against the 'clk-next' branch of CLK group's
> 'linux.git' repo plus the R8A7743 CPG/MSSR patches just re-posted. They also
> depend on the common R-Car Gen2 support patch. As the DT patches in the
> R8A7745/SK-RZG1E board support series depend on the patch #1 of this series,
> it might make sense to merge this patch to the 'renesas.git' repo as well...
>
> [1/2] ARM: shmobile: r8a7745: add CPG clock index macros
> [2/2] clk: renesas: cpg-mssr: add R8A7745 support

    Forgot to mention that the patch #2 depends on Geert's RST driver in order 
to build.

MBR, Sergei
