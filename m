Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:38072 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751903AbcETG7s (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 20 May 2016 02:59:48 -0400
Received: from vsmta14.fe.internet.bosch.com (unknown [10.4.98.54])
	by imta23.fe.bosch.de (Postfix) with ESMTP id 9083B15800A8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 May 2016 08:59:46 +0200 (CEST)
Received: from SI-HUB1000.de.bosch.com (vsgw24.fe.internet.bosch.com [10.4.98.24])
	by vsmta14.fe.internet.bosch.com (Postfix) with ESMTP id E559EA40267
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 May 2016 08:59:45 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
CC: Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH v3 0/6] arm64: renesas: Obtain MD pin values using syscon/regmap
Date: Fri, 20 May 2016 08:57:36 +0200
Message-ID: <1463727462-16260-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This is a resend of

http://www.spinics.net/lists/linux-sh/msg44757.html

It's rebased against

https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/gen3-latest
renesas-drivers-2016-05-17-v4.6
4717ef6d59c3204e385c
Revert "ASoC: simple-card: Add pm callbacks to platform driver"

and adds support for r8a7796, too.

It's boot tested on r8a7795 Salvator-X and checked that the same
mode value is read without and with this patch series.

Dirk

Changes in v3:
- Rename R-Car M3 -> R-Car M3-W
- Fix subject of patch 2/6

Changes in v2:
- rebase against renesas-drivers-2016-05-17-v4.6
- switch renesas,rst-<soctype> to renesas,<soctype>-rst
- Fix typo in r8a7796-rst
- Move rcar_gen3_read_mode_pins() to renesas-cpg-mssr.c, as we're gonna need it for
  R-Car Gen2 too, if/when that is converted to cpg-mssr.c.
