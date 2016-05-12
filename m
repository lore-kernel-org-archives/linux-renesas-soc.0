Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:36782 "EHLO
	mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751148AbcELUiM (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 12 May 2016 16:38:12 -0400
Received: by mail-lf0-f48.google.com with SMTP id u64so78485317lff.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 May 2016 13:38:11 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/6] Add R8A7794/SILK sound DT support
Date: Thu, 12 May 2016 23:38:08 +0300
Message-ID: <2378837.cigT3tNQPe@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 6 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20160509-v4.6-rc7' tag. I'm adding the sound device tree support
for the R8A7794 SoC based SILK board.

[1/6] ARM: dts: r8a7794: add audio clocks
[2/6] ARM: dts: r8a7794: add MSTP5 clocks
[3/6] ARM: dts: r8a7794: add MSTP10 clocks
[4/6] ARM: dts: r8a7794: add Audio-DMAC support
[5/6] ARM: dts: r8a7794: add sound support
[6/6] ARM: dts: silk: add sound support

WBR, Sergei
