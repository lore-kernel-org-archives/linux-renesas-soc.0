Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:57388 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751382AbcEIHPn (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 9 May 2016 03:15:43 -0400
Received: from vsmta12.fe.internet.bosch.com (unknown [10.4.98.52])
	by imta24.fe.bosch.de (Postfix) with ESMTP id 75D59D80226
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 May 2016 09:15:41 +0200 (CEST)
Received: from SI-HUB1000.de.bosch.com (vsgw24.fe.internet.bosch.com [10.4.98.24])
	by vsmta12.fe.internet.bosch.com (Postfix) with ESMTP id 32FA61B80398
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 May 2016 09:15:41 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
CC: Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH 00/10] arm64: renesas: Obtain MD pin values using syscon/regmap
Date: Mon, 9 May 2016 09:13:51 +0200
Message-ID: <1462778041-19595-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This is a resend of

http://www.spinics.net/lists/linux-sh/msg44757.html

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
