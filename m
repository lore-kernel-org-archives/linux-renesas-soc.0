Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:40870 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751146AbeCIMFA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Mar 2018 07:05:00 -0500
Received: by mail-lf0-f46.google.com with SMTP id 37-v6so12867487lfs.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Mar 2018 04:05:00 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/3] Add R8A77980/Condor PFC support
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Message-ID: <88e52531-e538-8685-110a-1a2e79a3fe49@cogentembedded.com>
Date: Fri, 9 Mar 2018 15:04:56 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 3 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20180308-v4.16-rc4' tag.  We're adding the R8A77980 PFC node
and then describing the pins for SCIF0 and EtherAVB devices declared earlier.
These patches depend on the R8A77980 PFC support in order to work properly.

[1/3] arm64: dts: renesas: r8a77980: add PFC support
[2/3] arm64: dts: renesas: condor: add SCIF0 pins
[3/3] arm64: dts: renesas: condor: add EtherAVB pins

WBR, Sergei
