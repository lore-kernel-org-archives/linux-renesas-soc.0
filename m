Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:44961 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754559AbeDZKk6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Apr 2018 06:40:58 -0400
Received: by mail-lf0-f65.google.com with SMTP id h197-v6so2593970lfg.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Apr 2018 03:40:57 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Use R8A77980 CPG core clock and SYSC power domain macros
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Message-ID: <ea6d3e8a-71a9-9998-f364-7dc82b97c2c0@cogentembedded.com>
Date: Thu, 26 Apr 2018 13:40:53 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20180425-v4.17-rc2' tag. Now that the R8A77980 CPG core clock
and SYSC power domain #define's have hit Linus' tree, we can replace the bare
numbers (we had to use to avoid a cross tree dependencies) with these #define's,
at last...

[1/2] arm64: dts: renesas: r8a77980: use CPG core clock macros
[2/2] arm64: dts: renesas: r8a77978: use SYSC power domain macros

WBR, Sergei
