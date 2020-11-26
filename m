Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF8FC71156
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 26 Nov 2020 14:21:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 630F521D46
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 26 Nov 2020 14:21:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390266AbgKZOUv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 26 Nov 2020 09:20:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389937AbgKZOUm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 09:20:42 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 594D0C061A47
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2020 06:20:42 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id x2Ld2300H4C55Sk012LdNt; Thu, 26 Nov 2020 15:20:37 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kiI8T-005s37-5j; Thu, 26 Nov 2020 15:20:37 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kiHVh-00HGZA-0D; Thu, 26 Nov 2020 14:40:33 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Prabhakar <prabhakar.csengg@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v4 0/2] ARM: dts: r8a7742-iwg21d-q7-dbcm: Add support for ov7725 sensors
Date:   Thu, 26 Nov 2020 14:40:29 +0100
Message-Id: <20201126134031.4115211-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Prabhakar,

This is an alternative version of your v3, decribing only a single
camera in each .dtsi file, to be included multiple times.

Thanks for your comments!

Lad Prabhakar (2):
  ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Separate out ov5640 nodes
  ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add support for 8-bit ov7725
    sensors

 .../boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    | 155 +++++++++---------
 .../r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi |  30 ++++
 .../r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi |  27 +++
 3 files changed, 134 insertions(+), 78 deletions(-)
 create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
 create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
