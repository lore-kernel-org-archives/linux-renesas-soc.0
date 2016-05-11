Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:12985 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751287AbcEKFbY (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 11 May 2016 01:31:24 -0400
Received: from vsmta13.fe.internet.bosch.com (unknown [10.4.98.53])
	by imta24.fe.bosch.de (Postfix) with ESMTP id C427ED80217
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 07:31:22 +0200 (CEST)
Received: from SI-HUB1001.de.bosch.com (vsgw22.fe.internet.bosch.com [10.4.98.11])
	by vsmta13.fe.internet.bosch.com (Postfix) with ESMTP id 57B4C2E406A9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 07:31:22 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
CC: Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH v2 00/10] ARM: renesas RCar: Add boot-mode-reg core support
Date: Wed, 11 May 2016 07:29:28 +0200
Message-ID: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This is a resend of

http://www.spinics.net/lists/linux-sh/msg45969.html

Besides some minor clean up and fixes, it's rebased against

https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/gen3-latest
0ea1cc9f0c9537d3fb42722c188
[WIP] arm64: r8a7796: Integration

and adds support for RCar Gen3. Additionally, it moves the MODEMR
register to device tree instead of hard coding its address.

These patches are available in

https://github.com/dirkbehme/linux-renesas-rcar-gen3/commits/geert/topic/gen3-latest-modereg

too.

It's boot tested on r8a7795 Salvator-X and checked that the same
mode value is read without and with this patch series.

Dirk

Changes in v2:

* Correct link & subject in introduction patch 0000
* Fix some spelling errors
* Drop the goto in boot_mode_reg_get() and boot_mode_reg_get()
* Convert device tree node to renesas,rcar-rst and use whole reset device
* Add devcie tree node documentation
* Preserve compatibility with old DTBs that don't have the node in DT
