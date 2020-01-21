Return-Path: <SRS0=dRkz=3K=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA95C2D0CE
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 21 Jan 2020 21:20:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3CC9E24653
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 21 Jan 2020 21:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579641636;
	bh=zekrBB8O6IZiWElIkK8EppHgwiH6Z532bfKTj20pOJM=;
	h=Subject:From:Date:To:List-ID:From;
	b=bpzw6QBPrbv9+NYwseKqsKn2iqyIqMhD+QI4aYwV4nUCsE989rT1Kj0jgHlA/Rcfc
	 jAmk4Ww2iCbe5vFmIJG8zYZ+YR8xBXZvpvdfqdT0UDh8PMJTstghzsabZwfiwBhkfq
	 WoSDMZ0ujJ7z3FLYgmPzzCKAlkjl2pxQXpZBCceM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728776AbgAUVUf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 21 Jan 2020 16:20:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:58160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728748AbgAUVUf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Jan 2020 16:20:35 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579641635;
        bh=zekrBB8O6IZiWElIkK8EppHgwiH6Z532bfKTj20pOJM=;
        h=Subject:From:Date:To:From;
        b=1FCgVwERqWKakEehu4xAsLUEXG/hoML5yIotEgztVYIio9xzSci0pA1qJdXgSWtW+
         dK/QcZAdzJsrFzUStcd20JZgGbpZ3Rk9q9avTvaXM+54/XrSq77gb7rglAFeNCNZTB
         /n3dif6AR3scS08mO1lL9VAzM5VMCm04aKXHZulk=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157964163538.24474.14088038551185134194.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 21 Jan 2020 21:20:35 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] net: convert suitable drivers to use phy_do_ioctl_running (2020-01-21T21:09:33)
  Superseding: [v1] net: convert suitable drivers to use phy_do_ioctl_running (2020-01-21T21:01:27):
    [net-next] net: convert suitable drivers to use phy_do_ioctl_running


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
