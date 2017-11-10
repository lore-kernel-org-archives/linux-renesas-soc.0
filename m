Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:54199 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753830AbdKJUHH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Nov 2017 15:07:07 -0500
Received: by mail-lf0-f54.google.com with SMTP id l23so12310000lfk.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Nov 2017 12:07:06 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20171110200218.747996672@cogentembedded.com>
Date: Fri, 10 Nov 2017 23:02:18 +0300
To: Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will.deacon@arm.com>
To: linux-renesas-soc@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] Add R8A77970/Eagle PFC support
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 3 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20171110-v4.14-rc8' tag.  We're adding the R8A77970 PFC node
and then describing the pins for SCIF0 and EtherAVB devices declared earlier.
These patches depend on the R8A77970 PFC suport in order to work properly.

[1/3] arm64: dts: renesas: r8a77970: add PFC support
[2/3] arm64: dts: renesas: eagle: add SCIF0 pins
[3/3] arm64: dts: renesas: eagle: add EtherAVB pins

WBR, Sergei
