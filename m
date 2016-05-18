Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:28550 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752082AbcERLVJ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 18 May 2016 07:21:09 -0400
Received: from vsmta13.fe.internet.bosch.com (unknown [10.4.98.53])
	by imta23.fe.bosch.de (Postfix) with ESMTP id EE6C21580201
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 May 2016 13:21:07 +0200 (CEST)
Received: from FE-HUB1001.de.bosch.com (vsgw23.fe.internet.bosch.com [10.4.98.23])
	by vsmta13.fe.internet.bosch.com (Postfix) with ESMTP id 950192E40841
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 May 2016 13:21:07 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
CC: Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH v2 0/6] arm64: renesas: Obtain MD pin values using syscon/regmap
Date: Wed, 18 May 2016 13:19:02 +0200
Message-ID: <1463570348-32349-1-git-send-email-dirk.behme@de.bosch.com>
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

Changes in v2:
- rebase against renesas-drivers-2016-05-17-v4.6
- switch renesas,rst-<soctype> to renesas,<soctype>-rst
- Fix typo in r8a7796-rst
- Move rcar_gen3_read_mode_pins() to renesas-cpg-mssr.c, as we're gonna need it for
  R-Car Gen2 too, if/when that is converted to cpg-mssr.c.
