Return-Path: <SRS0=zZV/=CO=vger.kernel.org=linux-renesas-soc-owner@vergenet.net>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:45816 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935269AbdKPVDM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Nov 2017 16:03:12 -0500
Received: by mail-lf0-f52.google.com with SMTP id e143so376952lfg.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Nov 2017 13:03:12 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20171116205647.152964720@cogentembedded.com>
Date: Thu, 16 Nov 2017 23:56:47 +0300
To: Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will.deacon@arm.com>
To: linux-renesas-soc@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/1] Add R8A77970/Eagle I2C support
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20171113-v4.14' tag. We're adding the R8A77970 I2C nodes
and then describing the PCA9654 I/O expander connected to the I2C0 bus.
These patches depend on the R8A77970/Eagle PFC suport patchset in order
to apply/compile.

[1/2] arm64: dts: renesas: r8a77970: add I2C support
[2/2] arm64: dts: renesas: eagle: add I2C support

WBR, Sergei
