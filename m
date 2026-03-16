Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBD839D6D9;
	Mon, 16 Mar 2026 15:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773673549; cv=none; b=PI9fAHjwQHjVeyd25n3Fy6Q3s8kBRZCrzTnP66yT5o8TuZRjP2GXAvYi0PKsF7iiDSbgn5zROxZJLNnjmF/ywRfFkYXNz+AwYBOkaXXzWk4TrTGu4ljQaW4ebnF9X9cWZsp78co11lCJqG21PlFFwC00nq6gKw7DjvByggqqHus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773673549; c=relaxed/simple;
	bh=x+cgUvr438bVTO/IQ+CxFF0o9w9JPVrRDmnPyoshILA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lNrZ1y6N8rEGtyXD9p4UXrE0w5V+crJfSealyL4rzkN7JPpmCxPlCSRNkTRqKs12mmnOl42lxPZMje3a6V2311fD8SHLajaS7/dVhmbFzOrkHKbv6j1NjVIOuSFP2f8QKN4XEMVX3Twoh0MJ6+w82kErqwmtc2lK1uze5wxdCUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=aM7jRrDT; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="aM7jRrDT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=c153/eFSK0FoXSdZJ7Uwh5iF9H38b6f8SrCMH7YVoKw=; b=aM7jRrDTNCBq7tx9aNC0o66TxY
	bbfhkgbmbbHnCnCruGuyVdZyjObN8rUi5WETCa5C5fSGy4ixkw4Ux4txILuJXU4opZCLZCKGoKhDC
	t1gjfsnjCCOxvAaXu8YZobV2TLpJv3Wn3fEJ/IaWuJoy2deM9qfSWPgawlFmVM7ouX9dULrSEBIL/
	EaNTcwFEwHW7e8O/8YK+Sv0EV+hsiAyYCST33R4Kb0o66fCiaNion8NQFCezsXL+yi10OHibYs7Tk
	kyVgG+F74U9bmx9QSyvDZnGWzYg2CEqxuSXBibbpwkotQi9IVZY/scG0k3wjQgFqPfOwStI02HyCU
	0N1AiCPQ==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w29Vq-0009Lr-0I;
	Mon, 16 Mar 2026 16:05:46 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w29Vo-0003GC-21;
	Mon, 16 Mar 2026 16:05:45 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/3] arm64: defconfig: enable EMC2305 driver
Date: Mon, 16 Mar 2026 16:04:53 +0100
Message-ID: <20260316150535.786122-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316150535.786122-1-alexander.stein@ew.tq-group.com>
References: <20260316150535.786122-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27942/Mon Mar 16 07:24:14 2026)

EMC2301 is used on MBa95xxCA mainboard.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4bfd712f9144e..c4586e7061107 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -754,6 +754,7 @@ CONFIG_SENSORS_MACSMC_HWMON=m
 CONFIG_SENSORS_LM75=m
 CONFIG_SENSORS_LM90=m
 CONFIG_SENSORS_PWM_FAN=m
+CONFIG_SENSORS_EMC2305=m
 CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SA67MCU=m
 CONFIG_SENSORS_SL28CPLD=m
-- 
2.43.0

