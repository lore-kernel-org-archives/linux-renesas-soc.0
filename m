Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:45174 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937351AbcJVL3M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 22 Oct 2016 07:29:12 -0400
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 12AA820035
        for <linux-renesas-soc@vger.kernel.org>; Sat, 22 Oct 2016 13:28:19 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/3] R-Car M3-W: Add FCP, VSP and DU clocks
Date: Sat, 22 Oct 2016 14:29:03 +0300
Message-Id: <1477135746-7144-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This patch series adds all the r8a7796 FCP, VSP and DU clocks. This includes
not only all the clocks required for display, but also the FCPC, FCPF, VSPB
and VSPI0 clocks to cover all the FCP and VSP instances.

Compared to v2 parent clocks have been updated to the latest information
received from Renesas and all of them match the latest BSP. Geert, I believe
the patches are ready to be queued for v4.10.

Laurent Pinchart (3):
  clk: renesas: r8a7796: Add FCP clocks
  clk: renesas: r8a7796: Add VSP clocks
  clk: renesas: r8a7796: Add DU and LVDS clocks

 drivers/clk/renesas/r8a7796-cpg-mssr.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

-- 
Regards,

Laurent Pinchart
