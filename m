Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B20C636CD
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  7 Feb 2023 14:53:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231859AbjBGOxE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 7 Feb 2023 09:53:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230361AbjBGOxE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Feb 2023 09:53:04 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC39E051;
        Tue,  7 Feb 2023 06:52:58 -0800 (PST)
Received: (Authenticated sender: clement.leger@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 8EB641BF20F;
        Tue,  7 Feb 2023 14:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1675781576;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=zgMTI4xPdXNbZ7ihc2jVVVGurIYkk29myD3N/sebiyc=;
        b=o7aUrY8MeMxv+A37kVDGeWFmwbU5SLC5ivPSwRChGTztIb896TTBUfW2dm5N5MLcUJ2EGV
        2GgncbYsSVkezyMzScdOFW1VI0BanwpMuQxaY8QniDSsKw2VcEjeBRkMa/H6MS8B3s4Wmh
        6F7WEW0dD8fZVSPhnxPIRZKHZVmNT+3RWNOVX2JkXIGK/5oql5quoPCoSB0rGzPToGVJP2
        4IFY7YUXjyUDYmUqJCovZutqRGcAygpmcPH2i+Y1pV6vv27GCZTGBy28GQ7ZcXp1xlih9j
        4WsRygxekpHedoToTCSWrHluS50viuhtUjF6wPziy2jYdYh5vd7MwvZH5E6XSQ==
From:   =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ARM: dts: add device-tree and bindings for renesas,rzn1d400-eb
Date:   Tue,  7 Feb 2023 15:54:42 +0100
Message-Id: <20230207145444.166950-1-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This short series adds support for the RZ/N1 Expansion Board. This board
is a carrier board on which a daughter board (either RZ/N1D or RZ/N1S)
can be plugged. The device-tree that is added by this series enables the
use to the 2 external switch ports that are present on this board.

Clément Léger (2):
  dt-bindings: soc: renesas: renesas.yaml: add renesas,rzn1d400-eb
    compatible
  ARM: dts: r9a06g032: add EB board device-tree

 .../bindings/soc/renesas/renesas.yaml         |  6 ++
 arch/arm/boot/dts/Makefile                    |  1 +
 arch/arm/boot/dts/r9a06g032-rzn1d400-eb.dts   | 92 +++++++++++++++++++
 3 files changed, 99 insertions(+)
 create mode 100644 arch/arm/boot/dts/r9a06g032-rzn1d400-eb.dts

-- 
2.39.0

