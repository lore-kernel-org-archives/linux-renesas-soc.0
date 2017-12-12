Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57720 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752247AbdLLIYt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Dec 2017 03:24:49 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 0/3] arm64: dts: renesas: r8a7796: cleanup of make dtb W=1
Date: Tue, 12 Dec 2017 09:24:33 +0100
Message-Id: <20171212082436.12210-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

this short series makes make dtb W=1 builds clean.

Patch 1 sorts subnodes of the root node into alphabetical order
to... well bring some order to things.

Patch 2 moves nodes without reg properties out of the SoC bus,
this is in keeping with recent work for the r8a7795 SoC.

Patch 3 adds reg property to the place holder peciec[01] nodes

Et voilà, make dtb W=1 no longer emits warnings.

$ aarch64-linux-gnu-gcc --version
aarch64-linux-gnu-gcc (Linaro GCC 5.4-2017.05) 5.4.1 20170404
Copyright (C) 2015 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.


Based on renesas-devel-20171211-v4.15-rc3

Simon Horman (3):
  arm64: dts: renesas: r8a7796: sort subnodes of root node
    alphabetically
  arm64: dts: renesas: r8a7796: move nodes which have no reg property
    out of bus
  arm64: dts: renesas: r8a7796: add reg properties to pciec[01] nodes

 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 216 ++++++++++++++++---------------
 1 file changed, 111 insertions(+), 105 deletions(-)

-- 
2.11.0
