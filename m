Return-Path: <SRS0=kYII=BN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF78C433E0
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  3 Aug 2020 12:00:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA4BC20678
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  3 Aug 2020 12:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596456056;
	bh=Du9OQpd/VOGf/iA7IlXDEvI2jIkyD8HIhsY9DMglglQ=;
	h=Subject:From:Date:To:List-ID:From;
	b=dCH44bY3RsMirR7+FxYQ3khjaHBC3tpX8ufMQ4hyT90ON59+UNyDNBISsuoEvzz37
	 xzKtz7hrHCkT5XU9At2n+tn4vTgs/tXXm/QIjQbx4Ba7Rcs5TNNobFhH2vV9OdaCzw
	 1kremMvuU9eZFVO+J3Or6NpE3cCHai+eV1ScGvUw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbgHCMA4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 3 Aug 2020 08:00:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:37006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726370AbgHCMAy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Aug 2020 08:00:54 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596456043;
        bh=Du9OQpd/VOGf/iA7IlXDEvI2jIkyD8HIhsY9DMglglQ=;
        h=Subject:From:Date:To:From;
        b=QxWgX6iK53U6LyvfC9yIIVInhCHMXDWb19QNVZAj7I2gz5tUMfol5+c3xRTuyWmH/
         nhmzH8b2DgFulQ6ANQzuLiSuu2DueTMdXliK7DuzWN/Yw1k4+NpIKSdeV5XgdJWDlJ
         UVDGkQduOp7+YcpqPdonyDfjd0ouBLXYJP/GRf9E=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159645604358.8465.16006197297804602029.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 03 Aug 2020 12:00:43 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] media: i2c: ov772x: Enable BT656 mode and test pattern support (2020-08-03T11:39:10)
  Superseding: [v1] media: i2c: ov772x: Enable BT656 mode and test pattern support (2020-07-24T15:08:14):
    [1/2] media: i2c: ov772x: Add support for BT656 mode
    [2/2] media: i2c: ov772x: Add test pattern control


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
