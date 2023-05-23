Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78461C77B75
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 May 2023 06:43:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235237AbjEWGn1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 23 May 2023 02:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232755AbjEWGnZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 May 2023 02:43:25 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DE53118
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2023 23:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=bsEJMT7PL8ygwWwOZmmg6TMP6cr
        VqspcIVpnTgNVp6A=; b=N7zX9oTD1UeCAPKtFwPDQYZLj9i1c0MAXpz8f9xS70/
        1FSCxKwpNG6mwftOHeD0MFPBAYejIStgsWHlw2eGzAqbrlg6Zfgujd8BowSsbX80
        VRzPeC8ShIdOqCOctYnWOUgnry6/7AdzmFewqYdBlujtHoGS3OA2TZXnBIe91gzI
        =
Received: (qmail 2628164 invoked from network); 23 May 2023 08:43:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 May 2023 08:43:20 +0200
X-UD-Smtp-Session: l3s3148p1@rcy7s1b82MgujnsI
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 0/5] gnss: updates to support the Renesas KingFisher board
Date:   Tue, 23 May 2023 08:43:05 +0200
Message-Id: <20230523064310.3005-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi, here are some patches with which I can use the GPS receiver on the
Renesas KingFisher board. They are RFC because of my proposal to merge
UBX and MTK drivers in patch 1. Patches 2-5 should be good to go from my
point of view. Looking forward to comments!

   Wolfram


Wolfram Sang (5):
  WIP: gnss: merge MTK driver into UBX driver
  gnss: ubx: use new helper to remove open coded regulator handling
  gnss: ubx: 'vcc' can be optional
  gnss: ubx: add support for the reset gpio
  arm64: dts: renesas: ulcb-kf: add node for GPS

 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi |  9 ++-
 drivers/gnss/ubx.c                       | 82 +++++++++++++++---------
 2 files changed, 58 insertions(+), 33 deletions(-)

-- 
2.35.1

