Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:40341 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751788AbeB0UGN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Feb 2018 15:06:13 -0500
Received: by mail-lf0-f66.google.com with SMTP id 37so91874lfs.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2018 12:06:13 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/5] Add R8A77970/V3MSK LVDS/HDMI support
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Message-ID: <23a6ac28-134b-b5dd-69a7-910774c4b8c1@cogentembedded.com>
Date: Tue, 27 Feb 2018 23:06:10 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 5 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20180227-v4.16-rc3' tag. We're adding the R8A77970 FCPVD/VSPD/
DU/LVDS device nodes and then describing the HDMI encoder connected to the LVDS
output (we're omitting the LVDS decoder for now). These patches depend on
the recent R8A77970 DU/LVDS rework patches by Laurent in order to work...	

[1/5] arm64: dts: renesas: r8a77970: add FCPVD support
[2/5] arm64: dts: renesas: r8a77970: add VSPD support
[3/5] arm64: dts: renesas: r8a77970: add DU support
[4/5] arm64: dts: renesas: r8a77970: add LVDS support
[5/5] arm64: dts: renesas: v3msk: add DU/LVDS/HDMI support

WBR, Sergei
