Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:54503 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751502AbcELI3M (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 12 May 2016 04:29:12 -0400
Received: from vsmta12.fe.internet.bosch.com (unknown [10.4.98.52])
	by imta24.fe.bosch.de (Postfix) with ESMTP id 86CA6D80230
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 May 2016 10:29:10 +0200 (CEST)
Received: from FE-HUB1001.de.bosch.com (vsgw22.fe.internet.bosch.com [10.4.98.11])
	by vsmta12.fe.internet.bosch.com (Postfix) with ESMTP id 0C6C31B802DA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 May 2016 10:29:10 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
CC: Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH 0/6] arm64: renesas: Obtain MD pin values using syscon/regmap
Date: Thu, 12 May 2016 10:27:15 +0200
Message-ID: <1463041641-27485-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This is a resend of

http://www.spinics.net/lists/linux-sh/msg44757.html

It's rebased against

https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/gen3-latest
0ea1cc9f0c9537d3fb42722c188
[WIP] arm64: r8a7796: Integration

and adds support for r8a7796, too.

It's boot tested on r8a7795 Salvator-X and checked that the same
mode value is read without and with this patch series.

Dirk
