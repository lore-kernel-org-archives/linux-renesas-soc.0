Return-Path: <SRS0=8mZC=3J=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F418C2D0DB
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 20 Jan 2020 13:00:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1319620678
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 20 Jan 2020 13:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579525236;
	bh=GwDpCyi89+/6Ad9CJabN87oCC093fXMO4LCERDPOvPM=;
	h=Subject:From:Date:To:List-ID:From;
	b=ppoG4tqjvucg4Ic3izJWu4pS2TDea8wRtxW1HDbwPTmd22e2xn5mzp1AXphVBEei9
	 ml6hYrS0zNKbnsQVUrmvrWgX5RCkCtNCiuAPzdJ55y0g9QXYIZxSxej09G/7x48fgJ
	 SZzW6uvMRc/j2nv7z81d+BH83rWldxtuphhsHw2g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727130AbgATNAf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 20 Jan 2020 08:00:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:39330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726619AbgATNAf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Jan 2020 08:00:35 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579525235;
        bh=GwDpCyi89+/6Ad9CJabN87oCC093fXMO4LCERDPOvPM=;
        h=Subject:From:Date:To:From;
        b=Z+4Y8PJhPkWLoXg91BlNXNRxLE71IMo0eanBNbKNW5h6uy/QkMyYayJc39is0N3YG
         9EuC9qXoCMuqLrTD3tEWhn0cfAjSX9PqGIceIxPOOjJS3+WnbAl2qiwDmDsqmx5nLQ
         iuvZRAstDkzEDdnd35w8Qp1GLm4vXRehOjnZaDhY=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157952523509.25030.15230256500906976645.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 20 Jan 2020 13:00:35 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] media: rcar_drif: Use dma_request_chan() instead dma_request_slave_channel() (2020-01-20T12:47:54)
  Superseding: [v2] media: rcar_drif: Use dma_request_chan() instead dma_request_slave_channel() (2020-01-20T12:36:31):
    [v2] media: rcar_drif: Use dma_request_chan() instead dma_request_slave_channel()


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
