Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:33327 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752666AbcJGTGO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Oct 2016 15:06:14 -0400
Received: by mail-lf0-f54.google.com with SMTP id x79so48349797lff.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Oct 2016 12:06:14 -0700 (PDT)
Subject: Re: [PATCH 2/3] ARM: shmobile: r8a7743: add CPG clock index macros
To: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>
References: <19700058.YBgRO3SXUI@wasted.cogentembedded.com>
 <4289081.UEHqeRI6YW@wasted.cogentembedded.com>
Cc: linux-clk@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <8b978817-017a-bd68-b4af-1dcbdd6a49b6@cogentembedded.com>
Date: Fri, 7 Oct 2016 22:06:10 +0300
MIME-Version: 1.0
In-Reply-To: <4289081.UEHqeRI6YW@wasted.cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 10/05/2016 11:54 PM, Sergei Shtylyov wrote:

> Add macros usable by the device tree sources to reference the R8A7743 CPG
> clocks  by index.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

    Probably makes ense to merge this patch to both the clk and renesas trees 
in order to satisfy the dependencies both ways... what do you think, Simon?

MBR, Sergei
