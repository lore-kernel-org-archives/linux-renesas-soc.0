Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:34750 "EHLO
        mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935063AbcJ0VAx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 17:00:53 -0400
Received: by mail-lf0-f41.google.com with SMTP id b81so41962352lfe.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Oct 2016 14:00:53 -0700 (PDT)
Subject: Re: [PATCH v4 0/2] Renesas R8A7743 CPG/MSSR clock support
To: mturquette@baylibre.com, linux-clk@vger.kernel.org,
        sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
References: <1590929.i2qFnIhqnT@wasted.cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <ec1c0f63-203d-44c4-1a81-ed5e8fb0907b@cogentembedded.com>
Date: Fri, 28 Oct 2016 00:00:49 +0300
MIME-Version: 1.0
In-Reply-To: <1590929.i2qFnIhqnT@wasted.cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 10/27/2016 11:20 PM, Sergei Shtylyov wrote:

>    Here's the set of 2 patches against the 'clk-next' branch of CLK group's
> 'linux.git' repo. I've splitted them from the R-Car gen2 common support patch.
> As the DT patches in the R8A7743/SK-RZG1M board support series depend on the
> patch #1 of this series, it might make sense to merge this patch to the
> 'renesas.git' repo as well...
>
> [1/2] ARM: shmobile: r8a7743: add CPG clock index macros
> [2/2] clk: renesas: cpg-mssr: add R8A7743 support

    Forgot to mention that the patch #2 depends on Geert's RST driver in order 
to build.

MBR, Sergei
