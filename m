Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:34145 "EHLO
	mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751234AbcGWSrr (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sat, 23 Jul 2016 14:47:47 -0400
Received: by mail-lf0-f41.google.com with SMTP id l69so104921837lfg.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 23 Jul 2016 11:47:46 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] Add R8A7792 I2C support
Date: Sat, 23 Jul 2016 21:47:43 +0300
Message-ID: <1618499.8bcj8adpVO@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20160722-v4.7-rc7' tag plus the SDHI patches just reposted.
We're adding the R8A7792 I2C clocks and device nodes.

[1/2] ARM: dts: r8a7792: add I2C clocks
[2/2] ARM: dts: r8a7792: add I2C support

WBR, Sergei
