Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:33455 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751616AbdDOUUi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Apr 2017 16:20:38 -0400
Received: by mail-lf0-f52.google.com with SMTP id 88so5693023lfr.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Apr 2017 13:20:37 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170415201825.223149827@cogentembedded.com>
Date: Sat, 15 Apr 2017 23:18:25 +0300
To: Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>
To: Rob Herring <robh+dt@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Russell King <linux@armlinux.org.uk>
To: linux-renesas-soc@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/3] Add R8A7745/SK-RZG1E PFC support
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20170410-v4.11-rc6' tag.  We're adding the R8A7745 PFC node and
then describe the pins for SCIF2 and Ether devices declared earlier. These
patches depend on the R8A7745 PFC suport in order to work properly.

[1/3] ARM: dts: r8a7745: add PFC support
[2/3] ARM: dts: sk-rzg1e: add SCIF2 pins
[3/3] ARM: dts: sk-rzg1e: add Ether pins

WBR, Sergei
