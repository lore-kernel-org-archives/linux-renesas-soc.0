Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:34388 "EHLO
	mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757485AbcG0U4B (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 27 Jul 2016 16:56:01 -0400
Received: by mail-lf0-f52.google.com with SMTP id l69so35843790lfg.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Jul 2016 13:56:00 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/6] Add R8A7794/SILK sound DT support
Date: Wed, 27 Jul 2016 23:55:52 +0300
Message-ID: <3910788.ckTpUWEs6B@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 6 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20160725-v4.7-rc7' tag. I'm adding the sound device tree support
for the R8A7794 SoC based SILK board.

[1/6] ARM: dts: r8a7794: add audio clocks
[2/6] ARM: dts: r8a7794: add MSTP5 clocks
[3/6] ARM: dts: r8a7794: add MSTP10 clocks
[4/6] ARM: dts: r8a7794: add Audio-DMAC support
[5/6] ARM: dts: r8a7794: add sound support
[6/6] ARM: dts: silk: add sound support

WBR, Sergei
