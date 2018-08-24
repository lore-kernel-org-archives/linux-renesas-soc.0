Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44123 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbeHXOSL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 10:18:11 -0400
Received: by mail-lf1-f67.google.com with SMTP id g6-v6so6338434lfb.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Aug 2018 03:44:07 -0700 (PDT)
Subject: Re: [PATCH v2 9/9] arm64: dts: renesas: r8a774a1: Add FCPF and FCPV
 instances
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
References: <c27a266e-3eaa-a879-85ab-0e0aeb5f8b31@cogentembedded.com>
 <1535103029-10576-1-git-send-email-fabrizio.castro@bp.renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <c91704ce-4eb1-4017-973d-a6cce88adfd1@cogentembedded.com>
Date: Fri, 24 Aug 2018 13:44:04 +0300
MIME-Version: 1.0
In-Reply-To: <1535103029-10576-1-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 08/24/2018 12:30 PM, Fabrizio Castro wrote:

> Add FCPF and FCPV instances to the r8a774a1 dtsi, similarly
> to what was done for the r8a7796 with commits 41dbbf0c5 ("arm64: dts:
                                                ^^^^^^^^^
   Still 8 digits...

> r8a7796: Add FCPF and FCPV instances"), 69490bc9665d ("arm64: dts:
> renesas: r8a7796: Point FDP1 via FCPF to IPMMU-VI0"), and cef942d0bd89
> ("arm64: dts: renesas: r8a7796: Point VSPI via FCPVI to IPMMU-VC0").
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
[...]

MBR, Sergei
