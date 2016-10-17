Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:57276 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759389AbcJQU3M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Oct 2016 16:29:12 -0400
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 200802003E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Oct 2016 22:28:21 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] R-Car FDP: Remove SoC-specific compatible strings
Date: Mon, 17 Oct 2016 23:29:01 +0300
Message-Id: <1476736143-29937-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

Now that the Gen3 documentation mentions the FCP version register, it's clear
that the SoC instance in which the FCP is integrated can be identified at
runtime without requiring SoC-specific compatible strings.

I've tested R-Car H3 ES1.x and R-Car M3 and the results match the
documentation, so it should be safe to use the generic compatible strings
only.

Laurent Pinchart (2):
  dt-bindings: media: renesas-fcp: Remove SoC-specific compatible
    strings
  arm64: dts: r8a7795: Remove FCP SoC-specific compatible strings

 .../devicetree/bindings/media/renesas,fcp.txt      |  8 +-------
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 24 +++++++++++-----------
 2 files changed, 13 insertions(+), 19 deletions(-)

-- 
Regards,

Laurent Pinchart
