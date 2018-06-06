Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:38930 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753692AbeFFQv7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 12:51:59 -0400
Received: by mail-lf0-f68.google.com with SMTP id t134-v6so10169155lff.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Jun 2018 09:51:58 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/5] Add R8A77970/V3MSK LVDS/HDMI support
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Message-ID: <9c092022-dcdd-1320-499c-00c5b2d9db3b@cogentembedded.com>
Date: Wed, 6 Jun 2018 19:51:55 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 5 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20180604-v4.17-rc7' tag. We're adding the R8A77980 FCPVD/VSPD/
DU/LVDS device nodes and then describing the LVDS decoder and HDMI encoder
connected to the LVDS output. These patches depend on the Thine THC63LVD1024
driver and the R8A77980 LVDS support patch in order to work, and R8A77980 GPIO
DT patches in order to apply/compile...

[1/5] arm64: dts: renesas: r8a77980: add FCPVD support
[2/5] arm64: dts: renesas: r8a77980: add VSPD support
[3/5] arm64: dts: renesas: r8a77980: add DU support
[4/5] arm64: dts: renesas: r8a77980: add LVDS support
[5/5] arm64: dts: renesas: condor: add DU/LVDS/HDMI support

WBR, Sergei
