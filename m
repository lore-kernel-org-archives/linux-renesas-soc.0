Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:10016 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752266AbcEYI6f (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 25 May 2016 04:58:35 -0400
Received: from vsmta11.fe.internet.bosch.com (unknown [10.4.98.51])
	by imta24.fe.bosch.de (Postfix) with ESMTP id E0584D80204
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 May 2016 10:58:32 +0200 (CEST)
Received: from SI-HUB1001.de.bosch.com (vsgw24.fe.internet.bosch.com [10.4.98.24])
	by vsmta11.fe.internet.bosch.com (Postfix) with ESMTP id A0AF723804EC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 May 2016 10:58:32 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>
CC: Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH 0/4] ARM: Renesas: R-Car3: Add product register support
Date: Wed, 25 May 2016 10:58:24 +0200
Message-ID: <1464166708-18320-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Instead of hard coding the product register in rcar_du_crtc.c,
read it based on the device tree.

This patch series is based on

https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/gen3-latest
renesas-drivers-2016-05-17-v4.6
4717ef6d59c3204e385c
Revert "ASoC: simple-card: Add pm callbacks to platform driver"

It's boot tested on r8a7795 Salvator-X and checked that the same
product register value is read without and with this patch series.

Dirk
