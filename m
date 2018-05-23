Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:33155 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932529AbeEWLmz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 May 2018 07:42:55 -0400
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/6] mfd: da9063: Add DA9063L type
Date: Wed, 23 May 2018 13:42:27 +0200
Message-Id: <20180523114230.10109-3-marek.vasut+renesas@gmail.com>
In-Reply-To: <20180523114230.10109-1-marek.vasut+renesas@gmail.com>
References: <20180523114230.10109-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add type for DA9063L, which is a reduced variant of the DA9063
without RTC block and with less regulators.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Steve Twiss <stwiss.opensource@diasemi.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 include/linux/mfd/da9063/core.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mfd/da9063/core.h b/include/linux/mfd/da9063/core.h
index eb234582dcb2..c3e917dd1860 100644
--- a/include/linux/mfd/da9063/core.h
+++ b/include/linux/mfd/da9063/core.h
@@ -33,6 +33,7 @@
 
 enum da9063_type {
 	PMIC_TYPE_DA9063 = 0,
+	PMIC_TYPE_DA9063L,
 };
 
 enum da9063_variant_codes {
-- 
2.16.2
