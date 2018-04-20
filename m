Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:36853 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751879AbeDTRdY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Apr 2018 13:33:24 -0400
Received: by mail-lf0-f52.google.com with SMTP id d20-v6so6238909lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Apr 2018 10:33:23 -0700 (PDT)
Subject: Re: [PATCH 0/3] Add R8A77980/Condor PFC support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
References: <88e52531-e538-8685-110a-1a2e79a3fe49@cogentembedded.com>
Message-ID: <4b325d8a-f018-5279-17b9-7fa8aac5b4da@cogentembedded.com>
Date: Fri, 20 Apr 2018 20:33:20 +0300
MIME-Version: 1.0
In-Reply-To: <88e52531-e538-8685-110a-1a2e79a3fe49@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 03/09/2018 03:04 PM, Sergei Shtylyov wrote:

> Here's the set of 3 patches against Simon Horman's 'renesas.git' repo's
> 'renesas-devel-20180308-v4.16-rc4' tag.  We're adding the R8A77980 PFC node
> and then describing the pins for SCIF0 and EtherAVB devices declared earlier.
> These patches depend on the R8A77980 PFC support in order to work properly.

  ... and their time has finally come! Please merge.

> [1/3] arm64: dts: renesas: r8a77980: add PFC support
> [2/3] arm64: dts: renesas: condor: add SCIF0 pins
> [3/3] arm64: dts: renesas: condor: add EtherAVB pins

WBR, Sergei
