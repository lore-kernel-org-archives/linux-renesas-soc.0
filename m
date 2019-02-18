Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AEB1C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 10:05:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 240972146F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 10:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728539AbfBRKFe (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 05:05:34 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:56978 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728909AbfBRKFe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 05:05:34 -0500
X-Halon-ID: af36e1f1-3364-11e9-b5ae-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [89.233.230.99])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id af36e1f1-3364-11e9-b5ae-0050569116f7;
        Mon, 18 Feb 2019 11:05:30 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/3] rcar-csi2: Update start procedures to latest revision of datasheet
Date:   Mon, 18 Feb 2019 11:03:10 +0100
Message-Id: <20190218100313.14529-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

This series update the driver to match changes in the latest datasheet 
(rev 1.50). All changes are related to register setup when starting the 
stream.

Niklas Söderlund (3):
  rcar-csi2: Update V3M and E3 start procedure
  rcar-csi2: Update start procedure for H3 ES2
  rcar-csi2: Move setting of Field Detection Control Register

 drivers/media/platform/rcar-vin/rcar-csi2.c | 51 +++++++++++++++++----
 1 file changed, 41 insertions(+), 10 deletions(-)

-- 
2.20.1

